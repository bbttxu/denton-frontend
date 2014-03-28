// venueViewModel.js

var venueViewModel;

venueViewModel = function(name) {
  var self;
  self = this;
  self.name = ko.observable(name);
  return self;
};
