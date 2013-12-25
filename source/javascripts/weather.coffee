do ( $ = jQuery, U = _, M = moment, S = Sammy )->

  store = new S.Store({name: 'weather', element: 'body', type: 'local'})

  weather = ()->
    store.get 'weather'


  day_or_night = ( today, now = moment().format('X') )->
    asdf =
      dis: "night"
      disnt: "day"

    if (today.sunrise < now and now < today.sunset)
      asdf.dis = "day"
      asdf.disnt = "night"

    asdf

  update = (data)->
    weatherUpdatedAt = store.get 'weatherUpdatedAt'

    # within 6 hours is good enough for now, since we're only concerned with sunrise/sunset
    if ( M().format('X') - weatherUpdatedAt ) > ( 6 * 60 * 60 )
      console.log 'update weather'
      request =
        # url: "https://api.forecast.io/forecast/APIKEY/40.463487,17.248535"
        url: "http://api.openweathermap.org/data/2.5/weather?id=4685907"
        dataType: "jsonp"
        success: (data)->
          store.set 'weather', data
          store.set 'weatherUpdatedAt', M().format('X')
          console.log 'weather updated'
          setBodyClass()

      $.ajax request
    else
      console.log 'NO weather update needed'
      setBodyClass()


  setBodyClass = ()->
    # weather = store.get 'weather'
    console.log 'updating day/night'
    console.log weather().sys
    classes = day_or_night weather().sys
    $('body').addClass classes.dis
    $('body').removeClass classes.disnt

  $(document).ready ()->
    do asdf = ()->
      update()
      setTimeout asdf, 60 * 1000
