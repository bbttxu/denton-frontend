define ['react', 'classnames', 'moment'], (React, cx, moment)->
  {li, a, span} = React.DOM

  class NavigationTodayComponent extends React.Component
    render: ->
      # console.log @props.data

      classes = cx
        # FIXME TODO duplicate code
        current: moment(@props.data.updated).isAfter(moment().subtract(5, 'minutes'))
        'out-of-date': moment(@props.data.updated).isBefore(moment().subtract(24, 'hours'))

      # console.log classes

      li {className: classes},
        a {id: 'todaysLink', href: ''},
          span {}, 'Today'
          span {className: 'badge'}, @props.data.count

  React.createFactory NavigationTodayComponent
