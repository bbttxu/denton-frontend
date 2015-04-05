# featuredComponent.cjsx

define ['react', 'moment', 'stores/featuredStore', 'stores/calendarStore','components/dateComponent', 'components/prevComponent', 'components/nextComponent', 'components/showsComponent'], (React, Moment, updatedStore, calendarStore, DateComponent, Prev, Next, Shows)->
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
      this.setState data: data.data if data.data
      this.setState prev: data.prev if data.prev
      this.setState next: data.next if data.next


    render: ()->
      <div className="day">
        <DateComponent date={this.state.date}/>
        <div className="content">
          <Prev prev={this.state.prev}/>
          <Shows shows={this.state.data}/>
          <Next next={this.state.next}/>
        </div>
      </div>

