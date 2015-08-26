define ['react', 'classnames', 'postal', 'moment', 'lscache', 'components/linkComponent', 'underscore'], (React, cx, Postal, moment, lscache, LinkComponent, _)->

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
        LinkComponent {data: @props.today}
        LinkComponent {data: @props.upcomingShows}
        LinkComponent {data: @props.venues}

  Navigation = React.createFactory NavigationComponent


  todayStuff =
    link:
      url: ''
      text: 'Today'

  calendarStuff =
    link:
      url: '#/'
      text: 'Show'

  venuesStuff =
    link:
      url: '#/venues'
      text: 'Venues'

  React.createClass(
    getInitialState: ->
      todayDefault =
        updated: 0
        count: undefined

      today = lscache.get 'count.today'
      today = todayDefault if today is null

      upcoming = lscache.get 'count.upcoming'
      upcoming = todayDefault if upcoming is null

      venues = lscache.get 'count.calendar'
      venues = todayDefault if venues is null

      initial =
        today: _.extend {}, today, todayStuff
        upcomingShows: _.extend {}, upcoming, calendarStuff
        venues: _.extend {}, venues, venuesStuff

    componentDidMount: ->
      channel.subscribe "set.date", @onDateChange
      channel.subscribe "set.calendar", @onCalendarChange
      channel.subscribe "set.venues", @onVenuesChange

    componentWillUnmount: ->
      @unsubscribe()

    onDateChange: (data)->
      date = data.date
      if moment(date).isSame(moment(), 'day')

        # if data.data.shows
        #   payload =
        #     count: data.data.shows.length
        #     updated: moment().valueOf()

        #   lscache.set 'count.today', payload

        #   @setState today: payload
        payload =
          count: data.data.shows.length
          updated: moment().valueOf()

        lscache.set 'count.today', payload

        payload = _.extend {}, payload, todayStuff

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

      payload =
        count: _.reject(data.data.venues, noShows).length
        updated: moment().valueOf()

      lscache.set 'count.venues', payload

      payload = _.extend {}, payload, venuesStuff

      @setState venues: payload

    render: ->
      Navigation {today: @state.today, upcomingShows: @state.upcomingShows, venues: @state.venues}
  )
