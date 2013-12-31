var calendarViewModel;

calendarViewModel = function(days, updatedAt) {
  var self;
  self = this;
  self.days = ko.observableArray( days );

  self.featured = ko.observableArray();
  // self.showDate = ko.observable();

  self.updatedAt = ko.observable( updatedAt );

  self.updatedAtInWords = ko.computed( function() {
    return moment.unix( self.updatedAt() ).fromNow();
  });
  // self.updatedAtDate = ko.computed( function() {
  //   return moment.unix( self.updatedAt() ).format('YYYY-MM-DD h:mm:ss a');
  // });
  return self;
};
