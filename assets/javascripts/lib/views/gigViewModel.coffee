define ["knockout", "typogr"], (ko, typogr)->
    gigViewModel = (artist, position)->
        self = this

        self.artist = ko.observable artist

        self.artistName = ko.computed ()->
            typogr.typogrify self.artist()

        self.position = ko.observable position

        self
