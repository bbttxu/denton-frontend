# calendarComponent.cjsx

define ['underscore', 'react', 'stores/calendarStore', 'actions/calendarAction'], (_, React, CalendarStore, calendarAction)->

  console.log _, React, CalendarStore, calendarAction

  React.createClass(

    getInitialState: ->
      calendar: {}

    componentDidMount: ->
      @unsubscribe = CalendarStore.listen(@onCalendarChange)

    componentWillUnmount: ->
      @unsubscribe()

    onCalendarChange: (data) ->
      this.setState calendar: data

    render: ->
      React.DOM.h1 {onClick: calendarAction}, 'Gem is ' + _.keys(this.state.calendar).length

  )
