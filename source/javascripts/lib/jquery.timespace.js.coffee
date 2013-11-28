(($, m) ->
  $.fn.extend timespace: (options) ->
    log = undefined
    settings = undefined
    settings =
      option1: true
      option2: false
      debug: false

    settings = $.extend(settings, options)
    log = (msg) ->
      (if typeof console isnt "undefined" and console isnt null then console.log(msg) else undefined)  if settings.debug

    fill_time_gap_between = (moment1, moment2, $this) ->
      console.log moment1, moment2, $this
      range = moment.twix(moment1, moment2)
      return  if moment1 is moment2
      return  if range.length("days") is 1
      iter = range.iterateInner("days")
      iter.next()
      while iter.hasNext()
        date = iter.next()
        $span = $("<a>").html("<span>" + date.format("MMM") + "</span> " + date.format("DD")).attr("href", "#")
        $li = $("<li>").attr("id", date.format("YYYY-MM-DD")).addClass("count-0").append($span)
        $this.before $li

    @each ->
      $this = $(this)
      earliest = moment().startOf("week")
      $prev = $this.prev()
      earliest = moment($prev.attr("id")) unless $prev.length is 0
      fill_time_gap_between earliest.format("YYYY-MM-DD"), $this.attr("id"), $this


) jQuery, moment