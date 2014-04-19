# api.coffee
define ["jquery", "underscore", "postal"], ($, _, postal)->
	channel = postal.channel()

	API = {}
	calendar = () ->
	  host = "http://denton1.krakatoa.io"
	  url = "#{host}/shows/calendar.json?callback=?"
	  $.when $.getJSON url
	  	.then (data)-> 
		  	channel.publish "set.calendar", data

	channel.subscribe "get.calendar", calendar


	date = (date) ->
	  host = "http://denton1.krakatoa.io"
	  url = "#{host}/shows/calendar.json?callback=?"

	  $.when $.getJSON "http://denton1.krakatoa.io/shows/#{date}.json?callback=?", { timestamp: moment().format('X') }
	  	.then (data)-> 
		  	channel.publish "set.date", { date: date, data: data }
	  	
	channel.subscribe "get.date", date	

	API