# routes.coffee

define ["postal", "jquery", "sammy", 'sammy.google-analytics', 'sammy.title', 'spinjs'], (postal, $, Sammy, GoogleAnalytics, Title, Spinner)->

  channel = postal.channel()
  channel.publish "touch.calendar"

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

    this.setTitle ( title )->
      [title, "Denton, TX Showlist", "BBTTXU" ].join(' | ')

    this.get "#/", ()->
      this.title "Calendar"

      # $('#calendar').html(spinner.el) if $('#calendar').is(':empty')

      channel.publish "get.calendar"

      showSection '#upcoming'

    this.get '#/shows/:date', (req)->
      date = req.params['date']

      $('#shows').html(spinner.spin().el)

      console.log "/shows/#{date}"

      channel.publish "get.date", date

      showSection '#featured'



