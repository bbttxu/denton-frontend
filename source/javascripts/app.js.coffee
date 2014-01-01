# app.js.coffee

$ = jQuery
m = moment

calendar = []
days = {}
shows_days = {}

localData = ()->
  console.log 'localData', store.get 'data'
  stored = store.get 'data'
  return stored if stored
  []

nextShowDateFrom = (date)->
  true

venue_by_id = (id)->
  for venue in localData().venues
    return venue if venue.id is id
  nil
venue_by_id = _.memoize venue_by_id

gig_by_id = (id)->
  for gig in localData().gigs
    artist = artist_by_id gig.artists
    return new gigViewModel(artist, gig.position) if gig.id is id
  nil
gig_by_id = _.memoize gig_by_id

artist_by_id = (id)->
  for artist in localData().artists
    return artist.name if artist.id is id
  nil
artist_by_id = _.memoize artist_by_id

store = new Sammy.Store({name: 'mystore', element: 'body', type: 'local'})

# data = store.get 'data' or []
updatedAt = store.get 'updatedAt' or 0

setupData = (data)->
  console.log 'setupData', data
  if data.shows
    days = _.groupBy data.shows, (item)->
      m(item.starts_at).format("YYYY-MM-DD")
  else
    days = {}

  calendar = _.map days, (value, key)-> key
  calendar.sort()

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


updateData = ()->
  $.getJSON 'http://denton-api1.blackbeartheory.com/shows.json?callback=?', (data, status)->
    store.set 'data', data
    store.set 'updatedAt', m().valueOf()
    calendar_view.updatedAt m().valueOf()
    # start_app()

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

    asdf.shows(shows)
    calendar_view.featured(asdf)

    # calendar_view.featured.valueHasMutated()
    $.scrollTo '#day'
    $('#featured').animate showOptions, 'fast'
    $('#upcoming').animate hideOptions, 'fast'



  this.get "#/", ()->
    this.title "Calendar"
    $('#featured').animate hideOptions, 'fast'
    $('#upcoming').animate showOptions, 'fast'
    $('li.day', '#calendar').timespace()


data = localData()
console.log 'data', data

calendar_view = new calendarViewModel setupData(data), updatedAt



# using jQuery
$(document).ready ()->

  ko.applyBindings calendar_view

  routes.run( "#/shows/" + moment().format('YYYY-MM-DD') )

  updateData()
  do refresh = ()->
    console.log 'refresh'
    now = moment()
    lastUpdated = moment store.get 'updatedAt'
    console.log lastUpdated
    updateData() if ( now.diff( lastUpdated ) ) > ( 5 * 60 * 1000 )

    # if calendar_view.updated_at
    #   calendar_view.updated_at(calendar_view.updated_at())

    setTimeout refresh, 5 * 1000







