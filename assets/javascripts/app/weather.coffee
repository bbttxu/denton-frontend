# weather.coffee
define ['jquery','underscore', 'moment', 'lscache'], ($, _, moment, store)->

  day_or_night = ( today, now = moment().format('X') )->
    asdf =
      dis: 'night'
      disnt: 'day'

    if (today.sunrise < now and now < today.sunset)
      asdf.dis = 'day'
      asdf.disnt = 'night'

    asdf

  setBodyClass = ()->
    weather = store.get 'weather'
    classes = day_or_night weather.sys
    $('body').addClass classes.dis
    $('body').removeClass classes.disnt

  update = (data)->

    weather = store.get 'weather'

    # console.log 'cached', weather

    if weather
      setBodyClass()

    unless weather
      request =
        # url: 'https://api.forecast.io/forecast/APIKEY/40.463487,17.248535'
        url: 'http://api.openweathermap.org/data/2.5/weather?id=4685907'
        dataType: 'jsonp'
        success: (data)->
          store.set 'weather', data, 6 * 60
          # console.log 'weather updated', data
          setBodyClass()

      $.ajax request

  do refresh = ()->
    update()

    setTimeout refresh, 60 * 1000
