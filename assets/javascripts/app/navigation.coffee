define ['react', 'components/navigationComponent', 'postal'], (React, NavigationComponent, Postal)->
  React.render React.createElement(NavigationComponent), document.getElementById 'bbttxu-navbar-collapse'

  channel = Postal.channel()

