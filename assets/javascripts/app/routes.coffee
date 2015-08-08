# routes.coffee

define ["postal", "jquery", "sammy", 'sammy.google-analytics', 'sammy.title', 'spinjs', 'app/featured', 'app/api'], (postal, $, Sammy, GoogleAnalytics, Title, Spinner)->

  identify = (parts)->
    identifier = ['view'].concat(parts).join(' ').replace(/\s/g,'_').toUpperCase()
    # console.log identifier
    amplitude.logEvent identifier

  channel = postal.channel()

  channel.publish "get.calendar"

  opts =
    color: '#333'
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
      $(selector).animate showOptions, 300

    self.setTitle ( title )->
      [title, "Denton, TX Showlist", "BBTTXU" ].join(' | ')


    self.get "#/", ()->
      self.setTitle "Calendar"

      channel.publish "get.calendar"

      showSection '#upcoming'

      identify ['upcoming']


    self.get '#/shows/:date', (req)->
      date = req.params.date

      self.setTitle date

      channel.publish "get.date", date

      showSection '#featured'

      identify ['date', date]


    self.get "#/venues", (req)->
      self.setTitle "Upcoming Venues"

      channel.publish "get.venues"

      showSection '#venues'

      identify ['venues']


    self.get "#/venues/:slug", (req)->
      slug = req.params.slug

      self.setTitle slug

      channel.publish "get.venue", slug

      showSection '#venues'

      identify ['venues', slug]
