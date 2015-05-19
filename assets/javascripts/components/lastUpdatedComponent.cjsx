# lastUpdatedComponent.cjsx

define ['underscore', 'react', 'moment', 'classnames'], (_, React, moment, cx)->
  React.createClass
    render: ->
      ago = moment(this.props.updated).utc().fromNow()
      recent = moment(this.props.updated).isAfter(moment().subtract(1, 'years'))
      never = "probably never"
      ago = if recent then ago else never

      classes = cx
        current: moment(this.props.updated).isAfter(moment().subtract(5, 'minutes'))
        'out-of-date': moment(this.props.updated).isBefore(moment().subtract(24, 'hours'))

      <p className={classes}>
        <span className="label">last updated</span>
        <span className="date">{ago}</span>
      </p>
