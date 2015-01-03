# date.coffee

define [ "jquery", "app/api", "postal", "templates", "models/show", "models/venue", "models/gig", "models/artist", 'md5', 'slabtext'], ($, API, postal, templates, Show, Venue, Gig, Artist, md5)->
  channel = postal.channel()

  lastMD5Hash = undefined

  handleSetDate = (payload)->
    md5hash = md5 JSON.stringify payload.data

    unless false # md5hash is lastMD5Hash


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

      if templated.length is 0
        templated = [ templates['no-show']() ]


      $('#shows').fadeOut ()->





        $(this).show()

        # $('#last-updated').html( templates['last-updated']( ago: moment(payload.updated).fromNow() ) )

        $('#shows').html templated.join ""


        $artists = $('ul.artists li', '#featured').fadeIn('fast')
        # $('.show ul.artists', '#shows').each ()->
        #   console.log $(this).find('li').first()
        #   $(this).find('li').first().slabText()

        $shows = $('.show, .meta', '#shows').fadeIn('fast')

        # animation = 100

        # # console.log animation, $artists.length

        # total = 300

        # diff = ( total - (2 * animation) ) / $artists.length

        # # console.log animation, $artists.length, diff

        # # $artists = _.shuffle $artists

        # # $artists = Array.slice.call($artists, 0)
        # # Array.slice.call(listNodes, 0)

        # # console.log $artists

        # # $artists = ($artists).sort()
        # # $artists = ($artists).reverse()

        # _.each $artists, (artist, index)->
        #   # console.log $(artist).length, total - index*diff - animation
        #   # $(artist).slabText()
        #   $(artist).delay( total - index*diff - animation).slideDown(animation)


        # _.each $shows, (show, index)->
        #   $('.meta', show).delay(total).slideDown(animation)

          # $(artist).show()

        # $shows = $ '.show', '#shows'

        # $shows = _.shuffle $shows

        # _.each $shows, (show, showIndex)->

        #   $artists = $ 'ul.artists li', show

        #   $artists = _.shuffle $artists

        #   _.each $artists, (artist, artistIndex)->
        #     # console.log artist, index
        #     $(artist).delay((showIndex * 50) + (artistIndex * 50)).slideDown('fast')

          # $('.meta', $(show) ).delay(showIndex * 100).slideDown()

  channel.subscribe "set.date", _.throttle handleSetDate, 2000
