# calendarComponent.cjsx

define ['underscore', 'react', 'stores/calendarStore', 'models/day', 'actions/calendarAction', "moment", "twix"], (_, React, CalendarStore, Day, calendarAction, moment, twix)->

  Listing = React.createClass(
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

      <ul>
        { _.map days, (day)->
          <li className={day.classes()}>
            <a href={day.link()}>
              <span key={"day"} className="day">{day.weekday()}</span>
              <span key={"month"} className="month">{day.month()}</span>
              <span key={"date"} className="date">{day.formatted()}</span>
            </a>
          </li>
        }
      </ul>
  )


  React.createClass(

    getInitialState: ->
      calendar: {}

    componentDidMount: ->
      @unsubscribe = CalendarStore.listen(@onCalendarChange)

    componentWillUnmount: ->
      @unsubscribe()

    onCalendarChange: (data)->
      this.setState calendar: data

    render: ->
      <Listing days={this.state.calendar}/>

  )
