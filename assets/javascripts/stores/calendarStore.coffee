# calendarStore.coffee

define ['jquery', 'reflux', 'actions/calendarAction', 'actions/loadCalendarAction', 'postal'], ($, Reflux, calendarAction, loadCalendarAction, Postal)->

  host = "http://denton1.krakatoa.io"


  channel = Postal.channel()




  calendarStore = Reflux.createStore
    init: ->
      # @listenTo calendarAction, @loadCalendar

      channel.subscribe "posts:get", @loadCalendar

    loadCalendar: (data)->
      $.when($.getJSON("#{host}/shows/calendar.json?callback=?")).done(this.onLoad)

    onLoad: (data)->
      this._calendar = data

      # loadCalendarAction this._calendar

      channel.publish "posts:update", this._calendar
      # @trigger this._calendar

    onLoadError: (error)->
      Actions.loadCalendarError(error)
      this._calendar = []

      channel.publish "posts:update", this._calendar
      # @trigger this._calendar
