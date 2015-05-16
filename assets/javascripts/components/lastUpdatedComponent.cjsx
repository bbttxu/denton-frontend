# lastUpdatedComponent.cjsx

define ['underscore', 'react', 'moment', 'classnames'], (_, React, moment, cx)->
  React.createClass
    render: ->
      classes = cx
        current: moment(this.props.updated).isAfter(moment().subtract(5, 'minutes'))
        'out-of-date': moment(this.props.updated).isBefore(moment().subtract(24, 'hours'))

      <p className={classes}>
        <span className="label">last updated</span>
        <span className="date">{moment(this.props.updated).utc().fromNow()}</span>
      </p>
