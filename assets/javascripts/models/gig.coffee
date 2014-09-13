# gig.coffee

define ['tcomb-validation'], (t)->

  class Gig
    constructor: (@artist, @position, @id)->

    # validation model works
    # TODO there is probably a better solution for this, lots of boilerplat
    isValid: ()=>

      validations = t.struct
        position: t.Num
        id: t.Str

      # TODO can't figure out how to do the opposite of Nil :/
      invalidations = t.struct
        artist: t.Nil

      data =
        artist: @artist
        position: @position
        id: @id

      t.validate(data, validations).isValid() and not t.validate(data, invalidations).isValid()
