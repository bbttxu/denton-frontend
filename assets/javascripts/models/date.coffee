# date.coffee

define ['moment'], (moment)->
  class Date
    constructor: (@date, @shows, @prev, @next)->

    weekday: ()=>
      moment(@date).format "dd"

    weekdayFull: ()=>
      moment(@date).format "dddd"

    month: ()=>
      moment(@date).format "MM"

    monthName: ()=>
      moment(@date).format "MMMM"

    formatted: ()=>
      moment(@date).format "DD"

    classes: ()=>
      classes = []

      classes.push "count-#{@count}"

      # console.log moment(@date).format("MM") % 2
      if moment(@date).format("MM")% 2 is 0
        classes.push "month-even"
      else
        classes.push "month-odd"

      classes.push "soonish" if moment().diff(moment(@date), "days") > -10

      classes.join " "


    calendar: ()=>
      moment(@date).calendar()

    nShows: ()=>
      @shows.length

    url: ()=>
      "#/shows/#{moment(@date).format('ff')}"
