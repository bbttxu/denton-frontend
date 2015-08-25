define ['react', 'classnames', 'postal', 'moment', 'lscache', 'components/linkComponent', 'components/navigationTodayComponent', 'underscore'], (React, cx, Postal, moment, lscache, LinkComponent, NavigationTodayComponent, _)->

  channel = Postal.channel()

  {ul, li, a, span} = React.DOM

  class NavigationComponent extends React.Component

    classes = cx 'nav', 'navbar-nav', 'navbar-right', 'list-inline', 'inline-list'

    badge = cx 'badge'

    render: ->
      rejectEmpties = (value)->
        value is undefined

      upcoming = _.reject [@props.upcomingShows, 'Upcoming'], rejectEmpties
      venues = _.reject [@props.venues, 'Venues'], rejectEmpties

      ul {className: classes},
        NavigationTodayComponent {data: @props.today}
        LinkComponent {data: @props.upcomingShows}
        # li {},
        #   a {href: '#/'},
        #     span {}, 'Shows'
        #     span {className: badge}, @props.upcomingShows

        li {},
          a {href: '#/venues'},
            span {}, 'Venues'
            span {className: badge}, @props.venues

  Navigation = React.createFactory NavigationComponent


  calendarStuff =
    link:
      url: '#/'
      text: 'Show'

  React.createClass(
    getInitialState: ->
      todayDefault =
        updated: 0
        count: undefined

      today = lscache.get 'count.today'
      today = todayDefault if today is null
      console.log today

      upcoming = lscache.get 'count.upcoming'
      upcoming = todayDefault if upcoming is null

      initial =
        today: today
        upcomingShows: _.extend {}, upcoming, calendarStuff
        venues: undefined

    componentDidMount: ->
      channel.subscribe "set.date", @onDateChange
      channel.subscribe "set.calendar", @onCalendarChange
      channel.subscribe "set.venues", @onVenuesChange

    componentWillUnmount: ->
      @unsubscribe()

    onDateChange: (data)->
      date = data.date
      if moment(date).isSame(moment(), 'day')

        if data.data.shows
          payload =
            count: data.data.shows.length
            updated: moment().valueOf()

          lscache.set 'count.today', payload

          @setState today: payload

    onCalendarChange: (data)->

      sum = (memo, num)->
        memo + num

      payload =
        count: _.reduce(_.values(data.data), sum, 0)
        updated: moment().valueOf()

      lscache.set 'count.upcoming', payload

      payload = _.extend {}, payload, calendarStuff
      @setState upcomingShows: payload

    onVenuesChange: (data)->
      noShows = (venue)->
        venue.shows_count is 0

      @setState venues:  _.reject(data.data.venues, noShows).length

    render: ->
      Navigation {today: @state.today, upcomingShows: @state.upcomingShows, venues: @state.venues}
  )
