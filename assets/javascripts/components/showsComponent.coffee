# showsComponent.cjsx

define ['react', 'models/venue', 'models/artist', 'models/gig', 'models/show', 'classnames', 'moment'], (React, Venue, Artist, Gig, Show, cx, moment)->

  {div, ul, li, h6, span, a} = React.DOM

  class Shows extends React.Component

    render: ()->

      payload = this.props.shows

      translatePayload = (payload)->
        venues = _.collect payload.venues, (venue)->
          new Venue venue.name, venue.id

        artists = _.collect payload.artists, (artist)->
          new Artist artist.name, artist.id

        gigs = _.collect payload.gigs, (gig)->
          artist = _.findWhere artists, id: gig.artists
          new Gig artist, gig.position, gig.id

        shows = _.collect payload.shows, (show)->
          showGigs = _.collect show.gigs, (gigID)->
            _.findWhere gigs, id: gigID

          venue = _.findWhere venues, id: show.venues

          new Show moment(show.starts_at).calendar(), venue, show.starts_at, show.price, show.source, showGigs, show.time_is_unknown, show.id

      payload = translatePayload payload if payload


      classes = cx
        shows: true
        current: moment(this.props.updated).isAfter(moment().subtract(5, 'minutes'))
        'out-of-date': moment(this.props.updated).isBefore(moment().subtract(24, 'hours'))


      div {className: "shows"},
        ul {id: "shows", className: classes}, _.map payload, (show)->
          li {className: "show", key: show.id},
            div {className: 'meta'},
              h6 {className: 'h5'},
                a {href: show.source},
                  span {className: 'time'}, show.time()
                  span {className: 'subhead venue'}, show.venue.name
                  span {className: 'price is right'}, show.price

            div {className: 'artists list-unstlyed'},
              ul {className: 'artists'}, _.map show.gigs, (gig)->
                li {key: gig.id}, gig.artist.formattedName()

  React.createFactory Shows

