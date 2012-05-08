$('input[id^="time"]').datetimepicker({closeText: 'Fechar', currentText: 'Agora'});

function getVacancies() {
  var maps = $('input[id^="map_"]:checked').map(function(){return $(this).val();}).get().join(", ");
    var vacancies = $('input[id^="vacancy_"]:checked').map(function() {return $(this).val();}).get().join(',');
    $.get("/status_controlls/vacancy", { 'map': [maps], 'vacancy': [vacancies]} );
  }
  getVacancies();
$('input[id^="map_"]:checkbox').click(getVacancies);