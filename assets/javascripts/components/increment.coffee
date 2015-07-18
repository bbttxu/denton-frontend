define ['react'], (React)->

  {a} = React.DOM

  class Increment extends React.Component
    render: ->
      url = @props.link.url or ""
      text = @props.link.text or ""

      a {className: 'h1', href: url}, text
