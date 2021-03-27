$(document).ready(function() {
    let path = location.pathname;
    $("a[href='" + path + "']").addClass('active blue');

    $('table').tablesort();

    $(".ui.toggle.button").click(function() {
        $(".mobile.only.grid .ui.vertical.menu").toggle(100);
    });
})
