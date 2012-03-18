// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
var reloadTimer = null;
//Automatic Reload =P
$(function(){
  if ($("#vacancy_of_map").length > 0){
    setTimeout(updateVacancies, 5000);
  }
});

function updateVacancies(){
  var map_id = $("#vacancy_of_map").attr("map_id");
  
  var vacancies = []
  var statuses = []
  var indice = 0
  
  $("#vacancy_of_map p a[id^=vacancy-]").map(function() {
    var status = $(this).attr('status');
    var vacancy = this.id.match(/\d/);
    
    vacancies[indice] = vacancy;
    statuses[indice] = status
    indice+= 1;
    
  }).get().join(',');
  $.getScript("/user/reload_map.js?map_id=" + map_id + "&vacancies=" + vacancies + "&statuses=" + statuses);
  setTimeout(updateVacancies, 5000);
}
