$(".dashboard").on({
   click: function(){
      $(".nav").removeClass("blurred");
      $(".z-cnotent").fadeIn(0);
      $("#main-container").hide();
   }
},":not(.dashboard)");
