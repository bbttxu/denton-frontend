requirejs.config

  paths:
    jquery: "vendor/jquery/jquery"
    'jquery.timespace': "lib/jquery.timespace"

    postal: "vendor/postal.js/postal"
    moment: "vendor/moment/moment"
    twix: 'lib/twix'

    underscore: "vendor/underscore/underscore"
    # underscore: "vendor/lodash/lodash.compat"

    sammy: "vendor/sammy/sammy"
    'sammy.google-analytics': "vendor/sammy.google-analytics/sammy.google-analytics"
    'sammy.title': "vendor/sammy.title/sammy.title"

    lscache: 'vendor/pamelafox/lscache'

    typogr: 'vendor/ekalinin/typogr'

    spinjs: 'vendor/spin.js/spin'

  shim:
    'sammy':
      deps: [ 'jquery' ]
      exports: "Sammy"
    'sammy.google-analytics': [ 'sammy' ]
    'sammy.title': [ "sammy" ]
    underscore:
      exports: "_"
    twix: ["moment"]
    'jquery.timespace': ["jquery"]

require ["app/weather"], ()->
  # console.log "loading weather"


require ["app/api", "models/day", "postal", "templates", "moment", "jquery.timespace"], (API, Day, postal, templates, moment)->
  channel = postal.channel()

  channel.subscribe "set.calendar", (payload)->
    days = _.map payload.data, (count, date)->
      new Day date, count

    days = _.sortBy days, (day)->
      day.date

    templated = _.map days, (day)->
      templates['calendar-li'](day)

    $('#last-updated').html( templates['last-updated']( ago: moment(payload.updated).fromNow() ) )

    $('#calendar').html(templated.join(""))
    $('li', '#calendar').timespace()

  channel.publish "get.calendar"

require ["app/api", "postal", "models/day", "templates", "jquery"], (API, postal, Day, templates, $)->
  channel = postal.channel()

  calendar = []

  channel.subscribe "set.calendar", (payload)->
    days = _.map payload.data, (count, date)->
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
    $('#prev').html templates.prev prev if prev

    next = nextShowDateFrom payload.date
    $('#next').empty()
    $('#next').html templates.next next if next

    $('#day').empty()
    $('#day').html templates.header new Day payload.date



require [ "jquery", "app/api", "postal", "templates", "models/show", "models/venue", "models/gig", "models/artist"], ($, API, postal, templates, Show, Venue, Gig, Artist )->
  channel = postal.channel()

  channel.subscribe "set.date", (payload)->
    artists = _.map payload.data.artists, (artist)->
      new Artist artist.name, artist.id

    artist_by_id = (id)->
      # _.findWhere artists, id: id
      for artist in artists
        return artist if artist.id is id
      null

    venues = _.map payload.data.venues, (venue)->
      new Venue venue.name, venue.id

    venue_by_id = (id)->
      # _.findWhere venues, id: id
      for venue in venues
        return venue if venue.id is id
      null

    gigs = _.map payload.data.gigs, (gig)->
      artist = artist_by_id gig.artists
      new Gig artist, gig.position, gig.id


    gig_by_id = (id)->
      # _.findWhere gigs, id: id
      for gig in gigs
        return gig if gig.id is id
      id

    shows = _.map payload.data.shows, (show)->
      venue = venue_by_id show.venues
      show_gigs = _.map show.gigs, (gig)->
        gig_by_id gig

      new Show payload.date, venue, show.starts_at, show.price, show.source, show_gigs


    templated = _.map shows, (show)->
      templates.show show

    $('#last-updated').html( templates['last-updated']( ago: moment(payload.updated).fromNow() ) )

    $('#shows').empty
    $('#shows').html templated.join ""


require ["app/routes", "moment"], (routes, moment)->
  routes.run "#/shows/" + moment().format('YYYY-MM-DD')
