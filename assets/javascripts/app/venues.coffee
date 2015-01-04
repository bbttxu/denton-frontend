# venues.coffee

define [ "jquery", "app/api", "postal", "templates", "models/venue", "models/artist", "models/gig", "models/show"], ($, API, postal, templates, Venue, Artist, Gig, Show)->
  channel = postal.channel()

  showVenues = (payload)->

    upcomingVenues = _.filter payload.data.venues, (venue)->
      venue.shows_count > 0

    venues = _.map upcomingVenues, (venue)->
      new Venue venue.name, venue.id, venue.slug, new Array(venue.shows_count)

    $('#venues').empty().html templates.venues venues: venues

  channel.subscribe "set.venues", showVenues

  showVenue = (payload)->
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

    $('#venues').empty().html templates.venue venue: venues[0], shows: shows

  channel.subscribe "set.venue", showVenue
