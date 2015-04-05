# featured.cjsx

define ['postal', 'underscore', 'react', 'reflux', "moment", 'models/date', 'components/dateComponent'], (Postal, _, React, Reflux, moment, Date, DateComponent)->

  channel = Postal.channel()

  window.getFeatured = Reflux.createAction()

  updatedStore = Reflux.createStore

    init: ->
      this.link = ""
      this.next = ""
      this.prev = ""
      this.today = moment().format('YYYY-MM-DD')
      this.calendar = []
      this.shows = {}
      this.featured = {}

      # console.log this.link, this.today, this.calendar

      # @listenTo calendarAction, @updateCalendar
      @listenTo getFeatured, @getFeatured



    # updateCalendar: ->
    #   # console.log "do it!", arguments
    #   this.onLoadCalendar(arguments)

    # onLoadCalendar: (data)->
    #   calendar = data
    #   # console.log 'onLoadCalendar', data[0], arguments
    #   this.calendar = calendar[0].sort() if calendar[0]
    #   this.reconcile(this.today, this.calendar)

    getFeatured: ->
      # console.log "do it!"
      this.onLoad(arguments)

    onLoad: (data)->
      # console.log 'onToday', data[0], arguments
      this.featured = data[0]
      this.reconcile()

    onLoadError: (error)->
      Actions.loadCalendarError(error)
      this._calendar = []

    reconcile: ()->
      # console.log 'reconcile',
      # console.log 'reconcile', this.today, this.calendar
      # this.today = "#/shows/#{data[0]}"
      # console.log 'from store out to the world', this.featured


      @trigger this.featured





  # Header = React.createClass

  #   render: ()->
  #     date = moment(this.props.date)
  #     # console.log 'fgf', date

  #     <header>
  #       <h3>
  #         <span className="day">{date.format('dddd')}</span>
  #         <span className="month">{date.format("MMMM")}</span>
  #         <span className="date">{date.format("DD")}</span>
  #       </h3>
  #     </header>

  Prev = React.createClass
    render: ()->
      <div id="prev" className="prev"><a href="#/shows/2015-04-10" className="h1">«</a></div>

  Next = React.createClass
    render: ()->
      <div id="next" className="next"><a href="#/shows/2015-04-12" className="h1">»</a></div>

  Shows = React.createClass

    render: ()->
      <div className="shows">
        <ul id="shows" className="shows">
          <li className="show">
            <div className="meta">
              <h6 className="h5"><a href="http://danssilverleaf.com/#show_2029"><span className="time">4:00 pm</span><span className="subhead venue">Dans Silverleaf</span><span className="price is right">$10.00</span></a></h6>
            </div>
            <div className="artists">
              <ul className="artists list-unstlyed">
                <li>Cornell Hurd And&nbsp;Friends</li>
              </ul>
            </div>
          </li>
          <li className="show">
            <div className="meta">
              <h6 className="h5"><a href="http://www.reverbnation.com/show/15347218"><span className="time">7:00 pm</span><span className="subhead venue">Andys</span><span className="price is right">?</span></a></h6>
            </div>
            <div className="artists">
              <ul className="artists list-unstlyed">
                <li>The Infamists</li>
              </ul>
            </div>
          </li>
          <li className="show">
            <div className="meta">
              <h6 className="h5"><a href="http://danssilverleaf.com/#show_2002"><span className="time">7:30 pm</span><span className="subhead venue">Dans Silverleaf</span><span className="price is right">$12ADV $15DOS</span></a></h6>
            </div>
            <div className="artists">
              <ul className="artists list-unstlyed">
                <li>Butch Hancock</li>
              </ul>
            </div>
          </li>
          <li className="show">
            <div className="meta">
              <h6 className="h5"><a href="http://rubberglovesdentontx.com/calendar/"><span className="time">8:00 pm</span><span className="subhead venue">Rubber Gloves</span><span className="price is right">$5 $7 cover</span></a></h6>
            </div>
            <div className="artists">
              <ul className="artists list-unstlyed">
                <li>Father Murphy</li>
                <li>Awen</li>
              </ul>
            </div>
          </li>
        </ul>
      </div>


  Featured = React.createClass

    getInitialState: ->
      date: moment().format 'YYYY-MM-DD'

    componentDidMount: ->
      @unsubscribe = updatedStore.listen(@onShowTimeElapsed)

    componentWillUnmount: ->
      @unsubscribe()

    onShowTimeElapsed: (data)->
      # today = moment(data)
      # console.log "main go!", data
      # this.setState data: data
      this.setState date: data.date



    render: ()->
      # console.log 'render top', this.state.date
      <div className="day">
        <DateComponent date={this.state.date}/>
      </div>

    # <div className="content">
    #   <Prev/>
    #   # <Shows/>
    #   <Next/>
    # </div>


  channel.subscribe "set.date", (payload)->
    # console.log 'r totally valid', payload
    getFeatured(payload) if payload

  # channel.subscribe "set.calendar", (payload)->
  #   console.log ' next subscribe set calendar', payload.data
  #   calendarAction(_.keys(payload.data))


  node = document.getElementById "featured"
  render = ()->
    React.render <Featured/>, node
  render()
