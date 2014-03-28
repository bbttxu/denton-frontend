
define ["jquery", "moment", "twix"], ($, moment, twix)->

  # The purpose of this plugin is to pad the space between elements which contain



  # Prerequisites
  # - jQuery for DOM manipulation
  # - moment for time formatting
  do ( $ = jQuery, m = moment ) ->

    # extend jQuery with namespace
    $.fn.extend timespace: (options) ->

      # set default settings
      settings =
        debug: false
      # and merge defaults with passed options
      settings = $.extend(settings, options)


      # basic logging, probably not needed
      log = (msg) ->
        (if typeof console isnt "undefined" and console isnt null then console.log(msg) else undefined) if settings.debug


      #
      fill_time_gap_between = (moment1, moment2, $this) ->
        range = moment.twix(moment1, moment2)

        # do nothing if the dates are the same
        return  if moment1 is moment2

        # do nothing if the previous date _is_ the previous date, no gap to fill
        return  if range.length("days") is 1

        iter = range.iterateInner("days")
        iter.next()
        while iter.hasNext()
          date = iter.next()
          $span = $("<a>").html("<span>" + date.format("MM") + "</span> " + date.format("DD")).attr("href", "#")
          $li = $("<li>").attr("id", date.format("YYYY-MM-DD")).addClass("count-0").append($span)
          $this.before $li


      # iterate over the jQuery object
      @each ->
        $this = $(this)

        # find previous object form current
        $prev = $this.prev()

        # pad to beginning of week if there is no previous date
        earliest = moment().startOf("week")

        # find earliest date if there is a previous element
        earliest = moment($prev.attr("id")) unless $prev.length is 0


        fill_time_gap_between earliest.format("YYYY-MM-DD"), $this.attr("id"), $this
