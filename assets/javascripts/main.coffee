requirejs.config

  paths:
    jquery: "vendor/jquery/jquery"
    'jquery.scrollTo': "lib/jquery.scrollTo"
    'jquery.timespace': "lib/jquery.timespace"
    twix: 'lib/twix'

    sammy: "vendor/sammy/sammy"
    'sammy.google-analytics': "vendor/sammy.google-analytics/sammy.google-analytics"
    'sammy.storage': "vendor/sammy.storage/sammy.storage"
    'sammy.title': "vendor/sammy.title/sammy.title"
    underscore: "vendor/underscore/underscore"
    knockout: "vendor/knockout/knockout"
    moment: "vendor/moment/moment"

  shim:
    # 'foundation':
    #   deps: [ 'jquery' ]
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

    # leaflet:
    #   exports: 'L'
    # 'leaflet.awesome-markers':
    #   deps: [ "leaflet" ]

require ["app/api", "jquery", "knockout", "lib/views/calendarDayViewModel", "lib/views/calendarViewModel", "lib/views/calendarShowsViewModel", "lib/views/gigViewModel", "lib/views/showViewModel", "underscore", "sammy", 'sammy.storage', 'sammy.google-analytics', 'sammy.title', 'jquery.timespace'], (api, $, ko, calendarDayViewModel, calendarViewModel, calendarShowsViewModel, gigViewModel, showViewModel, _, Sammy, Store, GoogleAnalytics, Title)->
  calendar = []
  calendarView = new calendarViewModel
  ko.applyBindings calendarView

  featured = new calendarShowsViewModel


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
      $('.primary').animate hideOptions, 'fast'
      $(selector).animate showOptions, 'fast'

    this.setTitle ( title )->
      [title, "Denton, TX Showlist", "BBTTXU" ].join(' | ')

    this.get "#/", ()->
      this.title "Calendar"
      $.getJSON 'http://denton1.krakatoa.io/shows/calendar.json?callback=?', { timestamp: moment().format('X') }, (data, status)->
        calendar = data

        days = _.map data, (count, date)->
          new calendarDayViewModel date, count

        days = _.sortBy days, (day)->
          day.id()

        calendarView.days days
        $('li.day', '#calendar').timespace()

      showSection '#upcoming'


    this.get '#/shows/:date', (req)->
      date = req.params['date']

      id = moment(date).format('YYYY-MM-DD')

      prevDay = previousShowDateTo date
      nextDay = nextShowDateFrom date

      featured = new calendarShowsViewModel id, prevDay, nextDay

      featured.prevDay prevDay
      featured.nextDay nextShowDateFrom date


      $.getJSON "http://denton1.krakatoa.io/shows/#{id}.json?callback=?", { timestamp: moment().format('X') }, (data, status)->
        featured = new calendarShowsViewModel id

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


        shows = for show in data.shows
          venue = venue_by_id show.venues

          gigs = for gig in show.gigs
            gig_by_id gig

          new showViewModel show, venue, gigs

        featured.shows shows
        calendarView.featured featured

        showSection '#featured'


    routes


  routes.run "#/shows/" + moment().format('YYYY-MM-DD')

# require ["jquery", "moment", "underscore", "sammy", 'sammy.storage', 'sammy.google-analytics', 'sammy.title', "lib/views/calendarViewModel", "lib/views/calendarDayViewModel", "knockout", "lib/views/calendarShowsViewModel", "lib/views/showViewModel", "lib/views/gigViewModel", "jquery.scrollTo", "jquery.timespace"], ($, moment, _, Sammy, Store, GoogleAnalytics, Title, calendarViewModel, calendarDayViewModel, ko, calendarShowsViewModel, showViewModel, gigViewModel)->
#   # app.js.coffee

#   $ = jQuery
#   m = moment

#   calendar = []
#   days = {}
#   shows_days = {}

