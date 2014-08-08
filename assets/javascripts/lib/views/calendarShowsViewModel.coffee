# define ["knockout", "moment"], (ko, moment)->
#     calendarShowsViewModel = (date, prevDay, nextDay)->
#         self = this

#         link = (date)->
#             return false unless date
#             "#/shows/#{date}"

#         format = (token)->
#             moment(self.id()).format token

#         self.id = ko.observable date

#         self.prevDay = ko.observable prevDay

#         self.prevDayLink = ko.computed ()->
#             link self.prevDay()

#         self.nextDay = ko.observable nextDay

#         self.nextDayLink = ko.computed ()->
#             link self.nextDay()

#         self.day = ko.computed ()->
#             format "dddd"

#         self.date = ko.computed ()->
#             format "D"

#         self.month = ko.computed ()->
#             format "MMMM"

#         self.shows = ko.observableArray []

#         self.classes = ko.computed ()->
#             cssClasses = []
#             cssClasses.push "count-" + self.shows().length
#             month = moment(self.id()).format("M") % 2
#             cssClasses.push "month-even" if month is 0
#             cssClasses.push "month-odd" if month isnt 0
#             cssClasses.push "soonish" if moment().diff(moment(self.id()), "days") > -10
#             cssClasses.join " "

#         self