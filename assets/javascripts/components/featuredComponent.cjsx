# featuredComponent.cjsx

define ['postal', 'react', 'moment', 'stores/featuredStore', 'stores/calendarStore','components/dateComponent', 'components/increment', 'components/increment', 'components/showsComponent'], (Postal, React, Moment, updatedStore, calendarStore, DateComponent, PrevComponent, Next, Shows)->

  channel = Postal.channel()

  # Prev = React.createFactory PrevComponent

  Featured = React.createClass

    getInitialState: ->
      date: moment().format 'YYYY-MM-DD'
      calendar: {}

    componentDidMount: ->
      channel.subscribe "set.date", @onDateChange
      channel.subscribe "set.calendar", @onCalendarChange

    componentWillUnmount: ->
      @unsubscribe()

    # onShowTimeElapsed: (data)->
    #   this.setState date: data.date
    #   this.setState data: data.data if data.data
    #   this.setState prev: data.prev
    #   this.setState next: data.next
    #   this.setState updated: data.updated if data.updated


    onDateChange: (data)->
      # console.log "onDateChange", data
      this.setState data: data.data
      this.setState date: data.date

    onCalendarChange: (data)->
      # console.log "onCalendarChange", data
      this.setState calendar: data.data

    render: ()->
      sorted = _.sortBy _.keys(@state.calendar), (day)->
        moment(day)

      prev1 = sorted[(sorted.indexOf(@state.date) - 1)]
      next1 = sorted[(sorted.indexOf(@state.date) + 1)]

      prev = {}
      next = {}

      if prev1 isnt ""
        prev =
          text: "<"
          url: "\#/shows/#{prev1}"


      if next1 isnt ""
        next =
          text: ">"
          url: "\#/shows/#{next1}"


      <div className="day">
        <DateComponent date={this.state.date}/>
        <div className="content">
          <div id="prev">
            <PrevComponent link={prev}/>
          </div>
          <Shows shows={this.state.data} updated={this.state.updated}/>
          <div id="prev">
            <Next link={next}/>
          </div>
        </div>
      </div>

