define ['underscore', 'react', 'models/day', 'moment', 'twix', 'postal'], (_, React, Day, moment, twix, Postal)->

  channel = Postal.channel()

  {ul, li, a, span} = React.DOM

  class ListingComponent extends React.Component
    render: ->
      days = _.map this.props.days, (count, date)->
        new Day date, count

      days = _.groupBy days, (day)->
        day.date

      current = {}

      _.each days, (day, date)->
        current[date] = day[0]

      dates = _.keys(current).sort()

      itr = moment.twix(moment().startOf("week"), dates[dates.length-1]).iterate('days')
      range = {}
      while itr.hasNext()
        foo = itr.next()

        asdf = foo.format 'YYYY-MM-DD'
        range[asdf] = new Day asdf, 0

      days = _.extend {}, range, current

      ul {}, _.map days, (day)->
          li {className: day.classes(), key: day.date},
            a {href: day.link()},
              span {key:"day", className:"day"}, day.weekday()
              span {key:"month", className:"month"} ,day.month()
              span {key:"date", className:"date"}, day.formatted()


  Listing = React.createFactory ListingComponent

  React.createClass(

    getInitialState: ->
      calendar: {}

    componentDidMount: ->
      channel.subscribe "set.calendar", @onCalendarChange

    componentWillUnmount: ->
      @unsubscribe()

    onCalendarChange: (data)->
      this.setState calendar: data.data

    render: ->
      Listing {days: this.state.calendar}
  )
