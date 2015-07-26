# artist.coffee

define ["tcomb-validation", "typogr"], (t, typogr)->
  class Artist
    constructor: (@name, @id)->

    # provide the name which will avoid 'text widows'
    formattedName: ()=>
      @name

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
