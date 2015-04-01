# calendarComponent.cjsx

define ['underscore', 'react', 'stores/calendarStore', 'models/day', 'actions/calendarAction'], (_, React, CalendarStore, Day, calendarAction)->

  Listing = React.createClass(
    render: ->
      days = _.map this.props.days, (count, date)->
        new Day date, count

      days = _.sortBy days, (day)->
        day.date

      # console.log this.state, this.props, days
      <ul className="calendar">
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
      console.log 'onCalendarChange', data
      this.setState calendar: data

    render: ->
      # console.log this.state.calendar
      <Listing days={this.state.calendar}/>
      # React.DOM.h1 {onClick: calendarAction}, 'Gem is ' + _.keys(this.state.calendar).length

  )
