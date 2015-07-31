define ['postal', 'react', 'moment', 'components/dateComponent', 'components/increment', 'components/increment', 'components/showsComponent'], (Postal, React, moment, DateComponent, PrevComponent, Next, Shows)->

  {div} = React.DOM

  channel = Postal.channel()

  Featured = React.createClass

    getInitialState: ->
      date: moment().format 'YYYY-MM-DD'
      calendar: {}
      updated: 0

    componentDidMount: ->
      channel.subscribe "request.date", @onDateRequest
      channel.subscribe "set.date", @onDateChange
      channel.subscribe "set.calendar", @onCalendarChange

    componentWillUnmount: ->
      @unsubscribe()

    onDateRequest: (date)->
      this.setState date: date

    onDateChange: (data)->
      if @state.date is data.date
        this.setState updated: data.updated
        this.setState data: data.data

    onCalendarChange: (data)->
      this.setState calendar: data.data

    render: ()->
      sorted = _.sortBy _.keys(@state.calendar), (day)->
        moment(day)

      prev1 = sorted[(sorted.indexOf(@state.date) - 1)]
      next1 = sorted[(sorted.indexOf(@state.date) + 1)]

      prev = {}
      next = {}

      if prev1
        prev =
          text: "<"
          url: "\#/shows/#{prev1}"

      if next1
        next =
          text: ">"
          url: "\#/shows/#{next1}"

      div {className: "day"},
        DateComponent {date: this.state.date}
        div {className: "content"},
          div {id: "prev", className: 'prev'},
            PrevComponent {link: prev}

          Shows {shows: this.state.data, updated: this.state.updated}
          div {id: "next", className: 'next'},
            Next {link: next}

