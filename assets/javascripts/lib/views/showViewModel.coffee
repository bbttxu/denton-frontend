define ["knockout"], (ko)->

    showViewModel = (show, venue, gigs)->
        self = this

        self.price = ko.observable show.price

        self.starts_at = ko.observable show.starts_at

        self.venue = ko.observable venue

        self.gigs = ko.observableArray gigs

        self.source = ko.observable show.source

        self.time = ko.computed (timezoneOffset)->
            moment(self.starts_at()).zone(moment().format('ZZ')).format('h:mmA')

        self