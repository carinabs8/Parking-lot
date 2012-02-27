/* Brazilian Portuguese translation for the jQuery Timepicker Addon */
/* Written by Diogo Damiani (diogodamiani@gmail.com) */
$.datepicker.regional['pt-BR'] = {
	closeText: 'Fechar',
	prevText: '<Anterior',
	nextText: 'Próximo>',
	currentText: 'Corrente',
  closeStatus: 'Close without change',
	monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho',
	'Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
	monthNamesShort: ['Jan','Fev','Маr','Abr','Mai','Jun',
	'Jul','Ago','Set','Out','Nov','Dez'],
	dayNames: ['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado'],
	dayNamesShort: ['Dom','Seg','Ter','Quar','Quin','Sex','Sáb'],
	dayNamesMin: ['Dom','Seg','Ter','Quar','Quin','Sex','Sáb'],
	weekHeader: 'Semana',
	dateFormat: 'dd/mm/yy',
	firstDay: 1,
	isRTL: false,
	showMonthAfterYear: false,
	yearSuffix: '',
  onSelect: function(dateText, inst){
		if(window.console)
			console.log(dateText);
    }
};
$.datepicker.setDefaults($.datepicker.regional['pt-BR']);