# api.coffee
define ["jquery", "underscore", "postal", "moment", "app/defaults", "lscache"], ($, _, postal, moment, defaults, lscache)->
  channel = postal.channel()

  API = {}

  host = "http://denton1.krakatoa.io"

  isOutOfDate = (date)->
    moment().subtract(defaults.cache.current, 'minutes').isAfter( moment(date) )




  getCalendar = ()->
    key = "calendar"

    url = "#{host}/shows/calendar.json?callback=?"

    cached = lscache.get key

    updateCalendar = ()->
      $.when $.getJSON url, { timestamp: moment().valueOf() }
        .then (data)->
          payload = { data: data, updated: moment().valueOf() }
          channel.publish "set.calendar", payload

    if cached
      channel.publish "set.calendar", cached
      updateCalendar() if isOutOfDate cached.updated

    unless cached
      updateCalendar()

  channel.subscribe "get.calendar", getCalendar






  getDate = (date) ->
    channel.publish "request.date", date

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

  channel.subscribe "get.date", getDate






  getVenues = ()->
    key = "venues"

    url = "#{host}/venues.json?callback=?"

    cached = lscache.get key

    updateVenues = ()->
      $.when $.getJSON url, { timestamp: moment().valueOf() }
        .then (data)->
          payload = { data: data, updated: moment().valueOf() }
          channel.publish "set.venues", payload
          lscache.set key, payload, defaults.cache.length

    if cached
      channel.publish "set.venues", cached
      updateVenues() if isOutOfDate cached.updated

    unless cached
      updateVenues()

  channel.subscribe "get.venues", getVenues

  API
