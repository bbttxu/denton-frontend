# LinkComponent.coffee

define ['react', 'classnames', 'moment', 'underscore'], (React, cx, moment, _)->
  {li, a, span} = React.DOM

  defaults =
    link:
      url: ''
      text: 'Link'


  class LinkComponent extends React.Component
    render: ->
      data = _.extend {}, defaults, @props.data

      classes = cx
        # FIXME TODO duplicate code
        current: moment(data.updated).isAfter(moment().subtract(5, 'minutes'))
        'out-of-date': moment(data.updated).isBefore(moment().subtract(24, 'hours'))

      li {className: classes},
        a {href: data.link.url},
          span {}, data.link.text
          span {className: 'badge'}, data.count

  React.createFactory LinkComponent
