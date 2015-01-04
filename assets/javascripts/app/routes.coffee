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
    self = this
    self.use 'GoogleAnalytics'
    self.use 'Title'

    showSection = (selector)->
      $('.primary').not(selector).animate hideOptions, 100
      $(selector).animate showOptions, 100

    self.setTitle ( title )->
      [title, "Denton, TX Showlist", "BBTTXU" ].join(' | ')

    self.get "#/", ()->
      self.setTitle "Calendar"

      channel.publish "get.calendar"

      showSection '#upcoming'

    self.get '#/shows/:date', (req)->
      date = req.params['date']

      self.setTitle date

      $('#shows').html(spinner.spin().el)

      # console.log "/shows/#{date}"

      channel.publish "get.date", date

      showSection '#featured'


    self.get "#/venues", (req)->
      $('#venues').html(spinner.spin().el)

      self.setTitle "Upcoming Venues"

      channel.publish "get.venues"

      showSection '#venues'


    self.get "#/venues/:slug", (req)->
      slug = req.params['slug']

      self.setTitle slug


      $('#venues').html(spinner.spin().el)

      channel.publish "get.venue", slug

      showSection '#venues'
