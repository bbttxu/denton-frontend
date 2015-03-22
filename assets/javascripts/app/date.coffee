# date.coffee

define [ "jquery", "app/api", "postal", "templates", "models/date", "models/show", "models/venue", "models/gig", "models/artist", "moment"], ($, API, postal, templates, Date, Show, Venue, Gig, Artist, moment)->
  channel = postal.channel()

  lastMD5Hash = undefined

  next = undefined

  prev = undefined

  translatePayload = (payload)->
    venues = _.collect payload.data.venues, (venue)->
      new Venue venue.name, venue.id

    artists = _.collect payload.data.artists, (artist)->
      new Artist artist.name, artist.id

    gigs = _.collect payload.data.gigs, (gig)->
      artist = _.findWhere artists, id: gig.artists
      new Gig artist, gig.position, gig.id

    shows = _.collect payload.data.shows, (show)->
      showGigs = _.collect show.gigs, (gigID)->
        _.findWhere gigs, id: gigID

      venue = _.findWhere venues, id: show.venues

      new Show moment(show.starts_at).calendar(), venue, show.starts_at, show.price, show.source, showGigs, show.time_is_unknown


  handleSetDate = (payload)->

    shows = translatePayload payload

    date = new Date payload.date, shows, prev, next

    templated = templates.date date

    $('#featured').fadeOut ()->

      $('#last-updated').html( templates['last-updated']( ago: moment(payload.updated).fromNow() ) )

      $('#featured').html templated

      $artists = $('ul.artists li', '#featured').fadeIn('fast')

      $shows = $('.show, .meta', '#featured').fadeIn('fast')

      $(this).fadeIn()


  channel.subscribe "set.date", _.throttle handleSetDate, 100

  channel.subscribe "set.prev", (date)->
    prev = date

  channel.subscribe "set.next", (date)->
    next = date
