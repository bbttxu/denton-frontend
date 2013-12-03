// gigViewModel.js

var gigViewModel;

gigViewModel = function(gig) {
  var self;
  self = this;
  self.position = ko.observable(gig.position);
  self.artist = ko.observable();
  return self;
};
