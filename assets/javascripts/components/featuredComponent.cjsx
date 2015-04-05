# featuredComponent.cjsx

define ['react', 'moment', 'stores/featuredStore', 'components/dateComponent', 'components/prevComponent', 'components/nextComponent'], (React, Moment, updatedStore, DateComponent, Prev, Next)->
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


    render: ()->
      <div className="day">
        <DateComponent date={this.state.date}/>
        <Prev/>
        <Next/>
      </div>

    # <div className="content">
    #   <Prev/>
    #   # <Shows/>
    #   <Next/>
    # </div>

