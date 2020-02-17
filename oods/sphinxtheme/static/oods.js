$( document ).ready(function() {
    fixLayout();
    displayLogo();
    $( window ).resize(function() {
        fixLayout();
    });
});

function fixLayout() {
    $('.oods-sidebar').css({'top':parseInt($('nav.navbar').height())+'px'});
    $('#oodsSideBar').width($('#oodsSideBarWrapper').width()+'px');
}

function displayLogo(){
  var currPath = window.location.pathname;  
  if (currPath == '/index.html'){
    $('.oo-logo-sidebar').toggle();
  }
}