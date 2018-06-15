// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ujs
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require bootstrap-sprockets
//= require cloudinary
//= require_tree .

var startRTOM = function() {
var visited = false;
if ( visited == false ) {
    var element = document.getElementById('landing');
    element.style.display = 'flex';
		visited = true;
};
var movementStrength = 25;
var height = movementStrength / $(window).height();
var width = movementStrength / $(window).width();
$("#landing").mousemove(function(e){
          var pageX = e.pageX - ($(window).width() / 2);
          var pageY = e.pageY - ($(window).height() / 2);
          var newvalueX = width * pageX * -1 - 25;
          var newvalueY = height * pageY * -1 - 50;
          $('#landing').css("background-position", newvalueX+"px     "+newvalueY+"px");
});

};


function stopLanding() {
    document.getElementById("landing").style.display = 'none';
}

$( document ).ready(startRTOM);
