// calendarShowsViewModel.js

var calendarShowsViewModel;

calendarShowsViewModel = function(date) {
  var self;
  self = this;
  self.id = ko.observable(date);
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
