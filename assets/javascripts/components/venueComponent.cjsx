# venueComponent.cjsx

# venuesComponent.cjsx

define ['react', 'components/nextShow'], (React, NextShow)->

  Venue = React.createClass
    render: ->
      venue = this.props.data

      <div className="venue">
        <h2 className="h2">
          {venue.name}
          <small className="pull-right"> <NextShow venue={venue}/></small>
        </h2>
      </div>
