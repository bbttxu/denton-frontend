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
    console.log "calendar is now", data
    days = _.map data, (count, date)->
      new calendarDayViewModel date, count

    days = _.sortBy days, (day)->
      day.id()

    # prevDay = previousShowDateTo date
    # nextDay = nextShowDateFrom date

    # featured = new calendarShowsViewModel date, prevDay, nextDay

    $.when calendarView.days days
      .then $('li.day', '#calendar').timespace()

require ["app/api", "postal", "jquery", "knockout", "lib/views/calendarShowsViewModel", "lib/views/gigViewModel", "lib/views/showViewModel"], (API, postal, $, ko, calendarShowsViewModel, gigViewModel, showViewModel)->
  channel = postal.channel()

  featured = new calendarShowsViewModel
  ko.applyBindings featured, $('#featured')[0]

  channel.subscribe "set.date", (data)->
    console.log "handle date data", data

    venue_by_id = (id)->
      for venue in data.venues
        return venue.name if venue.id is id
      null
    venue_by_id = _.memoize venue_by_id

    gig_by_id = (id)->
      for gig in data.gigs
        artist = artist_by_id gig.artists
        return new gigViewModel(artist, gig.position) if gig.id is id
      nil
    gig_by_id = _.memoize gig_by_id

    artist_by_id = (id)->
      for artist in data.artists
        return artist.name if artist.id is id
      null
    artist_by_id = _.memoize artist_by_id


    console.log data.shows

    shows = for show in data.shows
      venue = venue_by_id show.venues

      gigs = for gig in show.gigs
        gig_by_id gig

      new showViewModel show, venue, gigs

    $.when featured.shows shows
      .then $('ul.artists').each ()->
        options = 
          maxFontSize: 100
          minCharsPerLine: 7
          precision: 1
        $('li:first', $(this) ).slabText options
      .then $('ul.shows').isotope()



require ["postal", "jquery", "knockout", "lib/views/calendarDayViewModel", "lib/views/calendarViewModel", "lib/views/calendarShowsViewModel", "lib/views/gigViewModel", "lib/views/showViewModel", "underscore", "sammy", 'sammy.storage', 'sammy.google-analytics', 'sammy.title', 'jquery.timespace', 'jquery.isotope','jquery.slabtext'], (postal, $, ko, calendarDayViewModel, calendarViewModel, calendarShowsViewModel, gigViewModel, showViewModel, _, Sammy, Store, GoogleAnalytics, Title)->
  channel = postal.channel()

  calendar = []



  # calendarView = new calendarViewModel
  # ko.applyBindings calendarView

  # featured = new calendarShowsViewModel

  # sortedCalendarDates = ()->
  #   dates = _.map calendar, (value, key)->
  #     key

  #   _.sortBy dates, (object)-> object

  # previousShowDateTo = (date)->
  #   calendarDates = sortedCalendarDates()

  #   prev = calendarDates[(calendarDates.indexOf(date) - 1)]
  #   return prev if prev
  #   false

  # nextShowDateFrom = (date)->
  #   calendarDates = sortedCalendarDates()

  #   next = calendarDates[(calendarDates.indexOf(date) + 1)]
  #   return next if next
  #   false

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

  # updateCalendar = ()->
  #   $.getJSON 'http://denton1.krakatoa.io/shows/calendar.json?callback=?', { timestamp: moment().format('X') }, (data, status)->
  #     date = moment().format('YYYY-MM-DD')
  #     calendar = data

  #     days = _.map data, (count, date)->
  #       new calendarDayViewModel date, count

  #     days = _.sortBy days, (day)->
  #       day.id()

  #     prevDay = previousShowDateTo date
  #     nextDay = nextShowDateFrom date

  #     featured = new calendarShowsViewModel date, prevDay, nextDay

  #     # calendarView.days days

  # updateCalendar()  

  getShows = (date)->


  routes = Sammy 'body', ()->
    this.use 'GoogleAnalytics'
    this.use 'Title'

    showSection = (selector, callback)->

      effectsCallback = ()->

        # changeTypography = ()->
        #   console.log 'changeTypography'
        #   $('ul.artists').each ()->
        #     options = 
        #       maxFontSize: 100
        #       minCharsPerLine: 7
        #       precision: 1
        #     $('li:first', $(this) ).slabText options
        #     console.log 'changeTypography 1'



        # updateLayout = ()->
        #   console.log 'updateLayout'

        #   $('ul.shows').isotope()

        # updateCalendar = ()->
        #   console.log 'updateCalendar'
        #   # $('li.day', '#calendar').timespace()

        # $.when changeTypography()
        #   # .then updateCalendar()
        #   .done updateLayout()




      $('.primary').not(selector).animate hideOptions, 'fast'
      $(selector).animate showOptions, 'fast', effectsCallback

    this.setTitle ( title )->
      [title, "Denton, TX Showlist", "BBTTXU" ].join(' | ')

    this.get "#/", ()->
      this.title "Calendar"
      channel.publish "get.calendar"
      showSection '#upcoming'

    this.get '#/shows/:date', (req)->
      date = req.params['date']

      channel.publish "get.date", date

      # id = moment(date).format('YYYY-MM-DD')

      # prevDay = previousShowDateTo date
      # nextDay = nextShowDateFrom date

      # featured = new calendarShowsViewModel id, prevDay, nextDay
      # $.getJSON "http://denton1.krakatoa.io/shows/#{id}.json?callback=?", { timestamp: moment().format('X') }, (data, status)->

      #   venue_by_id = (id)->
      #     for venue in data.venues
      #       return venue.name if venue.id is id
      #     null
      #   venue_by_id = _.memoize venue_by_id

      #   gig_by_id = (id)->
      #     for gig in data.gigs
      #       artist = artist_by_id gig.artists
      #       return new gigViewModel(artist, gig.position) if gig.id is id
      #     nil
      #   gig_by_id = _.memoize gig_by_id

      #   artist_by_id = (id)->
      #     for artist in data.artists
      #       return artist.name if artist.id is id
      #     null
      #   artist_by_id = _.memoize artist_by_id


      #   shows = for show in data.shows
      #     venue = venue_by_id show.venues

      #     gigs = for gig in show.gigs
      #       gig_by_id gig

      #     new showViewModel show, venue, gigs

      #   featured.shows shows
        # calendarView.featured featured

        # # callback = ()->
        # #   $('ul.shows').isotope()
        # #   console.log 'callback'



        # # setTimeout callback, 100
        # # setTimeout callback, 1000
      showSection '#featured'



    routes

  $(document).ready ()->
    routes.run "#/shows/" + moment().format('YYYY-MM-DD')
