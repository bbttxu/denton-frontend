# next.cjsx


define ['postal', 'underscore', 'react', 'reflux', "moment", 'actions/calendarAction'], (Postal, _, React, Reflux, moment, calendarAction)->

  channel = Postal.channel()

  window.next = Reflux.createAction()
  updatedStore = Reflux.createStore

    init: ->
      link = ""
      today = moment().format('YYYY-MM-DD')
      calendar = []

      @listenTo next, @updateToday
      @listenTo calendarAction, @updateCalendar



    updateCalendar: ->
      # console.log "do it!", arguments
      this.onLoadCalendar(arguments)

    onLoadCalendar: (data)->
      # console.log 'onLoadCalendar', data[0], arguments
      this.calendar = data[0] or []
      this.reconcile(this.today, this.calendar)

    updateToday: ->
      # console.log "do it!"
      this.onLoad(arguments)

    onLoad: (data)->
      # console.log 'onLoad', data[0], arguments
      this.today = data[0]
      this.reconcile(this.today, this.calendar)

    onLoadError: (error)->
      Actions.loadCalendarError(error)
      this._calendar = []

    reconcile: (today, calendar)->
      # console.log 'reconcile', today, calendar
      # this.today = "#/shows/#{data[0]}"

      sorted = calendar.sort()
      next = calendar[(calendar.indexOf(today) + 1)]
      this.link = ""
      this.link = "\#/shows/#{next}" if next

      @trigger this.link





  Next = React.createClass(

    getInitialState: ->
      link: ""
      today: moment().format('YYYY-MM-DD')
      calendar: []

    componentDidMount: ->
      @unsubscribe = updatedStore.listen(@onShowTimeElapsed)

    componentWillUnmount: ->
      @unsubscribe()

    onShowTimeElapsed: (data)->
      console.log data



      this.setState link: data

    render: ()->
      <a href={this.state.link} className="h1">»</a>

  )

  channel.subscribe "set.date", (payload)->
    next(payload.date)

  channel.subscribe "set.calendar", (payload)->
    calendarAction(_.keys(payload.data))

  component = document.getElementById('next')

  render = (payload)->
    # console.log payload
    React.render <Next/>, component

  render()

