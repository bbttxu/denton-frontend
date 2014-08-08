# routes.coffee

define ["postal", "jquery", "sammy", 'sammy.google-analytics', 'sammy.title', 'spinjs'], (postal, $, Sammy, GoogleAnalytics, Title, Spinner)->

  channel = postal.channel()
  channel.publish "get.calendar"

  # calendar = []

  opts = {}
  spinner = new Spinner(opts).spin()

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

      # $('#calendar').html(spinner.el) if $('#calendar').is(':empty')

      showSection '#upcoming'

    this.get '#/shows/:date', (req)->
      date = req.params['date']

      $('#shows').html(spinner.spin().el)

      channel.publish "get.date", date

      showSection '#featured'



