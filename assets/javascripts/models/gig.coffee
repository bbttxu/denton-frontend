# gig.coffee

define ['tcomb-validation'], (t)->

  class Gig
    constructor: (@artist, @position, @id)->

    # isValid: ()=>
    #   t.assert not t.Nil.is @artist
    #   t.assert t.Num.is @position
    #   t.assert t.Str.is @id

    # validation model works
    # TODO there is probably a better solution for this, lots of boilerplat
    isValid: ()=>

      # notNullPredicate = (x)->
      #   not x

      # t.NotNull = t.subType t.Nil, notNullPredicate



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
