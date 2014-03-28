// artistViewModel.js

var artistViewModel;

artistViewModel = function(name) {
  var self;
  self = this;
  self.name = ko.observable(name);
  return self;
};
