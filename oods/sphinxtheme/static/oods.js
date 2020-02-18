$( document ).ready(function() {
    fixLayout();
    $( window ).resize(function() {
        fixLayout();
    });
});

function fixLayout() {
    $('.oods-sidebar').css({'top':parseInt($('nav.navbar').height())+'px'});
    $('#oodsSideBar').width($('#oodsSideBarWrapper').width()+'px');
}