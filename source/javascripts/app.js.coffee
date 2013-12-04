# app.js.coffee

$ = jQuery
m = moment

calendar = []
days = {}
shows_days = {}
local_data = {}



nextShowDateFrom = (date)->
  true

venue_by_id = (id)->
  for venue in local_data.venues
    return venue if venue.id is id
  nil
venue_by_id = _.memoize venue_by_id

# show_by_id = (id)->
#   for show in data.shows
#     return show if show.id is id
#   nil
# show_by_id = _.memoize show_by_id

gig_by_id = (id)->
  for gig in local_data.gigs
    artist = artist_by_id gig.artists
    return new gigViewModel(artist, gig.position) if gig.id is id
  nil
gig_by_id = _.memoize gig_by_id

artist_by_id = (id)->
  for artist in local_data.artists
    return artist.name if artist.id is id
  nil
artist_by_id = _.memoize artist_by_id


# dayViewModel = (day, shows)->
#   self = this
#   self.day = ko.observable(day)
#   self.shows = ko.observableArray(shows)
#   self.mmm = ko.computed ()->
#     moment( self.day() ).format('MM')
#   self.ddd = ko.computed ()->
#     moment( self.day() ).format('dd')
#   self.dd = ko.computed ()->
#     moment( self.day() ).format('DD')
#   self.link = ko.computed ()->
#     "#/shows/" + self.day()

#   self.soonish = ko.computed ()->
#     if (moment().diff(moment(day), 'days') > -10)
#       "soonish"

#   self

# artistViewModel = (artist)->
#   self = this
#   self.name = ko.observable artist.name
#   self


# venueViewModel = (venue)->
#   self = this
#   self.name = ko.observable venue.name
#   self


# showViewModel = (show)->
#   self = this
#   self.starts_at = ko.observable show.starts_at
#   self.venue = ko.observable()
#   self.artists = ko.observable()
#   self.css_class = ko.computed ()->
#     length = 0
#     length = self.artists.length if self.artists
#     "count-" + length

#   self

# sv = undefined


calendar_view = new calendarViewModel
calendar_shows = new calendarShowsViewModel

# showsViewModel = (calendar)->

#   self = this
#   self.calendar = ko.observable( calendar )
#   self.current_date = ko.observable('')
#   self.current_data = ko.observable([])

#   get_show_json = (data)->

#     self.current_data( data )


#     shows = []

#     for show in data.shows

#       new_show = {}
#       sh = show_by_id show.id
#       console.log sh
#       show_view = new showViewModel sh

#       venue = venue_by_id show.venues
#       new_show.venue = venue.name

#       # show_view.venue(venue_view)
#       console.log show_view
#       artist_views = []
#       artists = []
#       for gig_id in show.gigs
#         gig = gig_by_id gig_id

#         artist = artist_by_id gig.artists
#         new_show.artists.push artist
#         artist_view = new artistViewModel( artist )
#         artist_views.push artist_view

#       shows.push new_show

#     # console.log shows

#     sv.current_data( shows )

set_local_data = (data, status)->

initial_ajax = ()->
  $.getJSON 'http://denton.blackbeartheory.com/shows.json?callback=?', (data, status)->
    local_data = data

    days = _.groupBy data.shows, (item)->
      moment(item.starts_at).format("YYYY-MM-DD")

    calendar = _.map days, (value, key)-> key
    calendar.sort
    # console.log calendar

    calendar_days = for day, shows of days
      new calendarDayViewModel day, shows.length

    calendar_view.days calendar_days

    ko.applyBindings calendar_view, $('#upcoming')[0]
    ko.applyBindings calendar_shows, $('#day')[0]

    $('li.day').timespace()

    previousShowDateTo = (date)->
      index = calendar.indexOf(date)
      console.log calendar
      console.log index, calendar[index]
      prev = calendar[(index - 1)]
      return prev if prev
      false

    nextShowDateFrom = (date)->
      index = calendar.indexOf(date)
      console.log calendar
      console.log index, calendar[index]
      next = calendar[(index + 1)]
      return next if next
      false



    routes = Sammy '#calendar', ()->

      this.get '#/shows/:date', (req)->
        $('#day').show()
        $('#calendar').hide()

        date = req.params['date']
        calendar_shows.id(date)

        console.log calendar
        prev = previousShowDateTo date
        calendar_shows.prevDay prev if prev

        next = nextShowDateFrom date
        calendar_shows.nextDay next if next
        console.log next

        shows = for show in days[date]
          venue = venue_by_id show.venues

          gigs = for gig_id in show.gigs
            gig_by_id gig_id

          new showViewModel show, venue.name, gigs

        calendar_shows.shows(shows)

        console.log calendar_shows



      this.get "#/", ()->
        $('#day').hide()
        $('#calendar').show()

    routes.run( "#/shows/" + moment().format('YYYY-MM-DD') )
    # routes.run("#/")
    self


$(document).ready initial_ajax

