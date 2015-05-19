# featuredStore.coffee

define ['underscore', 'reflux', 'actions/featuredAction', 'actions/loadCalendarAction'], (_, Reflux, getFeatured, calendarAction)->

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

      @listenTo calendarAction, @updateCalendar
      @listenTo getFeatured, @getFeatured



    updateCalendar: ->
      # console.log "updateCalendar", arguments
      this.onLoadCalendar(arguments)

    onLoadCalendar: (data)->
      this.calendar = data[0]


      # console.log 'onLoadCalendar', this.calendar, arguments
      # this.calendar = calendar[0].sort() if calendar[0]
      this.reconcile()

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
      # console.log 'reconcile', this.calendar


      sorted = _.sortBy _.keys(this.calendar), (day)->
        moment(day)
      prev = sorted[(sorted.indexOf(this.featured.date) - 1)]
      next = sorted[(sorted.indexOf(this.featured.date) + 1)]

      @trigger _.extend {}, prev: prev, next: next, this.featured

