# dateComponent.cjsx

define ['react', 'moment'], (React, Moment)->
  Header = React.createClass
    render: ()->
      date = Moment(this.props.date)

      <header>
        <h3>
          <span className="day">{date.format('ddd')}</span>
          <span className="month">{date.format("MMMM")}</span>
          <span className="date">{date.format("DD")}</span>
        </h3>
      </header>
