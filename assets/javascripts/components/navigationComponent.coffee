define ['react', 'classnames', 'postal', 'moment'], (React, cx, Postal, moment)->

  channel = Postal.channel()

  {ul, li, a, span} = React.DOM

  class NavigationComponent extends React.Component

    classes = cx 'nav', 'navbar-nav', 'navbar-right'

    badge = cx 'badge'

    render: ->
      rejectEmpties = (value)->
        value is undefined

      # today = _
      upcoming = _.reject [@props.upcomingShows, 'Upcoming'], rejectEmpties
      venues = _.reject [@props.venues, 'Venues'], rejectEmpties

      ul {className: classes},
        li {},
          a {id: 'todaysLink', href: ""},
            span {}, 'Today'
            span {className: badge}, @props.today

        li {},
          a {href: '#/'},
            span {}, 'Calendar'
            span {className: badge}, @props.upcomingShows

        li {},
          a {href: '#/venues'},
            span {}, 'Venues'
            span {className: badge}, @props.venues

  Navigation = React.createFactory NavigationComponent

  React.createClass(

    getInitialState: ->
      today: undefined
      upcomingShows: undefined
      venues: undefined

    componentDidMount: ->
      channel.subscribe "set.date", @onDateChange
      channel.subscribe "set.calendar", @onCalendarChange
      channel.subscribe "set.venues", @onVenuesChange

    componentWillUnmount: ->
      @unsubscribe()

    onDateChange: (data)->
      date = data.date
      console.log date
      console.log data
      if moment(date).isSame(moment(), 'day')
        @setState today: data.data.shows.length if data.data.shows

    onCalendarChange: (data)->
      sum = (memo, num)->
        memo + num

      @setState upcomingShows: _.reduce(_.values(data.data), sum, 0)

    onVenuesChange: (data)->
      noShows = (venue)->
        venue.shows_count is 0

      @setState venues:  _.reject(data.data.venues, noShows).length

    render: ->
      Navigation {today: @state.today, upcomingShows: @state.upcomingShows, venues: @state.venues}
  )
