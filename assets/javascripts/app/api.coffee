# api.coffee
define ["jquery", "underscore", "postal", "lscache"], ($, _, postal, lscache)->
	channel = postal.channel()

	API = {}

	calendar = () ->
		key = "calendar"

		# console.log "cached", lscache.get key
		cachedData = lscache.get key

		if cachedData
			# console.log cachedData
			channel.publish "set.calendar", cachedData

		unless cachedData
			host = "http://denton1.krakatoa.io"
			url = "#{host}/shows/calendar.json?callback=?"
			$.when $.getJSON url, { timestamp: moment().valueOf() }
				.then (data)->
					lscache.set key, { data: data, updated: moment().valueOf() }, 3
					channel.publish "set.calendar", { data: data, updated: moment().valueOf() }

	channel.subscribe "get.calendar", calendar


	date = (date) ->

		key = "date-#{date}"

		cachedData = lscache.get key

		if cachedData
			# console.log cachedData
			channel.publish "set.date", cachedData

		unless cachedData
			host = "http://denton1.krakatoa.io"
			url = "#{host}/shows/calendar.json?callback=?"

			$.when $.getJSON "http://denton1.krakatoa.io/shows/#{date}.json?callback=?", { timestamp: moment().valueOf() }
				.then (data)->
					lscache.set key, { date: date, data: data, updated: moment().valueOf() }, 3
					channel.publish "set.date", { date: date, data: data, updated: moment().valueOf() }


	channel.subscribe "get.date", date

	API
