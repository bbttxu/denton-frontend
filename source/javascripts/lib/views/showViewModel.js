// showViewModel.js

var showViewModel;

showViewModel = function(show, venue, gigs) {
  var self;
  self = this;
  self.price = ko.observable(show.price);
  self.starts_at = ko.observable(show.starts_at);
  self.venue = ko.observable(venue);
  self.gigs = ko.observableArray(gigs);
  self.time = ko.computed( function() {
    return moment(self.starts_at()).format('hA');
  });
  return self;
};
