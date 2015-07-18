# featuredComponent.cjsx

define ['postal', 'react', 'moment', 'stores/featuredStore', 'stores/calendarStore','components/dateComponent', 'components/prevComponent', 'components/nextComponent', 'components/showsComponent'], (Postal, React, Moment, updatedStore, calendarStore, DateComponent, Prev, Next, Shows)->

  channel = postal.channel()

  Featured = React.createClass

    getInitialState: ->
      date: moment().format 'YYYY-MM-DD'
      calendar: {}

    componentDidMount: ->
      channel.subscribe "set.date", @onDateChange
      channel.subscribe "set.calendar", @onCalendarChange

    componentWillUnmount: ->
      @unsubscribe()

    onShowTimeElapsed: (data)->
      this.setState date: data.date
      this.setState data: data.data if data.data
      this.setState prev: data.prev
      this.setState next: data.next
      this.setState updated: data.updated if data.updated


    onDateChange: (data)->
      console.log "onDateChange", data
      this.setState calendar: data.data

    onCalendarChange: (data)->
      console.log "onCalendarChange", data
      this.setState date: data.data

    render: ()->
      <div className="day">
        <DateComponent date={this.state.date}/>
        <div className="content">
          <Prev prev={this.state.prev}/>
          <Shows shows={this.state.data} updated={this.state.updated}/>
          <Next next={this.state.next}/>
        </div>
      </div>

