define ['postal', 'react', 'moment', 'components/dateComponent', 'components/increment', 'components/increment', 'components/showsComponent'], (Postal, React, Moment, DateComponent, PrevComponent, Next, Shows)->

  {div} = React.DOM

  channel = Postal.channel()

  Featured = React.createClass

    getInitialState: ->
      date: moment().format 'YYYY-MM-DD'
      calendar: {}

    componentDidMount: ->
      channel.subscribe "set.date", @onDateChange
      channel.subscribe "set.calendar", @onCalendarChange

    componentWillUnmount: ->
      @unsubscribe()

    onDateChange: (data)->
      this.setState data: data.data
      this.setState date: data.date

    onCalendarChange: (data)->
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


      div {className: "day"},
        DateComponent {date: this.state.date}
        div {className: "content"},
          div {id: "prev"},
            PrevComponent {link: prev}

          Shows {shows: this.state.data, updated: this.state.updated}
          div {id: "prev"},
            Next {link: next}

