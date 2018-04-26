$( document ).ready(function() {
    $('#oodsSideBar').width($('#oodsSideBarWrapper').width()+'px');
    $( window ).resize(function() {
        $('#oodsSideBar').width($('#oodsSideBarWrapper').width()+'px');
    });
});


