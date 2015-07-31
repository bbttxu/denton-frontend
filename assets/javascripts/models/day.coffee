# day.coffee
define ["moment"], (moment)->
  class Day
    constructor: (@date, @count)->

    link: ()=> "#/shows/#{@date}"

    moment: ()=>
      moment(@date)

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

      if moment(@date).format("MM")% 2 is 0
        classes.push "month-even"
      else
        classes.push "month-odd"

      classes.push "soonish" if moment().diff(moment(@date), "days") > -10

      classes.join " "
