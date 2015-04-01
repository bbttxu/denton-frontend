# calendarStore.coffee

define ['jquery', 'reflux', 'actions/calendarAction'], ($, Reflux, calendarAction)->

  host = "http://denton1.krakatoa.io"

  calendarStore = Reflux.createStore
    init: ->
      @listenTo calendarAction, @loadCalendar

    loadCalendar: ->
      $.when($.getJSON("#{host}/shows/calendar.json?callback=?")).done(this.onLoad)

    onLoad: (data)->
      this._calendar = data
      console.log this._calendar
      @trigger this._calendar

    onLoadError: (error)->
      Actions.loadCalendarError(error)
      this._calendar = []
      @trigger this._calendar
