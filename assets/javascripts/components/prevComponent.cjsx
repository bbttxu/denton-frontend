# prevComponent.cjsx

define ['react'], (React)->
  Prev = React.createClass
    render: ()->

      link = "#"
      link = "#/shows/" + this.props.prev if this.props.prev

      text = "«"
      text = "" unless this.props.prev

      <div id="prev" className="prev">
        <a href={link} className="h1">{text}</a>
      </div>
