// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
var reloadTimer = null;
$(document).ready(function(){
  $("#dialog_modal").click(function(){
    $("#map").dialog({ modal: true, width: 720, position: 'center' });
  })
  $("#auto_complet_map").autocomplete(
    { source: "/auto_complete/maps_list.json" }
  );
})
function get_and_save_coordenates(vacancy_id) {
  var vacancy_id = vacancy_id;
  
  $("#vacancy-"+ vacancy_id).bind('mouseenter mouseleave',function(e){
    var positionX = this.offsetTop;
    var positionY = this.offsetLeft;
    console.log($("#save_vacancy-"+vacancy_id));
    $("#save_vacancy-"+vacancy_id).load("/vacancies/update_coordendas/"+vacancy_id + "/" + positionX +"/"+ positionY);
  });
}

$(function(){
  $('#abas').tabs();
});

//Automatic Reload =P
/*$(function(){
  if ($("#vacancy_of_map").length > 0){
    setTimeout(updateVacancies, 5000);
  }
  });*/

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
  
  $.getScript("/reload_map.js?map_id=" + map_id + "&vacancies=" + vacancies + "&statuses=" + statuses);
  setTimeout(updateVacancies, 5000);
}
