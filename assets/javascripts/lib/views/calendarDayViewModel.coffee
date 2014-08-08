# define ["knockout", "moment"], (ko, moment) ->
#     calendarDayViewModel = (date, count)->
#         self = this

#         link = (date)->
#             return false unless date
#             "#/shows/#{date}"

#         format = (token)->
#             moment(self.id()).format token

#         self.id = ko.observable(date)

#         self.count = ko.observable(count)

#         self.classes = ko.computed ()->
#             cssClasses = []
#             cssClasses.push "count-" + self.count()
#             month = moment(self.id()).format("M") % 2
#             cssClasses.push "month-even" if month is 0
#             cssClasses.push "month-odd" if month isnt 0
#             cssClasses.push "count-" + self.count()
#             cssClasses.push "soonish" if moment().diff(moment(self.id()), "days") > -10
#             cssClasses.join " "

#         self.day = ko.computed ()->
#             format "dd"

#         self.date = ko.computed ()->
#             format "DD"

#         self.month = ko.computed ()->
#             format "MM"

#         self.link = ko.computed ()->
#             link self.id()

#         self

