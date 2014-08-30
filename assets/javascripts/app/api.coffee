# api.coffee
define ["jquery", "underscore", "postal", "lscache", "moment", "app/defaults"], ($, _, postal, lscache, moment, defaults)->
  channel = postal.channel()

  API = {}

  host = "http://denton1.krakatoa.io"


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


  getCalendar = ()->
    key = "calendar"

    url = "#{host}/shows/calendar.json?callback=?"

    cached = lscache.get key

    # console.log 'get.calendar', cached

    updateCalendar = ()->
      console.log 'get.updateCalendar'
      $.when $.getJSON url, { timestamp: moment().valueOf() }
        .then (data)->
          payload = { data: data, updated: moment().valueOf() }
          lscache.set key, payload, defaults.cache.length
          channel.publish "set.calendar", payload

    if cached
      channel.publish "set.calendar", cached
      if moment().subtract(defaults.cache.current, 'minutes').isAfter( moment(cached.updated) )
        updateCalendar()

    unless cached
      updateCalendar()


  touchCalendar = ()->
    key = "calendar"

    url = "#{host}/shows/calendar.json?callback=?"

    cached = lscache.get key

    # console.log 'touch.calendar', cached

    updateCalendar = ()->
      console.log 'touch.updateCalendar'
      $.when $.getJSON url, { timestamp: moment().valueOf() }
        .then (data)->
          payload = { data: data, updated: moment().valueOf() }
          lscache.set key, payload, defaults.cache.length
          channel.publish "update.calendar", payload
          # channel.publish "update.adjacent", payload

    if cached
      channel.publish "update.calendar", cached
      if moment().subtract(defaults.cache.current, 'minutes').isAfter( moment(cached.updated) )
        updateCalendar()

    unless cached
      updateCalendar()




  channel.subscribe "get.calendar", getCalendar
  channel.subscribe "touch.calendar", touchCalendar


  getDate = (date) ->
    key = "date-#{date}"

    url = "#{host}/shows/#{date}.json?callback=?"

    cached = lscache.get key

    # console.log 'date', cached

    updateDate = (date)->

      $.when $.getJSON url, { timestamp: moment().valueOf() }
        .then (data)->
          payload = { data: data, updated: moment().valueOf() }
          lscache.set key, payload, defaults.cache.length
          channel.publish "set.date", payload
          channel.publish "update.adjacent", date




    ###
    publish cached data if present
    but update if out of date
    ###
    if cached
      channel.publish "set.date", cached
      channel.publish "update.adjacent", date
      if moment().subtract(defaults.cache.current, 'minutes').isAfter( moment(cached.updated) )
        updateDate(date)

    ###
    update because out of date
    ###
    unless cached
      updateDate(date)

    # if cached
    #   channel.publish "set.date", cached
    #   updateDate(date) if moment().subtract("#{defaults.cache.current}", 'minutes').isBefore( moment(cached.updated) )

    # updateDate(date) unless cached




  touchDate = (date) ->
    key = "date-#{date}"

    url = "#{host}/shows/#{date}.json?callback=?"

    cached = lscache.get key

    console.log 'date', cached

    updateDate = (date)->

      $.when $.getJSON url, { timestamp: moment().valueOf() }
        .then (data)->
          payload = { data: data, updated: moment().valueOf() }
          lscache.set key, payload, defaults.cache.length

    ###
    publish cached data if present
    but update if out of date
    ###
    if cached
      if moment().subtract(defaults.cache.current, 'minutes').isAfter( moment(cached.updated) )
        updateDate(date)

    ###
    update because out of date
    ###
    unless cached
      updateDate(date)


  channel.subscribe "get.date", getDate
  channel.subscribe "touch.date", touchDate


  API
