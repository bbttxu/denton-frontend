requirejs.config
  urlArgs: "bust="+new Date().getTime()
  paths:
    jquery: "vendor/jquery/jquery"
    'jquery.timespace': "lib/jquery.timespace"

    react: 'vendor/react/react'

    postal: "vendor/postal.js/postal"
    moment: "vendor/moment/moment"
    twix: 'vendor/twix/twix'

    underscore: "vendor/underscore/underscore"
    # underscore: "vendor/lodash/lodash.compat"

    sammy: "vendor/sammy/sammy"
    'sammy.google-analytics': "vendor/sammy.google-analytics/sammy.google-analytics"
    'sammy.title': "vendor/sammy.title/sammy.title"

    lscache: 'vendor/pamelafox/lscache'

    # 'jquery.ajax.lscache': 'vendor/brophdog11/jquery.ajax.lscache'
    # 'lscache-extra': 'vendor/brophdog11/lscache-extra'


    'classnames': 'vendor/JedWatson/classnames'


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
    'sammy.google-analytics': [ 'jquery', 'sammy' ]
    'sammy.title': [ 'jquery', 'sammy' ]
    underscore:
      exports: "_"
    twix: ["moment"]
    'jquery.timespace': ["jquery"]
    'tcomb-validation': ['tcomb']

    bootstrap: ['jquery']

    'reflux':
      # deps: [ 'jquery' ]
      exports: "Reflux"

require ["app/featured"], ()->

require ["app/updated"], ()->

require ["app/calendar"], ()->

require ["app/venues"], ()->

# require ["app/next"], ->


require ['moment'], (moment)->
  today = moment().format('YYYY-MM-DD')

  el = document.getElementById('todaysLink');
  el.setAttribute 'href', "#/shows/#{today}"

require ["app/weather"], ()->

require ["app/routes", "moment", "jquery"], (routes, moment, $)->
  $(document).ready ()->
    routes.run "#/shows/" + moment().format('YYYY-MM-DD')

require ["jquery", "bootstrap"], ($)->
  $(document).ready ()->
    $('a', '.navbar-collapse').on 'click', (event)->
      $(this).closest('.navbar-collapse').collapse('hide')

