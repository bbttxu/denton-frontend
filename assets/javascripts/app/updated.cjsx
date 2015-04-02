# updated.cjsx


define ['postal', 'underscore', 'react', 'reflux', "moment"], (Postal, _, React, Reflux, moment)->

  channel = Postal.channel()


  host = "http://denton1.krakatoa.io"


  window.updateit = Reflux.createAction()
    # preEmit: ()->
    #   console.log arguments

  updatedStore = Reflux.createStore

    init: ->
      phrase = "a"
      @listenTo updateit, @showTimeElapsed

    showTimeElapsed: ->
      # console.log "do it!"
      this.onLoad(arguments)

    onLoad: (data)->
      # console.log 'onLoad', data[0], arguments
      this.phrase =  moment(data[0]).fromNow()
      @trigger this.phrase

    onLoadError: (error)->
      Actions.loadCalendarError(error)
      this._calendar = []
      @trigger this._calendar



  PreviouslyUpdated = React.createClass(

    getInitialState: ->
      phrase: "Figurin' this out"

    componentDidMount: ->
      @unsubscribe = updatedStore.listen(@onShowTimeElapsed)

    componentWillUnmount: ->
      @unsubscribe()

    onShowTimeElapsed: (data)->
      # console.log data
      this.setState phrase: data

    render: ()->
      <p>
        <span className="label">last updated</span>
        <span className="date">{this.state.phrase}</span>
      </p>

  )

  channel.subscribe "set.date", (payload)->
    updateit(payload.updated)

  channel.subscribe "set.calendar", (payload)->
    updateit(payload.updated)

  component = document.getElementById('last-updated')

  render = (payload)->
    # console.log payload
    React.render <PreviouslyUpdated/>, component

  render()
