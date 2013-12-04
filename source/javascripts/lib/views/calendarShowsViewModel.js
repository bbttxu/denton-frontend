// calendarShowsViewModel.js

var calendarShowsViewModel;

calendarShowsViewModel = function(date) {
  var self;
  self = this;
  self.id = ko.observable(date);
  self.prevDay = ko.observable(true);
  self.prevDayLink = ko.computed( function() {
    if ( self.prevDay() ) {
      return "#/shows/" + self.prevDay();
    }
    return false;
  });
  self.nextDay = ko.observable(true);
  self.nextDayLink = ko.computed( function() {
    if ( self.nextDay() ) {
      return "#/shows/" + self.nextDay();
    }
    return false;
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
  self.shows = ko.observableArray([]);
  return self;
};
