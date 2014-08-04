# api.coffee
define ["jquery", "underscore", "postal", "lscache"], ($, _, postal, lscache)->
	channel = postal.channel()

	API = {}

	calendar = () ->
		key = "calendar"

		# console.log "cached", lscache.get key
		cachedData = lscache.get key

		if cachedData

	  	channel.publish "set.calendar", cachedData

		unless cachedData
		  host = "http://denton1.krakatoa.io"
		  url = "#{host}/shows/calendar.json?callback=?"
		  $.when $.getJSON url, { timestamp: moment().unix() }
		  	.then (data)->
		  		lscache.set key, data, 15
			  	channel.publish "set.calendar", data

	channel.subscribe "get.calendar", calendar


	date = (date) ->

		key = "date-#{date}"

		cachedData = lscache.get key

		if cachedData

			channel.publish "set.date", { date: date, data: cachedData }

		unless cachedData
		  host = "http://denton1.krakatoa.io"
		  url = "#{host}/shows/calendar.json?callback=?"

		  $.when $.getJSON "http://denton1.krakatoa.io/shows/#{date}.json?callback=?", { timestamp: moment().unix() }
		  	.then (data)->
		  		lscache.set key, data, 15
			  	channel.publish "set.date", { date: date, data: data }


	channel.subscribe "get.date", date

	API