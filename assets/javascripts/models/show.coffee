 # show.coffee

define ["moment"], (moment)->
  class Show
    constructor: (@date, @venue, @starts_at, @price, @source, @gigs, @time_is_unknown)->

    time: ()=>
      moment(@starts_at).zone(moment().format('ZZ')).format "h:mm a"

    timeIsCertain: ()=>
      @time_is_unknown is false

