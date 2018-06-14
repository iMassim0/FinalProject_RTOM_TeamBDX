

// function myMap() {
//
//   mapProp = {
//     center: new google.maps.LatLng(43.726400, -1.051667),
//     zoom: 13
//   };
//
//   map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
// }


function myMap() {
  var kochi = new google.maps.LatLng(9.9385818,76.1803488);
  var varkala= new google.maps.LatLng(8.7432563,76.699973);
  var jodhpur = new google.maps.LatLng(26.2703358,72.9605034);
  var mathura = new google.maps.LatLng(27.47437,77.6491352);
  var delhi = new google.maps.LatLng(28.6923329,76.9512663);
  var bhaktapur= new google.maps.LatLng(27.6773977,85.4157119);
  var chame = new google.maps.LatLng(28.5242686,84.1703563);
  var yak_kharka = new google.maps.LatLng(28.7229868,83.9713452);
  var thorong_la_pass = new google.maps.LatLng(28.793377,83.9299142);
  var kawah_ijen= new google.maps.LatLng(-8.0580702,114.2395936);
  var gili_t = new google.maps.LatLng(-8.3518437,116.0386536);
  var gunung_rinjani = new google.maps.LatLng(-8.411295,116.448594);
  var amed = new google.maps.LatLng(-8.332832,115.6385913);
  var koyasan= new google.maps.LatLng(34.2132427,135.5803737);
  var miyajima = new google.maps.LatLng(34.7854063,135.5687679);
  var hiroshima = new google.maps.LatLng(34.393845,132.4066806);
  var onomichi = new google.maps.LatLng(34.4143216,133.0332101);
  var kurashiki = new google.maps.LatLng(34.5433152,133.6022089);
  var okayama = new google.maps.LatLng(34.7335465,133.7911041);
  var kyoto = new google.maps.LatLng(35.006095,135.7259306);
  var tokyo = new google.maps.LatLng(35.6732619,139.5703049);
  var waikiki= new google.maps.LatLng(21.2801309,-157.8370756);
  var kehena_beach = new google.maps.LatLng(19.3946571,-154.9378426);
  var kilauea = new google.maps.LatLng(19.4068923,-155.2921334);
  var kona = new google.maps.LatLng(19.6643281,-155.9905465);
  var waipio = new google.maps.LatLng(20.1114619,-155.6038046);
  var san_francisco = new google.maps.LatLng(37.7576948,-122.4726194);
  var path = [kochi, varkala, jodhpur, mathura, delhi, bhaktapur, chame, yak_kharka, thorong_la_pass, kawah_ijen, gili_t, gunung_rinjani, amed, koyasan, miyajima, hiroshima, onomichi, kurashiki, okayama, kyoto, tokyo, waikiki, kehena_beach, kilauea, kona, waipio, san_francisco]

  var mapCanvas = document.getElementById("googleMap");
  var mapOptions = {center: kochi, zoom: 4, mapTypeId: google.maps.MapTypeId.TERRAIN};
  var map = new google.maps.Map(mapCanvas,mapOptions);

  var flightPath = new google.maps.Polyline({
    path: path,
    strokeColor: "#FF6600",
    strokeOpacity: 0.8,
    strokeWeight: 3
  });
  flightPath.setMap(map);

  path.forEach(function placeMarker(step) {

    var marker = new google.maps.Marker({
        position: step,
        map: map,
    });

    var infoWindow = new google.maps.InfoWindow({
        content: step
    });

    google.maps.event.addListener(marker, 'click', function(event) {
        infoWindow.open(map, marker);
    });
  });
};




//
//
// function getFormInfos() {
//
//   var form = document.getElementById("form")
//   var lat = form.elements[0].value
//   var lng = form.elements[1].value
//   var msg = form.elements[2].value
//
//   placeMarker(map, lat, lng, msg);
//   map.setCenter(new google.maps.LatLng(+lat, +lng));
//   map.setZoom(6);
// }
