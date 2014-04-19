# storage.coffee

define ["sammy", "sammy.storage"], (Sammy, storage)->
	storage = (options)->
	  new Sammy.Store(options)
	  # local = localStorage
	  #   name: 'bbttxu-denton'
	  #   element: 'body'
	  #   type: 'local'

