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





	# getShow = (date, cb) ->
	#   host = "http://denton1.krakatoa.io"
	#   url = "#{host}/shows/#{date}.json?callback=?"
	#   await $.getJSON url, defer data
	#   # console.log data
	#   cb data




	# calendar = (date, cb)->
	# 	# await calendar "", defer data
	# 	# data

	# getShows = (dates, cb) ->
	# 	# console.log dates
	#   # out = []
	#   # await 
	#   #   for k,i in dates
	#   #     getShow k, defer out[i]
	#   # cb out

	API.calendar = _.memoize calendar

	API