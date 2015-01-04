# date.coffee

define [ "jquery", "app/api", "postal", "templates", "models/show", "models/venue", "models/gig", "models/artist", 'md5'], ($, API, postal, templates, Show, Venue, Gig, Artist, md5)->
  channel = postal.channel()

  lastMD5Hash = undefined

  handleSetDate = (payload)->
    md5hash = md5 JSON.stringify payload.data

    unless false # md5hash is lastMD5Hash


      lastMD5Hash = md5hash

      artists = _.map payload.data.artists, (artist)->
        new Artist artist.name, artist.id

      artists = _.filter artists, (artist)->
        artist.isValid()

      artist_by_id = (id)->
        # _.findWhere artists, id: id
        for artist in artists
          return artist if artist.id is id
        null

      venues = _.map payload.data.venues, (venue)->
        new Venue venue.name, venue.id

      venue_by_id = (id)->
        # _.findWhere venues, id: id
        for venue in venues
          return venue if venue.id is id
        null


      gigs = _.map payload.data.gigs, (gig)->
        artist = artist_by_id gig.artists
        new Gig artist, gig.position, gig.id

      gigs = _.filter gigs, (gig)->
        gig.isValid()


      gig_by_id = (id)->
        # _.findWhere gigs, id: id
        for gig in gigs
          return gig if gig.id is id
        null

      shows = _.map payload.data.shows, (show)->
        venue = venue_by_id show.venues
        show_gigs = _.map show.gigs, (gig)->
          gig_by_id gig

        show_gigs = _.reject show_gigs, (gig)->
          gig is null

        show_gigs = undefined if show_gigs.length is 0

        new Show payload.date, venue, show.starts_at, show.price, show.source, show_gigs, show.time_is_uncertain

      shows = _.filter shows, (show)->
        show.isValid()

      shows = _.sortBy shows, (show)->
        show.starts_at

      shows = _.sortBy shows, (show)->
        show.time_is_unknown

      templated = _.map shows, (show)->
        templates.show show

      if templated.length is 0
        templated = [ templates['no-show']() ]


      $('#shows').fadeOut ()->

        $(this).show()

        $('#shows').html templated.join ""

        $artists = $('ul.artists li', '#featured').fadeIn('fast')

        $shows = $('.show, .meta', '#shows').fadeIn('fast')


  channel.subscribe "set.date", _.throttle handleSetDate, 2000
