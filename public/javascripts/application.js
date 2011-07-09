// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {
  var options = { 'dateFormat': 'dd.mm.yy', 'firstDay': 1 };
  $("#flat_visit_at").datetimepicker(options);
  $("#flat_available_on").datepicker(options);
  $("#flat_available_until").datepicker(options);
});