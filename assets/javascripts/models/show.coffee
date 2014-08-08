 # show.coffee

define ["moment"], (moment)->
	class Show
		constructor: (@date, @venue, @starts_at, @price, @source, @gigs)->

		time: ()=>
			moment(@starts_at).zone(moment().format('ZZ')).format "h:mm a"