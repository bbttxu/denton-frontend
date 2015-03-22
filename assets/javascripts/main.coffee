requirejs.config
  urlArgs: "bust="+new Date().getTime()
  paths:
    jquery: "vendor/jquery/jquery"
    'jquery.timespace': "lib/jquery.timespace"

    domReady: 'vendor/requirejs/domReady'

    postal: "vendor/postal.js/postal"
    moment: "vendor/moment/moment"
    twix: 'vendor/twix/twix'

    underscore: "vendor/underscore/underscore"
    # underscore: "vendor/lodash/lodash.compat"

    sammy: "vendor/sammy/sammy"
    'sammy.google-analytics': "vendor/sammy.google-analytics/sammy.google-analytics"
    'sammy.title': "vendor/sammy.title/sammy.title"

    lscache: 'vendor/pamelafox/lscache'

    typogr: 'vendor/ekalinin/typogr'

    spinjs: 'vendor/spin.js/spin'

    # pace: 'vendor/pace/pace'

    tcomb: 'vendor/tcomb/index'
    'tcomb-validation': 'vendor/tcomb-validation/index'

    # fittext: 'vendor/FitText.js/jquery.fittext'
    # slabtext: 'vendor/freqDec/jquery.slabtext'

    bootstrap: 'vendor/bootstrap/bootstrap'

  shim:
    'sammy':
      deps: [ 'jquery' ]
      exports: "Sammy"
    'sammy.google-analytics': [ 'sammy' ]
    'sammy.title': [ "sammy" ]
    underscore:
      exports: "_"
    twix: ["moment"]
    'jquery.timespace': ["jquery"]
    'tcomb-validation': ['tcomb']

    bootstrap: ['jquery']

# require ["pace"], (pace)->
#   pace.start()

require ["app/date"], ()->
  # load date

require ["app/venues"], ()->
  # load venues

require ["app/api", "postal", "models/day", "templates", "jquery"], (API, postal, Day, templates, $)->
  channel = postal.channel()

  calendar = []
  # date = undefined





  channel.subscribe "update.calendar", (payload)->
    # console.log "update.calendar", payload
    days = _.map payload.data, (count, date)->
      date

    calendar = _.sortBy days, (date)->
      date

    # console.log "calendar", calendar

  previousShowDateTo = (date)->
    date = moment(date).format('YYYY-MM-DD')
    # console.log "pradadadsfadfa", calendar, date
    prev = calendar[(calendar.indexOf(date) - 1)]
    return new Day(prev, 0) if prev
    false

  nextShowDateFrom = (date)->
    # date = date.format('YYYY-MM-DD')
    next = calendar[(calendar.indexOf(date) + 1)]
    return new Day(next, 0) if next
    false

  # channel.subscribe "update.adjacent", (payload)->
  #   #   console.log payload

  channel.subscribe "set.date", (payload)->
    # console.log "set.date in next/prev", payload.date
    prev = previousShowDateTo moment(payload.date).format('YYYY-MM-DD')

    channel.publish "set.prev", prev
    # console.log "prev", prev
    # $('#prev').empty()
    # $('#prev').html templates.prev prev if prev

    next = nextShowDateFrom moment(payload.date).format('YYYY-MM-DD')
    # console.log "next", next
    # $('#next').empty()
    # $('#next').html templates.next next if next

    channel.publish "set.next", next

    # $('#day').empty()
    # $('#day').html templates.header new Day moment(payload.date)

require ["app/routes", "moment", "domReady"], (routes, moment, domReady)->
  domReady ()->
    routes.run "#/shows/" + moment().format('YYYY-MM-DD')

require ["app/calendar"], ()->
  # load calendar

require ["jquery", "bootstrap"], ($)->

require ["app/weather"], ()->
  # console.log "loading weather"
