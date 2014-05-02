# routes.coffee

define ["postal", "jquery", "knockout", "lib/views/calendarDayViewModel", "lib/views/calendarViewModel", "lib/views/calendarShowsViewModel", "lib/views/gigViewModel", "lib/views/showViewModel", "underscore", "sammy", 'sammy.google-analytics', 'sammy.title', 'jquery.timespace', 'jquery.isotope','jquery.slabtext'], (postal, $, ko, calendarDayViewModel, calendarViewModel, calendarShowsViewModel, gigViewModel, showViewModel, _, Sammy, GoogleAnalytics, Title)->

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
      showSection '#upcoming'

    this.get '#/shows/:date', (req)->
      date = req.params['date']

      channel.publish "get.date", date

      showSection '#featured'



