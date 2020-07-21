/* Korean initialisation for the jQuery calendar extension. */
/* Written by DaeKwon Kang (ncrash.dk@gmail.com). */
jQuery(function($){
	$.datepicker.regional['ko'] = {
		closeText: '닫기',
		prevText: '이전달',
		nextText: '다음달',
		currentText: '오늘',
		monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
		'7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
		monthNamesShort: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
		'7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
		dayNames: ['일','월','화','수','목','금','토'],
		dayNamesShort: ['일','월','화','수','목','금','토'],
		dayNamesMin: ['일','월','화','수','목','금','토'],
		weekHeader: 'Wk',
		dateFormat: 'yy-mm-dd',
		firstDay: 1,
		isRTL: false,
		showMonthAfterYear: false,
		yearSuffix: '년',
	};
	$.datepicker.setDefaults($.datepicker.regional['ko']);
});


$(function() {
	var startDate;
	var endDate;

	$('#week-picker').datepicker( {
		showOtherMonths: true,
		selectOtherMonths: true,

		selectWeek:true,
		onSelect: function(dateText, inst) {
			var date = $(this).datepicker('getDate');
			startDate = new Date(date.getFullYear(), date.getMonth(), date.getDate() - date.getDay() + 1);
			endDate = new Date(date.getFullYear(), date.getMonth(), date.getDate() - date.getDay() + 7 );
			var dateFormat = 'yy/mm/dd'
			startDate = $.datepicker.formatDate( dateFormat, startDate, inst.settings );
			endDate = $.datepicker.formatDate( dateFormat, endDate, inst.settings );

			$('#week-picker').val(startDate + '~' + endDate);
			console.log(startDate + '~' + endDate);

			setTimeout("applyWeeklyHighlight()", 100);
		},
		beforeShow : function() {
			setTimeout("applyWeeklyHighlight()", 100);
		}
	});
});

function applyWeeklyHighlight() {

	$('.ui-datepicker-calendar tr').each(function() {

		if ($(this).parent().get(0).tagName == 'TBODY') {
			$(this).mouseover(function() {
				$(this).find('a').css({
					'background' : '#ffffcc',
					'border' : '1px solid #dddddd'
				});
				$(this).find('a').removeClass('ui-state-default');
				$(this).css('background', '#ffffcc');
			});

			$(this).mouseout(function() {
				$(this).css('background', '#ffffff');
				$(this).find('a').css('background', '');
				$(this).find('a').addClass('ui-state-default');
			});
		}

	});
}

