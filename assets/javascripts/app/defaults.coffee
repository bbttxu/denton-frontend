# defaults.coffee

define [], ()->
	defaults =
		cache:
			# minutes
			current: 5
			length: 28 * 24 * 60
