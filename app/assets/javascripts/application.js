// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function() {
    nav_menu();
    $('#myCarousel').carousel({
        interval: 10000
    });

    $('#myCarousel').on('slid.bs.carousel', function() {
        //alert("slid");
    });

});

function nav_menu(){
    var arr =  window.location.pathname.split("/");
    arr.shift();
    if(arr[arr.length-1] == ''){
        arr.pop();
    }
    $("ul.breadcrumb").html()
    $("ul.breadcrumb").append("<li><a href='/'>home</a><span class='divider'>/</span> </li>")
    if(arr[0] != ""){
        $.each(arr, function(k,v){
            var url_href = "/" +  arr.slice(0, k+1).join("/")
            $("ul.breadcrumb").append("<li><a href='"+url_href+"' >"+v+"</a><span class='divider'>/</span> </li>")
        });
    }
}
