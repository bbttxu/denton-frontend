requirejs.config

  paths:
    jquery: "vendor/jquery/jquery"
    'jquery.scrollTo': "lib/jquery.scrollTo"
    'jquery.timespace': "lib/jquery.timespace"
    'jquery.isotope': "vendor/metafizzy/jquery.isotope"
    # 'jquery.fittext': "vendor/davatron5000/jquery.fittext"
    'jquery.slabtext': "vendor/freqDec/jquery.slabtext"

    postal: "vendor/postal.js/postal"
    moment: "vendor/moment/moment"
    twix: 'lib/twix'

    underscore: "vendor/underscore/underscore"
    knockout: "vendor/knockout/knockout"

    sammy: "vendor/sammy/sammy"
    'sammy.google-analytics': "vendor/sammy.google-analytics/sammy.google-analytics"
    'sammy.storage': "vendor/sammy.storage/sammy.storage"
    'sammy.title': "vendor/sammy.title/sammy.title"

    tether: 'vendor/tether'
    shepherd: 'vendor/shepherd-amd'


  shim:
    'sammy':
      deps: [ 'jquery' ]
      exports: "Sammy"
    'sammy.google-analytics': [ 'sammy' ]
    'sammy.storage': [ "sammy" ]
    'sammy.title': [ "sammy" ]
    underscore:
      exports: "_"
    moment:
      exports: "moment"
    twix: ["moment"]
    'jquery.scrollTo': ["jquery"]
    'jquery.timespace': ["jquery"]
    'jquery.isotope': ["jquery"]
    'jquery.slabtext': ["jquery"]
    # 'jquery.fittext': ["jquery"]


# require ["moment"], (moment)->
#   console.log moment().format('ZZ')

require ["app/weather"], ()->
  # console.log "loading weather"

require ["app/api", "postal", "jquery", "knockout", "lib/views/calendarDayViewModel", "lib/views/calendarViewModel", "jquery.timespace"], (API, postal, $, ko, calendarDayViewModel, calendarViewModel)->
  channel = postal.channel()

  calendarView = new calendarViewModel
  ko.applyBindings calendarView, $('#upcoming')[0]

  channel.subscribe "set.calendar", (data)->
    # console.log "calendar is now", data
    days = _.map data, (count, date)->
      new calendarDayViewModel date, count

    days = _.sortBy days, (day)->
      day.id()

    $.when calendarView.days days
      .then ()->
        cb = ()->
          $('li', '#calendar').timespace()
        setTimeout cb, 100

require ["app/api", "postal", "jquery", "knockout", "lib/views/calendarShowsViewModel", "lib/views/gigViewModel", "lib/views/showViewModel", "jquery.isotope"], (API, postal, $, ko, calendarShowsViewModel, gigViewModel, showViewModel)->
  channel = postal.channel()

  featured = new calendarShowsViewModel
  ko.applyBindings featured, $('#featured')[0]

  calendar = []

  sortedCalendarDates = ()->
    dates = _.map calendar, (value, key)->
      key

    _.sortBy dates, (object)-> object

  previousShowDateTo = (date)->
    calendarDates = sortedCalendarDates()
    prev = calendarDates[(calendarDates.indexOf(date) - 1)]
    return prev if prev
    false

  nextShowDateFrom = (date)->
    calendarDates = sortedCalendarDates()
    next = calendarDates[(calendarDates.indexOf(date) + 1)]
    return next if next
    false

  channel.subscribe "set.calendar", (data)->
    calendar = data

  channel.subscribe "set.date", (payload)->
    venue_by_id = (id)->
      for venue in payload.data.venues
        return venue.name if venue.id is id
      null
    venue_by_id = _.memoize venue_by_id

    gig_by_id = (id)->
      for gig in payload.data.gigs
        artist = artist_by_id gig.artists
        return new gigViewModel(artist, gig.position) if gig.id is id
      nil
    gig_by_id = _.memoize gig_by_id

    artist_by_id = (id)->
      for artist in payload.data.artists
        return artist.name if artist.id is id
      null
    artist_by_id = _.memoize artist_by_id

    shows = for show in payload.data.shows
      venue = venue_by_id show.venues

      gigs = for gig in show.gigs
        gig_by_id gig

      new showViewModel show, venue, gigs



    featured.id payload.date
    featured.prevDay previousShowDateTo payload.date
    featured.nextDay nextShowDateFrom payload.date
    featured.shows shows

    # $.when $('ul.artists').each ()->
    #   options = 
    #     maxFontSize: 100
    #     minCharsPerLine: 7
    #     precision: 1
    #   $('li:first', $(this) ).slabText options

    # .done $('ul.shows').isotope('reloadItems').isotope()


require ["app/routes", "moment"], (routes, moment)->
  routes.run "#/shows/" + moment().format('YYYY-MM-DD')
