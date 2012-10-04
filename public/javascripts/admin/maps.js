$(function actived_vacancys_link(){
	$('.adiciona_vacancy_ao_map').click(function(){
		adicionaVacancyAoMap($(this));
	});
});


function adicionaVacancyAoMap(vacancy){
	$.get("/maps/add_vacancy", { vacancy_id: vacancy.attr('data-vacancy')}, function(data){
		$("#" + $("div[id^='map_'][id$='_photo']").attr('id')).append(data);
		vacancy.unbind("click");
		vacancy.removeClass("adiciona_vacancy_ao_map");
	});
}