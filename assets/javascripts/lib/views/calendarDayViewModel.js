define(["knockout"], function(ko) {
    var calendarDayViewModel;

    calendarDayViewModel = function(date, count) {
        var self;
        self = this;
        self.id = ko.observable(date);
        self.count = ko.observable(count);
        self.classes = ko.computed(function() {
            var cssClasses;
            cssClasses = [];
            cssClasses.push("count-" + self.count());
            if (moment().diff(moment(self.id()), 'days') > -10) {
                cssClasses.push("soonish");
            }
            return cssClasses.join(" ");
        });
        self.day = ko.computed(function() {
            return moment(self.id()).format("dd");
        });
        self.date = ko.computed(function() {
            return moment(self.id()).format("DD");
        });
        self.month = ko.computed(function() {
            return moment(self.id()).format("MM");
        });
        self.link = ko.computed(function() {
            return "#/shows/" + self.id();
        });
        return self;
    };

    return calendarDayViewModel;
});