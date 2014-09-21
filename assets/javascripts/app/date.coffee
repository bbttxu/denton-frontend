# date.coffee

define [ "jquery", "app/api", "postal", "templates", "models/show", "models/venue", "models/gig", "models/artist", 'md5'], ($, API, postal, templates, Show, Venue, Gig, Artist, md5)->
  channel = postal.channel()

  lastMD5Hash = undefined

  handleSetDate = (payload)->
    # string = JSON.stringify payload.data
    md5hash = md5 JSON.stringify payload.data

    # console.log md5hash, string
    # console.log lastMD5Hash, md5hash is lastMD5Hash

    # if md5hash is lastMD5Hash
    #   console.log 'the same'

    # unless md5hash is lastMD5Hash
    #   lastMD5Hash = md5hash
    #   console.log 'would refresh, update md5'


    unless md5hash is lastMD5Hash

      lastMD5Hash = md5hash

      # console.log 'now the same', md5hash, lastMD5Hash

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

      # g = new Gig 1,1, "1"
      # console.log g


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


      $('#shows').fadeOut ()->
        $(this).show()

        $('#last-updated').html( templates['last-updated']( ago: moment(payload.updated).fromNow() ) )

        $('#shows').html templated.join ""


        $shows = $ '.show', '#shows'

        $shows = _.shuffle $shows

        _.each $shows, (show, showIndex)->

          $artists = $ 'ul.artists li', show

          $artists = _.shuffle $artists

          _.each $artists, (artist, artistIndex)->
            # console.log artist, index
            $(artist).delay((showIndex * 50) + (artistIndex * 50)).slideDown('fast')

          $('.meta', $(show) ).delay(showIndex * 100).slideDown()

        # console.log $shows

        # $artists = $ 'ul.artists li', '#shows'

        # _.each $artists, (artist, index)->
        #   console.log artist, index
        #   $(artist).delay(index * 10).slideDown()

  # clearShows = ()->
      # $(this).empty()



  # channel.subscribe "set.date", (date)->
  #   console.log 'set date', date

  channel.subscribe "set.date", _.throttle handleSetDate, 2000

  # channel.subscribe "get.date", _.throttle clearShows, 300

