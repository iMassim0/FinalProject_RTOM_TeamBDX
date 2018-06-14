
$( document ).ready(function() {
var cookie = document.cookie;
if (cookie.indexOf('visited=', 0) == -1) {
    var expiration = new Date();
    expiration.setDate(expiration.getMinutes()+60);
		console.log(expiration);
    document.cookie = 'visited=1;expires=' + expiration + ';path=/';
		console.log(document.cookie);
    var element = document.getElementById('landing');
    element.style.display = 'block';
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

});


function stopLanding() {
    document.getElementById("landing").style.display = 'none';
}
