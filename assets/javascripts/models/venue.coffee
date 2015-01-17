# venue.coffee

define ["tcomb-validation", "moment", "typogr"], (t, moment, typogr)->
  class Venue
    constructor: (@name, @id, @slug, @shows, @data)->
    # validation model works
    # TODO there is probably a better solution for this, lots of boilerplat

    date: ()=>
      @data.next_show || null

    next: ()=>
      typogr.typogrify moment(@data.next_show).calendar() || null

    nextLink: ()=>
      formatted = moment(@data.next_show).format('YYYY-MM-DD') || null

      "#/shows/#{formatted}"

    isValid: ()=>
      validations = t.struct
        name: t.Str
        id: t.Str

      data =
        name: @name
        id: @id

      t.validate(data, validations).isValid()


