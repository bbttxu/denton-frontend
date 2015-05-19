# nextShow.cjsx

define ['react', 'moment'], (React, moment)->

  NextShow = React.createClass
    render: ->
      venue = this.props.venue

      link = "#/shows/#{moment(venue.next_show).format('YYYY-MM-DD')}"

      <a href={link}>{moment(venue.next_show).calendar()}</a>
