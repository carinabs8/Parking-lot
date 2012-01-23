function getVacancies() {
  var vacancies = $('input[id^="status_controll_map_"]:checked').map(function(){return $(this).val();}).get().join(", ");
    $.get("/status_controlls/vacancy", { 'vacancies': [vacancies]} );
  }
  getVacancies();
$('input[id^="status_controll_map_"]:checkbox').click(getVacancies);