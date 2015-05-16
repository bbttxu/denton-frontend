# updated.cjsx

require ['react', 'components/lastUpdatedComponent', 'postal'], (React, LastUpdatedComponent, Postal)->
  channel = Postal.channel()

  handleSetDate = (data)->
    React.render React.createElement(LastUpdatedComponent, {updated: data.updated}, ), $('#last-updated')[0]

  channel.subscribe "set.date", handleSetDate
