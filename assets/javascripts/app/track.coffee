
require ['fingerprint'], (Fingerprint2)->
  new Fingerprint2().get (results)->
    amplitude.setUserId results

  trackPage = (title)->
    identifier = ['view', title].join(' ').replace(/\s/g,'_').toUpperCase()
    ### `amplitude` is a global variable ###
    amplitude.logEvent identifier

  tracking =
    page: trackPage
