define ['react', 'components/navigation', 'postal'], (React, NavigationComponent, Postal)->
  React.render React.createElement(NavigationComponent), document.getElementById 'bbttxu-navbar-collapse'

  channel = Postal.channel()

  # channel.publish "get.calendar"
  # channel.publish "get.venues"

