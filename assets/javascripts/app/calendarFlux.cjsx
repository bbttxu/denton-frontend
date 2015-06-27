# calendarFlux.coffee

define ['react', 'components/calendarComponent', 'postal'], (React, CalendarComponent, Postal)->
  component = document.getElementById('calendar')

  channel = Postal.channel()

  React.render <CalendarComponent/>, component

  host = "http://denton1.krakatoa.io"

  update = ()->
    onLoad = (data)->
      channel.publish "posts:update", data
      channel.publish "set.calendar", data

    onLoadError = (error)->
      channel.publish "posts:update", data
      channel.publish "set.calendar", data

    $.when($.getJSON("#{host}/shows/calendar.json?callback=?")).done(onLoad).fail(onLoadError)

  update()
  channel.subscribe "posts:get", update
  channel.subscribe "update:calendar", update

