# api.coffee
define ["jquery", "underscore", "postal", "moment", "app/defaults", "lscache"], ($, _, postal, moment, defaults, lscache)->
  channel = postal.channel()

  API = {}

  host = "http://denton1.krakatoa.io"


  isOutOfDate = (date)->
    moment().subtract(defaults.cache.current, 'minutes').isAfter( moment(date) )


  # publishData = (channelName)->
  #   (data)->
  #     console.log "publish", channelName, data

  #     postal.publish "#{channelName}", data


  # updateURL = (url, key, cachedCallback, notCachedCallback)->

  #   updateCache = (data)->
  #     lscache.set key, { data: data, updated: moment().valueOf() }, defaults.cache.length

  #   updateFetched = ()->
  #     $.getJSON url, { timestamp: moment().valueOf() }

  #   update = ()->
  #     console.log "fetching", url
  #     $.when(updateFetched).then updateCache

  #   cached = lscache.get key

  #   console.log 'genericAjax', key, cached

  #   if not cached
  #     console.log "not cached"
  #     update()
  #     if notCachedCallback
  #       console.log "notCachedCallback"
  #       notCachedCallback()

  #   console.log cached, cachedCallback
  #   if cached
  #     console.log "cached", cached
  #     if cachedCallback
  #       console.log "cached", cachedCallback
  #       cachedCallback(cached)

  # publishCalendarData = publishData("set.calendar")

  # channel.subscribe "get.calendar", updateURL "#{host}/shows/calendar.json?callback=?", "calendar", publishCalendarData, publishCalendarData
  # channel.subscribe "touch.calendar", updateURL "#{host}/shows/calendar.json?callback=?", "calendar"


  # getCalendar = ()->
  #   key = "calendar"

  #   url = "#{host}/shows/calendar.json?callback=?"

    # cached = lscache.get key

    # console.log 'get.calendar', cached

    # updateCalendar = ()->
    #   # console.log 'get.updateCalendar'
    #   $.when $.getJSON url, { timestamp: moment().valueOf() }
    #     .then (data)->
    #       payload = { data: data, updated: moment().valueOf() }
    #       # lscache.set key, payload, defaults.cache.length
    #       console.log "set.calendar", payload
    #       channel.publish "set.calendar", payload

    # if cached
    #   channel.publish "set.calendar", cached
    #   # if moment().subtract(defaults.cache.current, 'minutes').isAfter( moment(cached.updated) )
    #   updateCalendar() if isOutOfDate cached.updated

    # unless cached
    #   updateCalendar()


  touchCalendar = ()->
    key = "calendar"

    url = "#{host}/shows/calendar.json?callback=?"

    # cached = lscache.get key

    # console.log 'update.calendar'

    updateCalendar = ()->
      # console.log 'updateCalendar'

      fetchCalendar = ()->
        # console.log 'fetchCalendar'
        $.getJSON url, { timestamp: moment().valueOf() }

      loadCalendar = (data)->
        # console.log('loadCalendar', data)
        payload = { data: data, updated: moment().valueOf() }
        # lscache.set key, payload, defaults.cache.length
        # console.log "set.calendar", payload
        channel.publish "set.calendar", payload

      # console.log 'touch.updateCalendar'
      $.when($.getJSON(url)).then(loadCalendar)

    # if cached
    #   channel.publish "update.calendar", cached
    #   # if moment().subtract(defaults.cache.current, 'minutes').isAfter( moment(cached.updated) )
    #   updateCalendar() if isOutOfDate cached.updated

    # unless cached
    updateCalendar()




  # channel.subscribe "get.calendar", getCalendar
  channel.subscribe "update.calendar", touchCalendar


  getDate = (date) ->
    key = "date-#{date}"

    url = "#{host}/shows/#{date}.json?callback=?"

    cached = lscache.get key

    updateDate = (date)->
      $.when $.getJSON url, { timestamp: moment().valueOf() }
        .then (data)->
          payload = { date: date, data: data, updated: moment().valueOf() }
          channel.publish "set.date", payload
          lscache.set key, payload


    ###
    publish cached data if present
    but update if out of date
    ###
    if cached
      channel.publish "set.date", cached
      if isOutOfDate cached.updated
        updateDate(date)

    # ###
    # update because out of date
    # ###
    unless cached
      channel.publish "set.date", date: date, updated: 0, data: {}
      updateDate(date)




  touchDate = (date) ->
    key = "date-#{date}"

    url = "#{host}/shows/#{date}.json?callback=?"

    # cached = lscache.get key

    # console.log 'date cached', key, cached

    updateDate = (date)->

      $.when $.getJSON url, { timestamp: moment().valueOf() }
        .then (data)->
          payload = { data: data, updated: moment().valueOf() }
          # lscache.set key, payload, defaults.cache.length

    ###
    publish cached data if present
    but update if out of date
    ###
    # if cached
    #   # if moment().subtract(defaults.cache.current, 'minutes').isAfter( moment(cached.updated) )
    #   updateDate(date) if isOutOfDate cached.updated

    # ###
    # update because out of date
    # ###
    # unless cached
    #   updateDate(date)


  channel.subscribe "get.date", getDate
  channel.subscribe "touch.date", touchDate

  getVenues = ()->
    key = "venues"

    url = "#{host}/venues.json?callback=?"

    cached = lscache.get key

    updateVenues = ()->
      # console.log 'get.updateCalendar'
      $.when $.getJSON url, { timestamp: moment().valueOf() }
        .then (data)->
          payload = { data: data, updated: moment().valueOf() }
          # lscache.set key, payload, defaults.cache.length
          channel.publish "set.venues", payload

    if cached
      channel.publish "set.venues", cached
      # if moment().subtract(defaults.cache.current, 'minutes').isAfter( moment(cached.updated) )
      updateVenues() if isOutOfDate cached.updated

    unless cached
      updateVenues()

  channel.subscribe "get.venues", getVenues

  getVenue = (slug)->
    key = "venues-#{slug}"

    url = "#{host}/venues/#{slug}.json?callback=?"

    console.log 'get.calendar', cached, key


    # cached = lscache.get key

    console.log 'getVenue', cached, key

    updateVenues = ()->
      # console.log 'get.updateCalendar'
      $.when $.getJSON url, { timestamp: moment().valueOf() }
        .then (data)->
          payload = { data: data, updated: moment().valueOf() }
          # lscache.set key, payload, defaults.cache.length
          channel.publish "set.venue", payload

    # if cached
    #   channel.publish "set.venue", cached
    #   # if moment().subtract(defaults.cache.current, 'minutes').isAfter( moment(cached.updated) )
    #   updateVenues() if isOutOfDate cached.updated

    # unless cached
    #   updateVenues()

  channel.subscribe "get.venue", getVenue



  channel.subscribe "*", (a, b)->
    console.log '*', a, b

  API
