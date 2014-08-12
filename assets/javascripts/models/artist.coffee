# artist.coffee

define ["typogr"], (typogr)->
	class Artist
		constructor: (@name, @id)->

		# provide the name which will avoid 'text widows'
		formattedName: ()=>
			typogr.typogrify @name