define ['react', 'underscore', 'moment'], (React, _, moment)->

  {a, div, h2, small, h1} = React.DOM

  class NextShowComponent extends React.Component
    render: ->
      venue = this.props.venue

      link = "#/shows/#{moment(venue.next_show).format('YYYY-MM-DD')}"

      a {href: link}, moment(venue.next_show).calendar()

  NextShow = React.createFactory NextShowComponent

  class VenueComponent extends React.Component
    render: ->
      venue = this.props.data

      div {className: "venue"},
        h2 {className: "h3"},
          venue.name
          small {className: "pull-right"},
            NextShow venue: venue

  Venue = React.createFactory VenueComponent

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
