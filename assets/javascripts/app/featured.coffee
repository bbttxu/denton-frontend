define ['react', 'components/featuredComponent'], (React, Featured)->

  node = document.getElementById "featured"
  render = ()->
    React.render React.createElement(Featured), node
  render()
