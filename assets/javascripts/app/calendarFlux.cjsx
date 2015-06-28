# calendarFlux.coffee

define ['react', 'components/calendarComponent', 'postal', 'app/api'], (React, CalendarComponent, Postal, API)->
  component = document.getElementById('calendar')

  channel = Postal.channel()

  React.render <CalendarComponent/>, component

  # update = ()->
  #   channel.publish 'get.calendar'

  # channel.subscribe "set.calendar", render

  channel.publish 'get.calendar'
