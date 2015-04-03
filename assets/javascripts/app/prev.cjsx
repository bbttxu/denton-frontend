# next.cjsx

# next.cjsx


define ['postal', 'underscore', 'react', 'reflux', "moment", 'actions/calendarAction'], (Postal, _, React, Reflux, moment, calendarAction)->

  channel = Postal.channel()

  window.next = Reflux.createAction()


  updatedStore = Reflux.createStore

    init: ->
      this.link = ""
      this.today = moment().format('YYYY-MM-DD')
      this.calendar = []

      # console.log this.link, this.today, this.calendar

      @listenTo next, @updateToday
      @listenTo calendarAction, @updateCalendar



    updateCalendar: ->
      # console.log "do it!", arguments
      this.onLoadCalendar(arguments)

    onLoadCalendar: (data)->
      calendar = data
      # console.log 'onLoadCalendar', data[0], arguments
      this.calendar = calendar[0].sort() if calendar[0]
      this.reconcile(this.today, this.calendar)

    updateToday: ->
      # console.log "do it!"
      this.onLoad(arguments)

    onLoad: (data)->
      # console.log 'onToday', data[0], arguments
      this.today = data[0]
      this.reconcile(this.today, this.calendar)

    onLoadError: (error)->
      Actions.loadCalendarError(error)
      this._calendar = []

    reconcile: (today, calendar)->
      # console.log 'reconcile', today, calendar
      # console.log 'reconcile', this.today, this.calendar
      # this.today = "#/shows/#{data[0]}"


      sorted = _.sortBy calendar, (day)->
        moment(day)
      prev = sorted[(sorted.indexOf(today) - 1)]
      this.link = ""
      this.link = "\#/shows/#{prev}" if prev
      # console.log this.link

      @trigger this.link





  Prev = React.createClass(

    getInitialState: ->
      link: ""
      text: ""
      today: moment().format('YYYY-MM-DD')
      calendar: []

    componentDidMount: ->
      @unsubscribe = updatedStore.listen(@onShowTimeElapsed)

    componentWillUnmount: ->
      @unsubscribe()

    onShowTimeElapsed: (data)->
      if data is ""
        this.setState
          text: "8"
          link: ""
      else
        this.setState
          text: "<"
          link: data

    render: ()->
      <a href={this.state.link} className="h1">{this.state.text}</a>

  )

  channel.subscribe "set.date", (payload)->
    # console.log 'totally valid', payload.date, payload
    next(payload.date) if payload.date

  channel.subscribe "set.calendar", (payload)->
    # console.log ' next subscribe set calendar', payload.data
    calendarAction(_.keys(payload.data))

  component = document.getElementById('prev')

  render = ()->
    React.render <Prev/>, component


  calendarAction()
  render()

