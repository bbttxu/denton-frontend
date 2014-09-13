requirejs.config

  paths:
    jquery: "vendor/jquery/jquery"
    'jquery.timespace': "lib/jquery.timespace"

    domReady: 'vendor/requirejs/domReady'

    postal: "vendor/postal.js/postal"
    moment: "vendor/moment/moment"
    twix: 'vendor/twix/twix'

    underscore: "vendor/underscore/underscore"
    # underscore: "vendor/lodash/lodash.compat"

    sammy: "vendor/sammy/sammy"
    'sammy.google-analytics': "vendor/sammy.google-analytics/sammy.google-analytics"
    'sammy.title': "vendor/sammy.title/sammy.title"

    lscache: 'vendor/pamelafox/lscache'

    typogr: 'vendor/ekalinin/typogr'

    spinjs: 'vendor/spin.js/spin'

    pace: 'vendor/pace/pace'

    tcomb: 'vendor/tcomb/index'

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

require ["pace"], (pace)->
  pace.start()

require ["app/weather"], ()->
  # console.log "loading weather"


require ["app/api", "postal", "models/day", "templates", "jquery"], (API, postal, Day, templates, $)->
  channel = postal.channel()

  calendar = []
  # date = undefined



  channel.subscribe "update.calendar", (payload)->
    # console.log "update.calendar", payload
    days = _.map payload.data, (count, date)->
      date

    calendar = _.sortBy days, (date)->
      date

    # console.log "calendar", calendar

  previousShowDateTo = (date)->
    date = moment(date).format('YYYY-MM-DD')
    # console.log "pradadadsfadfa", calendar, date
    prev = calendar[(calendar.indexOf(date) - 1)]
    return new Day(prev, 0) if prev
    false

  nextShowDateFrom = (date)->
    # date = date.format('YYYY-MM-DD')
    next = calendar[(calendar.indexOf(date) + 1)]
    return new Day(next, 0) if next
    false

  # channel.subscribe "update.adjacent", (payload)->
  #   #   console.log payload

  channel.subscribe "set.date", (payload)->
    # console.log "set.date in next/prev", payload.date
    prev = previousShowDateTo moment(payload.date).format('YYYY-MM-DD')
    # console.log "prev", prev
    $('#prev').empty()
    $('#prev').html templates.prev prev if prev

    next = nextShowDateFrom moment(payload.date).format('YYYY-MM-DD')
    # console.log "next", next
    $('#next').empty()
    $('#next').html templates.next next if next

    $('#day').empty()
    $('#day').html templates.header new Day moment(payload.date)



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

      new Show payload.date, venue, show.starts_at, show.price, show.source, show_gigs, show.time_is_uncertain

    shows = _.sortBy shows, (show)->
      show.starts_at

    shows = _.sortBy shows, (show)->
      show.time_is_unknown


    # _.each shows, (show)->
    #   console.log show
    #   _.each show.gigs, (gig)->
    #     console.log 'a', gig.artist

    templated = _.map shows, (show)->
      templates.show show

    $('#last-updated').html( templates['last-updated']( ago: moment(payload.updated).fromNow() ) )

    $('#shows').empty
    $('#shows').html templated.join ""


require ["app/calendar"], ()->
  # load calendar

require ["app/routes", "moment", "domReady"], (routes, moment, domReady)->
  domReady ()->
    routes.run "#/shows/" + moment().format('YYYY-MM-DD')
