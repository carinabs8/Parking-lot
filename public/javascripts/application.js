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

$(function(){
  if ($("#vaga_of_map").length > 0){
    setTimeout(updateVagas, 10000);
  }
});

function updateVagas(){
  var map_id = $("#vaga_of_map").attr("map_id");
  var vaga_false = $("#vaga_of_map p a[status=false]").length
  var vaga_true = $("#vaga_of_map p a[status=true]").length
  
  $.getScript("/reload_map.js?map_id=" + map_id + "&qt_false=" + vaga_false + "&qt_true=" + vaga_true)
  setTimeout(updateVagas, 10000);
}
