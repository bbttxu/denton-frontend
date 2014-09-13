# venue.coffee

define ["tcomb-validation"], (t)->
	class Venue
		constructor: (@name, @id)->


    # validation model works
    # TODO there is probably a better solution for this, lots of boilerplat
    isValid: ()=>
      validations = t.struct
        name: t.Str
        id: t.Str

      data =
        name: @name
        id: @id

      t.validate(data, validations).isValid()
