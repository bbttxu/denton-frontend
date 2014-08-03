define(["knockout", "moment"], function(ko, moment) {
    // calendarShowsViewModel.js

    var calendarShowsViewModel;

    calendarShowsViewModel = function(date, prevDay, nextDay) {
        var self;
        self = this;
        self.id = ko.observable(date);
        self.prevDay = ko.observable(prevDay);
        self.prevDayLink = ko.computed(function() {
            if (self.prevDay()) {
                return "#/shows/" + self.prevDay();
            }
            return false;
        });
        self.nextDay = ko.observable(nextDay);
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
        self.classes = ko.computed(function() {
            var cssClasses, month;
            cssClasses = [];
            month = moment(self.id()).format('M');
            if ((month % 2) === 0) {
                cssClasses.push("month-even");
            } else {
                cssClasses.push("month-odd");
            }
            cssClasses.push("count-" + self.shows().length);
            return cssClasses.join(" ");
        });
        return self;
    };

    return calendarShowsViewModel;
});