# featured.cjsx

define ['react', 'postal', 'actions/featuredAction', "moment", 'models/date', 'stores/featuredStore', 'components/featuredComponent'], (React, Postal, getFeatured, moment, Date, updatedStore, Featured)->
  channel = Postal.channel()

  channel.subscribe "set.date", (payload)->
    console.log "set.date", payload
    # getFeatured(payload) if payload

  node = document.getElementById "featured"
  render = ()->
    React.render <Featured/>, node
  render()
