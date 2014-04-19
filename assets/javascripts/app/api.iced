# api.coffee
define ["jquery", "underscore"], ($, _)->
	calendar = (idk, cb) ->
	  host = "http://denton1.krakatoa.io"
	  url = "#{host}/shows/calendar.json?callback=?"
	  await $.getJSON url, defer data
	  # console.log data
	  cb data

	getShow = (date, cb) ->
	  host = "http://denton1.krakatoa.io"
	  url = "#{host}/shows/#{date}.json?callback=?"
	  await $.getJSON url, defer data
	  # console.log data
	  cb data




	API = {}
	getCalendar = (date, cb)->
		await calendar "", defer data
		data

	getShows = (dates, cb) ->
		# console.log dates
	  out = []
	  await 
	    for k,i in dates
	      getShow k, defer out[i]
	  cb out

	# parallelSearch = (keywords, cb) ->
	#   out = []
	#   await 
	#     for k,i in keywords
	#       search k, defer out[i]
	#   cb out

	# rankPopularity = (keywords, cb) ->
	#   await parallelSearch keywords, defer results
	#   times = for r,i in results
	#     last = r[r.length - 1]
	#     [(new Date last.created_at).getTime(), i]
	#   times = times.sort (a,b) -> b[0] - a[0]
	#   cb (keywords[tuple[1]] for tuple in times)

	# w_list = [ "sun", "rain", "snow", "sleet" ]
	# f_list = [ "tacos", "burritos", "pizza", "shrooms" ]

	# await
	#   rankPopularity w_list, defer weather
	#   rankPopularity f_list, defer food

	# await search "nothing", defer hello

	# # if hello.length
	# console.log hello

	# await 
	# 	calendar(), defer weather

	# if weather
	# 	console.log weather




	# await
	# 	calendar "something", defer calendar

	# # console.log 'calendar', calendar

	# await
	# 	dates = for date, i of calendar
	# 		# console.log date
	# 		date

	# 	# console.log dates
	# 	getShows dates, defer shows

	# # console.log 'shows', shows


	API =
		'getCalendar': (foo, cb)->
			calendar "idk"


	# API.getShows = (dates,)->
	# 	await
	# 		getShows dates, defer
	# 	data



	# return API
