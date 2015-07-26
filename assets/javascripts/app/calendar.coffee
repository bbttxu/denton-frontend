define ['react', 'components/calendarComponent', 'postal'], (React, CalendarComponent, Postal)->
  node = document.getElementById('calendar')

  channel = Postal.channel()

  React.render React.createElement(CalendarComponent), node

  channel.publish 'get.calendar'
