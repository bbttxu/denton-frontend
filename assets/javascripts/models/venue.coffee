# venue.coffee

define ["tcomb"], (t)->
	class Venue
		constructor: (@name, @id)->
      t.assert t.Str.is @name
      t.assert t.Str.is @id
