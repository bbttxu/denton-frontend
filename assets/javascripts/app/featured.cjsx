# featured.cjsx

define ['postal', 'underscore', 'react', 'actions/featuredAction', "moment", 'models/date', 'stores/featuredStore', 'components/featuredComponent'], (Postal, _, React, getFeatured, moment, Date, updatedStore, Featured)->

  channel = Postal.channel()




  # Prev = React.createClass
  #   render: ()->
  #     <div id="prev" className="prev"><a href="#/shows/2015-04-10" className="h1">«</a></div>

  # Next = React.createClass
  #   render: ()->
  #     <div id="next" className="next"><a href="#/shows/2015-04-12" className="h1">»</a></div>

  # Shows = React.createClass

  #   render: ()->
  #     <div className="shows">
  #       <ul id="shows" className="shows">
  #         <li className="show">
  #           <div className="meta">
  #             <h6 className="h5"><a href="http://danssilverleaf.com/#show_2029"><span className="time">4:00 pm</span><span className="subhead venue">Dans Silverleaf</span><span className="price is right">$10.00</span></a></h6>
  #           </div>
  #           <div className="artists">
  #             <ul className="artists list-unstlyed">
  #               <li>Cornell Hurd And&nbsp;Friends</li>
  #             </ul>
  #           </div>
  #         </li>
  #         <li className="show">
  #           <div className="meta">
  #             <h6 className="h5"><a href="http://www.reverbnation.com/show/15347218"><span className="time">7:00 pm</span><span className="subhead venue">Andys</span><span className="price is right">?</span></a></h6>
  #           </div>
  #           <div className="artists">
  #             <ul className="artists list-unstlyed">
  #               <li>The Infamists</li>
  #             </ul>
  #           </div>
  #         </li>
  #         <li className="show">
  #           <div className="meta">
  #             <h6 className="h5"><a href="http://danssilverleaf.com/#show_2002"><span className="time">7:30 pm</span><span className="subhead venue">Dans Silverleaf</span><span className="price is right">$12ADV $15DOS</span></a></h6>
  #           </div>
  #           <div className="artists">
  #             <ul className="artists list-unstlyed">
  #               <li>Butch Hancock</li>
  #             </ul>
  #           </div>
  #         </li>
  #         <li className="show">
  #           <div className="meta">
  #             <h6 className="h5"><a href="http://rubberglovesdentontx.com/calendar/"><span className="time">8:00 pm</span><span className="subhead venue">Rubber Gloves</span><span className="price is right">$5 $7 cover</span></a></h6>
  #           </div>
  #           <div className="artists">
  #             <ul className="artists list-unstlyed">
  #               <li>Father Murphy</li>
  #               <li>Awen</li>
  #             </ul>
  #           </div>
  #         </li>
  #       </ul>
  #     </div>




  channel.subscribe "set.date", (payload)->
    # console.log 'r totally valid', payload
    getFeatured(payload) if payload

  # channel.subscribe "set.calendar", (payload)->
  #   console.log ' next subscribe set calendar', payload.data
  #   calendarAction(_.keys(payload.data))


  node = document.getElementById "featured"
  render = ()->
    React.render <Featured/>, node
  render()
