# app.js.coffee

$ = jQuery
m = moment

calendar = []
days = {}
shows_days = {}
local_data = {}

nextShowDateFrom = (date)->
  true

venue_by_id = (id)->
  for venue in local_data.venues
    return venue if venue.id is id
  nil
venue_by_id = _.memoize venue_by_id

gig_by_id = (id)->
  for gig in local_data.gigs
    artist = artist_by_id gig.artists
    return new gigViewModel(artist, gig.position) if gig.id is id
  nil
gig_by_id = _.memoize gig_by_id

artist_by_id = (id)->
  for artist in local_data.artists
    return artist.name if artist.id is id
  nil
artist_by_id = _.memoize artist_by_id

calendar_view = new calendarViewModel
calendar_shows = new calendarShowsViewModel

initial_ajax = ()->
  $.getJSON 'http://denton.blackbeartheory.com/shows.json?callback=?', (data, status)->
    local_data = data

    days = _.groupBy data.shows, (item)->
      moment(item.starts_at).format("YYYY-MM-DD")

    calendar = _.map days, (value, key)-> key
    calendar.sort
    # console.log calendar

    calendar_days = for day, shows of days
      new calendarDayViewModel day, shows.length

    calendar_view.days calendar_days

    ko.applyBindings calendar_view, $('#upcoming')[0]
    ko.applyBindings calendar_shows, $('#day')[0]

    $('li.day').timespace()

    # adjacentCalendarDate = (date, offset) ->
    #   (offset)->
    #     item = calendar[(calendar.indexOf(date) + offset)]
    #     return item if item
    #     false
    # previousShowDateTo = adjacentCalendarDate(date, -1)
    # nextShowDateFrom = adjacentCalendarDate(date, +1)

    previousShowDateTo = (date)->
      prev = calendar[(calendar.indexOf(date) - 1)]
      return prev if prev
      false

    nextShowDateFrom = (date)->
      next = calendar[(calendar.indexOf(date) + 1)]
      return next if next
      false

    routes = Sammy '#calendar', ()->
      this.use('GoogleAnalytics')

      this.get '#/shows/:date', (req)->
        $('#day').show()
        $('#calendar').hide()

        date = req.params['date']
        calendar_shows.id(date)

        calendar_shows.prevDay previousShowDateTo date

        calendar_shows.nextDay nextShowDateFrom date

        shows = for show in days[date]
          venue = venue_by_id show.venues

          gigs = for gig_id in show.gigs
            gig_by_id gig_id

          new showViewModel show, venue.name, gigs

        calendar_shows.shows(shows)

        $.scrollTo '#day'

      this.get "#/", ()->
        $('#day').hide()
        $('#calendar').show()

    routes.run( "#/shows/" + moment().format('YYYY-MM-DD') )
    self


$(document).ready initial_ajax

