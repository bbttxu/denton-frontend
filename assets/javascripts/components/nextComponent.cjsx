# # nextComponent.cjsx

# define ['react'], (React)->
#   Next = React.createClass
#     render: ()->

#       link = "#"
#       link = "#/shows/" + this.props.next if this.props.next

#       text = "»"
#       text = "" unless this.props.next

#       <div id="next" className="next">
#         <a href={link} className="h1">{text}</a>
#       </div>
