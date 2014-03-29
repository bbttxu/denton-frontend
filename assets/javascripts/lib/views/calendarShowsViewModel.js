define(["knockout", "moment"], function(ko, moment) {
    // calendarShowsViewModel.js

    var calendarShowsViewModel;

    calendarShowsViewModel = function(date) {
        var self;
        self = this;
        self.id = ko.observable(date);
        self.prevDay = ko.observable(false);
        self.prevDayLink = ko.computed(function() {
            if (self.prevDay()) {
                return "#/shows/" + self.prevDay();
            }
            return false;
        });
        self.nextDay = ko.observable(false);
        self.nextDayLink = ko.computed(function() {
            if (self.nextDay()) {
                return "#/shows/" + self.nextDay();
            }
            return false;
        });
        self.day = ko.computed(function() {
            return moment(self.id()).format("dddd");
        });
        self.date = ko.computed(function() {
            return moment(self.id()).format("D");
        });
        self.month = ko.computed(function() {
            return moment(self.id()).format("MMMM");
        });
        self.shows = ko.observableArray([]);
        self.countClass = ko.computed(function() {
            if (self.shows()) {
                return "count-" + self.shows().length;
            }
            return "count-0";
        });
        return self;
    };

    return calendarShowsViewModel;
});