#   localData = ()->
#     # console.log 'localData', store.get 'data'
#     stored = store.get 'data'
#     return stored if stored
#     []

#   nextShowDateFrom = (date)->
#     true

#   nil = null

#   venue_by_id = (id)->
#     for venue in localData().venues
#       return venue if venue.id is id
#     nil
#   venue_by_id = _.memoize venue_by_id

#   gig_by_id = (id)->
#     for gig in localData().gigs
#       artist = artist_by_id gig.artists
#       return new gigViewModel(artist, gig.position) if gig.id is id
#     nil
#   gig_by_id = _.memoize gig_by_id

#   artist_by_id = (id)->
#     for artist in localData().artists
#       return artist.name if artist.id is id
#     nil
#   artist_by_id = _.memoize artist_by_id

#   store = new Sammy.Store({name: 'mystore', element: 'body', type: 'local'})

#   # data = store.get 'data' or []
#   updatedAt = store.get 'updatedAt' or 0

#   setupData = (data)->
#     # console.log 'setupData', data
#     if data.shows
#       days = _.groupBy data.shows, (item)->
#         m(item.starts_at).format("YYYY-MM-DD")
#     else
#       days = {}

#     calendar = _.map days, (value, key)-> key
#     calendar.sort()

#     # new calendarDayViewModel day, shows.length for day, shows of days



#   updateData = ()->
#     $.getJSON 'http://denton1.krakatoa.io/shows.json?callback=?', { timestamp: moment().format('X') }, (data, status)->
#       store.set 'data', data
#       store.set 'updatedAt', m().valueOf()
#       # calendar_view.updatedAt m().valueOf()
#       # start_app()
#       # $('li.day', '#calendar').timespace()


#   previousShowDateTo = (date)->
#     prev = calendar[(calendar.indexOf(date) - 1)]
#     return prev if prev
#     false

#   nextShowDateFrom = (date)->
#     next = calendar[(calendar.indexOf(date) + 1)]
#     return next if next
#     false

#   routes = Sammy '#calendar', ()->
#     this.use 'GoogleAnalytics'
#     this.use 'Title'

#     this.setTitle ( title )->
#       [title, "Denton, TX Showlist", "BBTTXU" ].join(' | ')

#     this.get '#/shows/:date', (req)->
#       date = req.params['date']
#       # console.log date

#       asdf = new calendarShowsViewModel date


#       asdf.id(date)
#       this.title date

#       asdf.prevDay previousShowDateTo date

#       asdf.nextDay nextShowDateFrom date

#       shows = for show in days[date]
#         venue = venue_by_id show.venues

#         gigs = for gig_id in show.gigs
#           gig_by_id gig_id

#         new showViewModel show, venue.name, gigs

#       asdf.shows(shows)
#       # calendar_view.featured(asdf)

#       # calendar_view.featured.valueHasMutated()
#       $.scrollTo '#day'
#       $('#featured').animate showOptions, 'fast'
#       $('#upcoming').animate hideOptions, 'fast'



#     this.get "#/", ()->
#       this.title "Calendar"
#       $('#featured').animate hideOptions, 'fast'
#       $('#upcoming').animate showOptions, 'fast'
#       $('li.day', '#calendar').timespace()


#   # data = localData()
#   # console.log 'data', data

#   # calendar_view = new calendarViewModel setupData(data), updatedAt



#   # using jQuery
#   $(document).ready ()->

#     # ko.applyBindings calendar_view

#     routes.run( "#/shows/" + moment().format('YYYY-MM-DD') )

#     updateData()
#     do refresh = ()->
#       # console.log 'refresh'
#       now = moment()
#       lastUpdated = moment store.get 'updatedAt' || 0
#       # console.log lastUpdated
#       updateData() if ( now.diff( lastUpdated ) ) > ( 5 * 60 * 1000 )

#       # if calendar_view.updated_at
#       #   calendar_view.updated_at(calendar_view.updated_at())

#       setTimeout refresh, 5 * 1000







