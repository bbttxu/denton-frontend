define ['react', 'underscore', 'moment', 'components/venueComponent'], (React, _, moment, Venue)->

  {div, small, h1} = React.DOM

  Venues = React.createClass
    render: ->
      venues = _.reject this.props.data.venues, (venue)->
        venue.next_show == null

      venues = _.sortBy venues, 'next_show'

      div {className: "with-shows"},
        h1 {className: "h3"},
          'Venues'
          small {}, 'w/ upcoming shows'
        _.map venues, (venue)->
          Venue {data: venue, key: venue.id}
