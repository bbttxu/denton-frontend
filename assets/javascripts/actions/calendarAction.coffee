# calendarAction.coffee

define ['postal', 'reflux'], (Postal, Reflux)->
  channel = Postal.channel()

  # channel.publish "posts:get", {}
  window.doit = Reflux.createAction()
  # ()->
  #   channel.publish "posts:get", {}
