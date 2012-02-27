$('input[id^="status_controll_time"]').datetimepicker({closeText: 'Fechar', currentText: 'Agora'});

function getVacancies() {
  var maps = $('input[id^="status_controll_map_"]:checked').map(function(){return $(this).val();}).get().join(", ");
    var vacancies = $('input[id^="status_controll_vacancy_"]:checked').map(function() {return $(this).val();}).get().join(',');
    $.get("/status_controlls/vacancy", { 'maps': [maps], 'vacancies': [vacancies]} );
  }
  getVacancies();
$('input[id^="status_controll_map_"]:checkbox').click(getVacancies);