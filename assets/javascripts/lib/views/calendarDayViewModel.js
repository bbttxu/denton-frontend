define(["knockout", "moment"], function(ko, moment) {
    var calendarDayViewModel;

    calendarDayViewModel = function(date, count) {
        var self;
        self = this;
        self.id = ko.observable(date);
        self.count = ko.observable(count);
        self.classes = ko.computed(function() {
            var cssClasses, month;
            cssClasses = [];
            cssClasses.push("count-" + self.count());
            month = moment(self.id()).format('M');
            if ((month % 2) === 0) {
                cssClasses.push("month-even");
            } else {
                cssClasses.push("month-odd");
            }
            if (moment().diff(moment(self.id()), 'days') > -10) {
                cssClasses.push("soonish");
            }

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