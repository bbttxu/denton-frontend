# featuredStore.coffee

define ['jquery', 'reflux', 'actions/featuredAction'], ($, Reflux, getFeatured)->

  host = "http://denton1.krakatoa.io"

  updatedStore = Reflux.createStore

    init: ->
      this.link = ""
      this.next = ""
      this.prev = ""
      this.today = moment().format('YYYY-MM-DD')
      this.calendar = []
      this.shows = {}
      this.featured = {}

      # console.log this.link, this.today, this.calendar

      # @listenTo calendarAction, @updateCalendar
      @listenTo getFeatured, @getFeatured



    # updateCalendar: ->
    #   # console.log "do it!", arguments
    #   this.onLoadCalendar(arguments)

    # onLoadCalendar: (data)->
    #   calendar = data
    #   # console.log 'onLoadCalendar', data[0], arguments
    #   this.calendar = calendar[0].sort() if calendar[0]
    #   this.reconcile(this.today, this.calendar)

    getFeatured: ->
      # console.log "do it!"
      this.onLoad(arguments)

    onLoad: (data)->
      # console.log 'onToday', data[0], arguments
      this.featured = data[0]
      this.reconcile()

    onLoadError: (error)->
      Actions.loadCalendarError(error)
      this._calendar = []

    reconcile: ()->
      # console.log 'reconcile',
      # console.log 'reconcile', this.today, this.calendar
      # this.today = "#/shows/#{data[0]}"
      # console.log 'from store out to the world', this.featured


      @trigger this.featured

