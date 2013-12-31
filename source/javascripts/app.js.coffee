# app.js.coffee

$ = jQuery
m = moment

calendar = []
days = {}
shows_days = {}

local_data = ()->
  store.get 'data'

nextShowDateFrom = (date)->
  true

venue_by_id = (id)->
  for venue in local_data().venues
    return venue if venue.id is id
  nil
venue_by_id = _.memoize venue_by_id

gig_by_id = (id)->
  for gig in local_data().gigs
    artist = artist_by_id gig.artists
    return new gigViewModel(artist, gig.position) if gig.id is id
  nil
gig_by_id = _.memoize gig_by_id

artist_by_id = (id)->
  for artist in local_data().artists
    return artist.name if artist.id is id
  nil
artist_by_id = _.memoize artist_by_id

store = new Sammy.Store({name: 'mystore', element: 'body', type: 'local'})

data = store.get 'data' or []
updatedAt = store.get 'updated_at' or null

setupData = (data)->
  days = _.groupBy data.shows, (item)->
    m(item.starts_at).format("YYYY-MM-DD")

  # calendar = _.map days, (value, key)-> key
  # calendar.sort()

  new calendarDayViewModel day, shows.length for day, shows of days

showOptions =
  opacity: 'show'
  margin: 'show'
  padding: 'show'
  height: 'show'

hideOptions =
  opacity: 'hide'
  margin: 'hide'
  padding: 'hide'
  height: 'hide'


initial_ajax = ()->
  $.getJSON 'http://denton-api1.blackbeartheory.com/shows.json?callback=?', (data, status)->
    store.set 'data', data
    store.set 'updated_at', m().format('X')
    calendar_view.updatedAt moment().format('X')
    # start_app()



start_app = ()->
  data = store.get 'data'

  days = _.groupBy data.shows, (item)->
    moment(item.starts_at).format("YYYY-MM-DD")

  calendar = _.map days, (value, key)-> key
  calendar.sort
  # console.log calendar

  calendar_days = for day, shows of days
    new calendarDayViewModel day, shows.length

  calendar_view.days calendar_days

  # ko.applyBindings calendar_shows, $('#day')[0]


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
  this.use 'GoogleAnalytics'
  this.use 'Title'

  this.setTitle ( title )->
    [title, "Denton, TX Showlist", "BBTTXU" ].join(' | ')

  this.get '#/shows/:date', (req)->
    # $('#day').animate showOptions, 'fast'
    # $('#upcoming').animate hideOptions, 'fast'


    date = req.params['date']


    asdf = new calendarShowsViewModel date


    asdf.id(date)
    this.title date

    asdf.prevDay previousShowDateTo date

    asdf.nextDay nextShowDateFrom date

    shows = for show in days[date]
      venue = venue_by_id show.venues

      gigs = for gig_id in show.gigs
        gig_by_id gig_id

      new showViewModel show, venue.name, gigs


    # console.log shows
    asdf.shows(shows)
    calendar_view.current_day asdf
    $.scrollTo '#day'

  this.get "#/", ()->
    this.title "Calendar"
    # $('#day').animate hideOptions, 'fast'
    # $('#upcoming').animate showOptions, 'fast'
    $('li.day', '#calendar').timespace()


calendar_view = new calendarViewModel setupData(data), updatedAt
# calendar_view.current_day new calendarShowsViewModel
# calendar_shows = new calendarShowsViewModel

ko.applyBindings calendar_view

routes.run( "#/shows/" + moment().format('YYYY-MM-DD') )








