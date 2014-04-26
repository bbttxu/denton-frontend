define(["knockout"], function(ko) {
    // showViewModel.js

    var showViewModel;

    showViewModel = function(show, venue, gigs) {
        var self;
        self = this;
        self.price = ko.observable(show.price);
        self.starts_at = ko.observable(show.starts_at);
        self.venue = ko.observable(venue);
        self.gigs = ko.observableArray(gigs);
        self.source = ko.observable(show.source);
        self.time = ko.computed(function(timezoneOffset) {
            return moment(self.starts_at()).zone(moment().format('ZZ')).format('h:mmA');
        });
        return self;
    };

    return showViewModel;

});