
function startRTOM() {
  var visited = false;
  if ( visited == false ) {
      $("#landing").css("display", "flex");
  		visited = true;
  };
  var movementStrength = 25;
  var height = movementStrength / $(window).height();
  var width = movementStrength / $(window).width()
  $("#landing").mousemove(function(e){
            var pageX = e.pageX - ($(window).width() / 2);
            var pageY = e.pageY - ($(window).height() / 2);
            var newvalueX = width * pageX * -1 - 25;
            var newvalueY = height * pageY * -1 - 50;
            $("#landing").css("background-position", newvalueX+"px     "+newvalueY+"px");
  });

};

function stopLanding() {
    document.getElementById("landing").style.display = "none";
};

$(document).ready(startRTOM);
