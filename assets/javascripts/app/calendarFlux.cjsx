# calendarFlux.coffee

define ['jquery', 'react', 'actions/calendarAction', 'stores/calendarStore', 'components/calendarComponent'], ($, React, CalendarAction, CalendarStore, CalendarComponent)->
  component = document.getElementById('calendar')

  React.render <CalendarComponent/>, component

  # CalendarAction()

  # setInterval CalendarAction, 2 * 60 * 1000
