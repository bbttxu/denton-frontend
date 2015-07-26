define ['react', 'moment'], (React, Moment)->

  {header, h3, span} = React.DOM

  class Header extends React.Component
    render: ()->
      date = Moment(this.props.date)
      header {},
        h3 {},
          span {className: "day"}, date.format('ddd')
          span {className: "month"}, date.format("MMMM")
          span {className: "date"}, date.format("DD")

