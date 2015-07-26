define ['react', 'components/nextShow'], (React, NextShow)->

  {div, h2, small} = React.DOM

  class VenueComponent extends React.Component
    render: ->
      venue = this.props.data

      div {className: "venue"},
        h2 {className: "h3"},
          venue.name
          small {className: "pull-right"},
            NextShow venue: venue

  React.createFactory VenueComponent
