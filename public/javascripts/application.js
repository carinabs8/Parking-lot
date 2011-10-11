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
function get_and_save_coordenates(codigo, vaga_id) {
  var codigo = codigo
  var vaga_id = vaga_id
  jQuery("#vaga-"+codigo).draggable();
  jQuery("#vaga-"+codigo).bind('mouseenter mouseleave',function(e){
    var positionX = this.offsetTop;
    var positionY = this.offsetLeft;
    $("#salva-vaga-"+codigo).load("/vagas/update_coordendas/"+vaga_id + "/" + positionX +"/"+ positionY);
  });
}

$(function(){
  $('#abas').tabs();
});

//Automatic Reload =P
$(function(){
  if ($("#vacancy_of_map").length > 0){
    setTimeout(updateVacancies, 10000);
  }
});

function updateVacancies(){
  var map_id = $("#vacancy_of_map").attr("map_id");

  var vacancys = $("#vacancy_of_map p a[id^=vaga-]").length
  
  $.getScript("/reload_map.js?map_id=" + map_id + "&vacancys=" + vacancys)
  setTimeout(updateVacancies, 10000);
}
