# artist.coffee

define ["typogr"], (typogr)->
	class Artist
		constructor: (@name, @id)->

		formattedName: ()=>
			typogr.typogrify @name