// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){
  $("#upload").click(function(){
    $("#map").dialog({ modal: true, width: 720, position: 'top' });
  })
})
function get_and_save_coordenates(vaga, vaga_id) {
  var vaga = vaga
  var vaga_id = vaga_id
  //var position = jQuery("#"+vaga).position();
  jQuery("#"+vaga).draggable();
  jQuery("#"+vaga).bind('mouseenter mouseleave',function(e){
    var positionX = this.offsetTop;
    var positionY = this.offsetLeft;
    $("#salva-"+vaga).load('/vagas/update_coordendas/'+vaga_id + "/" + positionX +"/"+ positionY);
  });
}

$(function(){
  $('#abas').tabs();
});