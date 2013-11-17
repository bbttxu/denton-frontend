# app.js.coffee

$ = jQuery
m = moment

artistViewModel = (artist)->
  self = this
  self.name = ko.observable artist.name
  self

gigViewModel = (gig)->
  self = this
  self.id = ko.observable gig.id
  self.position = ko.observable gig.position
  self

showViewModel = (show)->
  self = this
  self.starts_at = ko.observable show.starts_at
  self.css_class = ko.computed ()->
    length = 0
    length = self.artists.length if self.artists
    "count-" + length

  # self.formatted_starts_at = ko.computed ()->
  #   console.log m( self.starts_at() ).format("ddd, hA")
  #   m( self.starts_at() ).format("ddd, hA")


  self

venueViewModel = (venue)->
  self = this
  self.name = ko.observable venue.name
  self


handle_prev_calendar_click = (event)->
  # event.preventDefault()
  $(this).parents('.calendar').prev('.calendar').find('header').trigger 'click'
  $prev = $(this)
  $prev = $prev.prev('.calendar') if $prev.prev '.calendar'
  $.scrollTo( $prev[0] )

handle_next_calendar_click = (event)->
  event.preventDefault()
  $(this).parents('.calendar').next('.calendar').find('header').trigger 'click'
  $.scrollTo( $(this) )

# handle_active_calendar_click = (event)->
#   $(this).parent().find('.active').toggleClass('active')
#   $(this).addClass('active')

handle_expanded_calendar_click = (event)->
  $this = $(this)
  $parent = $(this).parent('.calendar')

  # event.preventDefault()
  # console.log event, this
  $parent.addClass('expanded')

  if $parent.hasClass('expanded')
    $parent.find('.content').slideDown('fast')
  else
    $parent.find('.content').slideUp('fast')


  # options =
  #   # height: 'toggle'
  #   width: "100%"
  #   'margin-left': "0%"

  # if $.data this, 'margin-left'
  #   left = $.data(this, 'margin-left')
  #   $.removeData(this, 'margin-left')
  #   options['margin-left'] = left
  #   # console.log left
  # else
  #   $.data(this, 'margin-left',  $this.css( 'margin-left' ) )

  # if $.data this, 'width'
  #   width = $.data(this, 'width')
  #   $.removeData(this, 'width')
  #   options.width = width
  #   # console.log width
  # else
  #   $.data(this, 'width', $(this).css( 'width' ) )

  # $parent.animate options, 100, 'swing'




show_all_the_data = (d)->

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
    month: moment(value).format("MMMM")
    date: moment(value).format("DD")
    day: moment(value).format('dddd')
    count_class: classes.join(" ")

  d.calendar = dates
    # console.log d.calendar







  ko.applyBindings d, $('#calendar')[0]
  # ko.applyBindings d, $('#welcome')[0]

  $('.calendar .next', $('#calendar')[0] ).on 'click', handle_next_calendar_click
  $('.calendar .prev', $('#calendar')[0] ).on 'click', handle_prev_calendar_click
  # $('.calendar', $('#calendar')[0] ).on 'click', handle_calendar_click
  $('.calendar header', $('#calendar')[0] ).on 'click', handle_expanded_calendar_click
  # $('.calendar', $('#calendar')[0] ).on 'click', handle_active_calendar_click
  # $('.calendar.active', $('#calendar')[0] ).on 'click', handle_calendar_unclick

  $('.calendar').each (i)->
      $(this).find('header').toggleClass('expanded').delay(i * 200).trigger('click').slideDown()


load_all_the_data = (data, status)->
  show_all_the_data data

ajax_all_the_data = ()->
  $.getJSON 'http://denton-api1.blackbeartheory.com:5000/shows.json?callback=?', load_all_the_data

$(document).ready ajax_all_the_data
