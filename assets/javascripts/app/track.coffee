
require ['fingerprint'], (Fingerprint2)->

  API = {}

  # amplitude = window.amplitude ||
  #   setUserId: ->

  new Fingerprint2().get (results)->
    amplitude.setUserId results

  trackPage = (title)->
    identifier = ['view', title].join(' ').replace(/\s/g,'_').toUpperCase()
    console.log identifier
    ### `amplitude` is a global variable ###
    amplitude.logEvent identifier

  API.page = trackPage

  API
