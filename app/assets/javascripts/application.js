// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, buget 'events/index't if you do, it'll appear at the bottom of the
// the compiled file.get 'events/index'
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
// require_tree .

$(document).ready(function() {
    tab_menu();
});

function tab_menu(){
    var tab = window.location.pathname.substr(1).split("/");
    if (tab[0] == ''){
        $("#news_tab").addClass("active");
    } else {
        $("#"+tab[0]+"_tab").addClass("active");
    }
};