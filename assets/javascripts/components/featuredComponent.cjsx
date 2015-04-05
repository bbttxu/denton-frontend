# featuredComponent.cjsx

define ['react', 'moment', 'stores/featuredStore', 'stores/calendarStore','components/dateComponent', 'components/prevComponent', 'components/nextComponent'], (React, Moment, updatedStore, calendarStore, DateComponent, Prev, Next)->
  Featured = React.createClass

    getInitialState: ->
      date: moment().format 'YYYY-MM-DD'

    componentDidMount: ->
      @unsubscribe = updatedStore.listen(@onShowTimeElapsed)

    componentWillUnmount: ->
      @unsubscribe()

    onShowTimeElapsed: (data)->
      # console.log data
      this.setState date: data.date
      this.setState prev: data.prev if data.prev
      this.setState next: data.next if data.next


    render: ()->
      <div className="day">
        <Prev prev={this.state.prev}/>
        <DateComponent date={this.state.date}/>
        <Next next={this.state.next}/>
      </div>

    # <div className="content">
    #   <Prev/>
    #   # <Shows/>
    #   <Next/>
    # </div>

