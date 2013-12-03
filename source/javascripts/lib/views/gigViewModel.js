// gigViewModel.js

var gigViewModel;

gigViewModel = function(artist, position) {
  var self;
  self = this;
  self.artist = ko.observable(artist);
  self.position = ko.observable(position);
  return self;
};
