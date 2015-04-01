# calendarComponent.cjsx

define ['underscore', 'react', 'stores/calendarStore', 'models/day', 'actions/calendarAction', "moment", "twix"], (_, React, CalendarStore, Day, calendarAction, moment, twix)->

  Listing = React.createClass(
    render: ->

      console.log this.props.days

      days = _.map this.props.days, (count, date)->
        new Day date, count

      days = _.groupBy days, (day)->
        day.date

      current = {}

      _.each days, (day, date)->
        current[date] = day[0]


      console.log 'keys', _.keys(current).sort()

      # if days.length > 0

      dates = _.keys(current).sort()

      itr = moment.twix(dates[0], dates[dates.length-1]).iterate('days')
      range = {}
      while itr.hasNext()
        foo = itr.next()
        # range[]

        asdf = foo.format 'YYYY-MM-DD'
        range[asdf] = new Day asdf, 0



      console.log range

      days = _.extend {}, range, current


      # console.log this.state, this.props, daysq
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
