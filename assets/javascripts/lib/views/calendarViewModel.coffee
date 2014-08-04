define ["knockout", "moment"], (ko, moment)->

    calendarViewModel = (days, updatedAt)->
        self = this

        self.days = ko.observableArray days

        self.featured = ko.observableArray []

        self.updatedAt = ko.observable updatedAt

        self.updatedAtInWords = ko.computed ()->
            moment(self.updatedAt()).fromNow()

        self
