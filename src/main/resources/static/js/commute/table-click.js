
function changeColor() {
    $('table tr').mouseover(function () {
        $(this).addclass('changeColor');
    }).mouseout(function () {
        $(this).removeClass('changeColor');

    });

}