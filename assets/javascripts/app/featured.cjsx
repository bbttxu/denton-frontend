# featured.cjsx

define ['react', 'postal', 'underscore', 'actions/featuredAction', "moment", 'models/date', 'stores/featuredStore', 'components/featuredComponent'], (React, Postal, _, getFeatured, moment, Date, updatedStore, Featured)->
  channel = Postal.channel()

  channel.subscribe "set.date", (payload)->
    getFeatured(payload) if payload

  node = document.getElementById "featured"
  render = ()->
    React.render <Featured/>, node
  render()
