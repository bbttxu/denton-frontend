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
      .then $('li.day', '#calendar').timespace()

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

require ["postal", "jquery", "knockout", "lib/views/calendarDayViewModel", "lib/views/calendarViewModel", "lib/views/calendarShowsViewModel", "lib/views/gigViewModel", "lib/views/showViewModel", "underscore", "sammy", 'sammy.storage', 'sammy.google-analytics', 'sammy.title', 'jquery.timespace', 'jquery.isotope','jquery.slabtext'], (postal, $, ko, calendarDayViewModel, calendarViewModel, calendarShowsViewModel, gigViewModel, showViewModel, _, Sammy, Store, GoogleAnalytics, Title)->
  channel = postal.channel()
  channel.publish "get.calendar"

  calendar = []

  showOptions =
    opacity: 'show'
    margin: 'show'
    padding: 'show'
    height: 'show'

  hideOptions =
    opacity: 'hide'
    margin: 'hide'
    padding: 'hide'
    height: 'hide'

  routes = Sammy 'body', ()->
    this.use 'GoogleAnalytics'
    this.use 'Title'

    showSection = (selector)->
      $('.primary').not(selector).animate hideOptions, 100
      $(selector).animate showOptions, 100
      # $.when $('.primary').not(selector).hide
      #   .done $(selector).show

    this.setTitle ( title )->
      [title, "Denton, TX Showlist", "BBTTXU" ].join(' | ')

    this.get "#/", ()->
      this.title "Calendar"
      channel.publish "get.calendar"
      showSection '#upcoming'

    this.get '#/shows/:date', (req)->
      date = req.params['date']

      channel.publish "get.date", date

      showSection '#featured'

    routes

  $(document).ready ()->
    routes.run "#/shows/" + moment().format('YYYY-MM-DD')
