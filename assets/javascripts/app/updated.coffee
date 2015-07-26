# updated.cjsx

define ['react', 'components/lastUpdatedComponent', 'postal'], (React, LastUpdatedComponent, Postal)->
  channel = Postal.channel()

  latest = undefined

  handleSetDate = (data)->
    latest = data
    React.render React.createElement(LastUpdatedComponent, {updated: data.updated}, ), $('#last-updated')[0]

  channel.subscribe "set.date", handleSetDate
  channel.subscribe "set.venues", handleSetDate

  cron = (data)->
    # console.log "cron"
    handleSetDate latest

  setInterval cron, 60 * 1000
