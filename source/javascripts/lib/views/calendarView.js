var calendarViewModel;

calendarViewModel = function(days) {
  var self;
  self = this;
  self.days = ko.observableArray(days);
  return self;
};
