
function applyWeeklyHighlight() {

    $('.ui-datepicker-calendar tr').each(function () {

        if ($(this).parent().get(0).tagName == 'TBODY') {
            $(this).mouseover(function () {
                $(this).find('a').css({
                    'background': '#ffffcc',
                    'border': '1px solid #dddddd'
                });
                $(this).find('a').removeClass('ui-state-default');
                $(this).css('background', '#ffffcc');
            });

            $(this).mouseout(function () {
                $(this).css('background', '#ffffff');
                $(this).find('a').css('background', '');
                $(this).find('a').addClass('ui-state-default');
            });
        }

    });
}

