# # calendar.coffee

# define ["app/api", "models/day", "postal", "templates", "moment", "jquery.timespace"], (API, Day, postal, templates, moment)->
#   channel = postal.channel()

#   channel.subscribe "set.calendar", (payload)->
#     # console.log "payload", payload
#     days = _.map payload.data, (count, date)->
#       new Day date, count

#     days = _.sortBy days, (day)->
#       day.date

#     templated = _.map days, (day)->
#       templates['calendar-li'](day)

#     # $('#last-updated').html( templates['last-updated']( ago: moment(payload.updated).fromNow() ) )

#     $('#calendar').html(templated.join(""))
#     $('li', '#calendar').timespace()

#   # channel.publish "touch.calendar"
