requirejs.config

	paths:
		jquery: "vendor/jquery/jquery"
		'jquery.timespace': "lib/jquery.timespace"

		postal: "vendor/postal.js/postal"
		moment: "vendor/moment/moment"
		twix: 'lib/twix'

		# knockout: "vendor/knockout/knockout"

		underscore: "vendor/underscore/underscore"
		# underscore: "vendor/lodash/lodash.compat"

		sammy: "vendor/sammy/sammy"
		'sammy.google-analytics': "vendor/sammy.google-analytics/sammy.google-analytics"
		'sammy.title': "vendor/sammy.title/sammy.title"

		lscache: 'vendor/pamelafox/lscache'

		typogr: 'vendor/ekalinin/typogr'

	shim:
		'sammy':
			deps: [ 'jquery' ]
			exports: "Sammy"
		'sammy.google-analytics': [ 'sammy' ]
		'sammy.title': [ "sammy" ]
		underscore:
			exports: "_"
		moment:
			exports: "moment"
		twix: ["moment"]
		'jquery.timespace': ["jquery"]

require ["app/weather"], ()->
	# console.log "loading weather"


require ["app/api", "models/day", "postal", "templates", "moment", "jquery.timespace"], (API, Day, postal, templates, moment)->
	channel = postal.channel()

	channel.subscribe "set.calendar", (data)->

		days = _.map data, (count, date)->
			new Day date, count

		days = _.sortBy days, (day)->
			day.date

		templated = _.map days, (day)->
			templates['calendar-li'](day)

		$('#calendar').html(templated.join(""))
		$('li', '#calendar').timespace()


require ["app/api", "postal", "models/day", "templates", "jquery"], (API, postal, Day, templates, $)->
	channel = postal.channel()

	calendar = []

	channel.subscribe "set.calendar", (data)->
		days = _.map data, (count, date)->
			date

		calendar = _.sortBy days, (date)->
			date

	previousShowDateTo = (date)->
		prev = calendar[(calendar.indexOf(date) - 1)]
		return new Day(prev, 0) if prev
		false

	nextShowDateFrom = (date)->
		next = calendar[(calendar.indexOf(date) + 1)]
		return new Day(next, 0) if next
		false

	channel.subscribe "set.date", (payload)->
		prev = previousShowDateTo payload.date
		$('#prev').empty()
		$('#prev').html templates['prev'] prev if prev

		next = nextShowDateFrom payload.date
		$('#next').empty()
		$('#next').html templates['next'] next if next

		$('#day').empty()
		$('#day').html templates['header'] new Day payload.date



require [ "jquery", "app/api", "postal", "templates", "models/show", "models/venue", "models/gig", "models/artist"], ($, API, postal, templates, Show, Venue, Gig, Artist )->
	channel = postal.channel()

	channel.subscribe "set.date", (payload)->
		artists = _.map payload.data.artists, (artist)->
			new Artist artist.name, artist.id

		artist_by_id = (id)->
			# _.findWhere artists, id: id
			# console.log "artists"
			for artist in artists
				# console.log id, artist.id, id is artist.id
				return artist if artist.id is id
			null

		venues = _.map payload.data.venues, (venue)->
			new Venue venue.name, venue.id

		venue_by_id = (id)->
			# _.findWhere venues, id: id
			# console.log "venues"
			for venue in venues
				# console.log id, venue.id, id is venue.id
				return venue if venue.id is id
			null

		gigs = _.map payload.data.gigs, (gig)->
			artist = artist_by_id gig.artists
			new Gig artist, gig.position, gig.id


		gig_by_id = (id)->
			# _.findWhere gigs, id: id
			# console.log "gigs"
			for gig in gigs
				# console.log id, gig.id, id is gig.id
				return gig if gig.id is id
			id

		shows = _.map payload.data.shows, (show)->
			venue = venue_by_id show.venues

			gigs = _.map show.gigs, (gig)->
				gig_by_id gig

			new Show payload.date, venue, show.starts_at, show.price, show.source, gigs

		templated = _.map shows, (show)->
			# console.log show
			templates['show'] show

		# console.log templated

		$('#shows').empty
		$('#shows').html templated.join ""


# require ["app/api", "postal", "jquery", "knockout", "lib/views/calendarShowsViewModel", "lib/views/gigViewModel", "lib/views/showViewModel"], (API, postal, $, ko, calendarShowsViewModel, gigViewModel, showViewModel)->
#   channel = postal.channel()

#   featured = new calendarShowsViewModel
#   ko.applyBindings featured, $('#featured')[0]

#   calendar = []

#   sortedCalendarDates = ()->
#     dates = _.map calendar, (value, key)->
#       key

#     _.sortBy dates, (object)-> object

#   previousShowDateTo = (date)->
#     calendarDates = sortedCalendarDates()
#     prev = calendarDates[(calendarDates.indexOf(date) - 1)]
#     return prev if prev
#     false

#   nextShowDateFrom = (date)->
#     calendarDates = sortedCalendarDates()
#     next = calendarDates[(calendarDates.indexOf(date) + 1)]
#     return next if next
#     false

#   channel.subscribe "set.calendar", (data)->
#     calendar = data

#   channel.subscribe "set.date", (payload)->
#     venue_by_id = (id)->
#       for venue in payload.data.venues
#         return venue.name if venue.id is id
#       null
#     venue_by_id = _.memoize venue_by_id

#     gig_by_id = (id)->
#       for gig in payload.data.gigs
#         artist = artist_by_id gig.artists
#         return new gigViewModel(artist, gig.position) if gig.id is id
#       nil
#     gig_by_id = _.memoize gig_by_id

#     artist_by_id = (id)->
#       for artist in payload.data.artists
#         return artist.name if artist.id is id
#       null
#     artist_by_id = _.memoize artist_by_id

#     shows = for show in payload.data.shows
#       venue = venue_by_id show.venues

#       gigs = for gig in show.gigs
#         gig_by_id gig

#       new showViewModel show, venue, gigs

#     featured.id payload.date
#     # featured.prevDay previousShowDateTo payload.date
#     # featured.nextDay nextShowDateFrom payload.date
#     featured.shows shows

require ["app/routes", "moment"], (routes, moment)->
	routes.run "#/shows/" + moment().format('YYYY-MM-DD')
