$(".dashboard").on({
   click: function(){
      $(".nav").removeClass("blurred");
      $(".z-cnotent").fadeIn(0);
      $("#main-container").hide();
   }
},":not(.dashboard)");


function startRTOM() {
  var visited = false;

  if ( visited == false ) {
      $(document).ready(startLanding);
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
            $("#landing").css("background-position", newvalueX+"px     "+newvalueY+"px");
  });

};

function startLanding() {
    document.getElementById("landing").style.display = 'flex';
}

function stopLanding() {
    document.getElementById("landing").style.display = 'none';
}

$(document).ready(startRTOM);
