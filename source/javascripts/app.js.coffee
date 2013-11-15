# app.js.coffee

$ = jQuery

show_all_the_data = (d)->

  artistViewModel = (artist)->
    self = this
    self.name = ko.observable artist.name
    self

  gigViewModel = (gig)->
    this.id = ko.observable gig.id
    this.position = ko.observable gig.position



  venue_by_id = (id)->
    for venue in d.venues
      return venue if venue.id is id
    nil
  venue_by_id = _.memoize venue_by_id

  show_by_id = (id)->
    for show in d.shows
      return show if show.id is id
    nil
  show_by_id = _.memoize show_by_id

  gig_by_id = (id)->
    for gig in d.gigs
      return gig if gig.id is id
    nil
  gig_by_id = _.memoize gig_by_id

  artist_by_id = (id)->
    for artist in d.artists
      return artist if artist.id is id
    nil
  artist_by_id = _.memoize artist_by_id


  handle_prev_calendar_click = (event)->
    event.preventDefault()
    # console.log 'hello'
    # $(this).parents('.calendar').trigger('click')
    $(this).parents('.calendar').prev('.calendar').trigger 'click'
    $prev = $(this)
    $prev = $prev.prev('.calendar') if $prev.prev '.calendar'
    $.scrollTo( $prev[0] )

  handle_next_calendar_click = (event)->
    event.preventDefault()
    # console.log 'bye'
    # $(this).parents('.calendar').trigger('click')
    $(this).parents('.calendar').next('.calendar').trigger 'click'
    $.scrollTo( $(this) )



  handle_calendar_click = (event)->
    event.preventDefault()
    # console.log event, this
    $(this).toggleClass('expanded')
    $(this).siblings('.active').toggleClass('active')

    $(this).find('.content').slideToggle 'fast'

    options =
      # height: 'toggle'
      width: "100%"
      'margin-left': 0

    if $.data this, 'margin-left'
      left = $.data(this, 'margin-left')
      $.removeData(this, 'margin-left')
      options['margin-left'] = left
      # console.log left
    else
      $.data(this, 'margin-left', $(this).css( 'margin-left' ) )

    if $.data this, 'width'
      width = $.data(this, 'width')
      $.removeData(this, 'width')
      options.width = width
      # console.log width
    else
      $.data(this, 'width', $(this).css( 'width' ) )

    $(this).toggleClass('active').animate options, 100, 'swing'




  showViewModel = (show)->
    self = this
    self.starts_at = ko.observable show.starts_at
    self

  venueViewModel = (venue)->
    self = this
    self.name = ko.observable venue.name
    self




  calendar = _.groupBy d.shows, (item)->
    moment(item.starts_at).format("YYYY-MM-DD")

  dates = _.map calendar, (key, value, item)->
    classes = []
    classes.push 'count-' + key.length
    classes.push 'day-' + moment(value).format("ddd").toLowerCase()
    classes.push 'soon' if moment().diff(moment(value), 'days') > -10

    show_views = []

    for show in key
      sh = show_by_id show.id
      # console.log sh
      show_view = new showViewModel sh


      venue = venue_by_id show.venues
      # console.log venue
      venue = new venueViewModel venue

      # console.log venue

      show.venue = venue

      show.artists = []


      # console.log venue_by_id show.venues
      for gig_id in show.gigs
        gig = gig_by_id gig_id
        # gig = new gigViewModel gig


        artist = artist_by_id gig.artists
        artist_view = new artistViewModel( artist )
        # console.log artist
        show.artists.push artist_view


    id: value
    count: key
    month: moment(value).format("MMM")
    date: moment(value).format("DD")
    day: moment(value).format('ddd')
    count_class: classes.join(" ")

  d.calendar = dates
  # console.log d.calendar

  ko.applyBindings d, $('#calendar')[0]
  # ko.applyBindings d, $('#welcome')[0]

  $('.calendar .next', $('#calendar')[0] ).on 'click', handle_next_calendar_click
  $('.calendar .prev', $('#calendar')[0] ).on 'click', handle_prev_calendar_click
  $('.calendar', $('#calendar')[0] ).on 'click', handle_calendar_click
  # $('.calendar.active', $('#calendar')[0] ).on 'click', handle_calendar_unclick



load_all_the_data = (data, status)->
  show_all_the_data data

ajax_all_the_data = ()->
  $.getJSON 'http://denton-api1.blackbeartheory.com:5000/shows.json?callback=?', load_all_the_data

$(document).ready ajax_all_the_data
