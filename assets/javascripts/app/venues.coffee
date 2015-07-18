define ['react', 'components/venuesComponent', 'postal'], (React, VenuesComponent, Postal)->
  channel = Postal.channel()

  latest = undefined

  handleSetDate = (data)->
    latest = data
    React.render React.createElement(VenuesComponent, data, ), $('#venues')[0]

  channel.subscribe "set.venues", handleSetDate

  # channel.publish "get.venues"
