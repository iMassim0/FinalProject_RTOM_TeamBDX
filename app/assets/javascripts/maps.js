var map;
var path;

var bordeaux;
var kochi;
var varkala;
var jodhpur;
var mathura;
var delhi;
var bhaktapur;
var chame;
var yak_kharka;
var thorong_pedi;
var thorong_la_pass;
var kawah_ijen;
var gili_t;
var gunung_rinjani;
var amed;
var jemeluk;
var koyasan;
var miyajima;
var hiroshima;
var onomichi;
var kurashiki;
var okayama;
var kyoto;
var tokyo;
var waikiki;
var kehena_beach;
var kilauea;
var kona;
var waipio;
var san_francisco;


function myMap() {

bordeaux = new google.maps.LatLng(44.8637226,-0.6211603);
kochi = new google.maps.LatLng(9.9385818,76.1803488);
varkala = new google.maps.LatLng(8.7432563,76.699973);
jodhpur = new google.maps.LatLng(26.2703358,72.9605034);
mathura = new google.maps.LatLng(27.47437,77.6491352);
delhi = new google.maps.LatLng(28.6923329,76.9512663);
bhaktapur= new google.maps.LatLng(27.6773977,85.4157119);
chame = new google.maps.LatLng(28.5242686,84.1703563);
yak_kharka = new google.maps.LatLng(28.7229868,83.9713452);
thorong_pedi = new google.maps.LatLng(28.7872291,83.9533751);
thorong_la_pass = new google.maps.LatLng(28.793377,83.9299142);
kawah_ijen = new google.maps.LatLng(-8.0580702,114.2395936);
gili_t = new google.maps.LatLng(-8.3518437,116.0386536);
gunung_rinjani = new google.maps.LatLng(-8.411295,116.448594);
amed = new google.maps.LatLng(-8.332832,115.6385913);
jemeluk = new google.maps.LatLng(-8.3381438,115.6581073);
koyasan = new google.maps.LatLng(34.2132427,135.5803737);
miyajima = new google.maps.LatLng(34.7854063,135.5687679);
hiroshima = new google.maps.LatLng(34.393845,132.4066806);
onomichi = new google.maps.LatLng(34.4143216,133.0332101);
kurashiki = new google.maps.LatLng(34.5433152,133.6022089);
okayama = new google.maps.LatLng(34.7335465,133.7911041);
kyoto = new google.maps.LatLng(35.006095,135.7259306);
tokyo = new google.maps.LatLng(35.6732619,139.5703049);
waikiki= new google.maps.LatLng(21.2801309,-157.8370756);
kehena_beach = new google.maps.LatLng(19.3946571,-154.9378426);
kilauea = new google.maps.LatLng(19.4068923,-155.2921334);
kona = new google.maps.LatLng(19.6643281,-155.9905465);
waipio = new google.maps.LatLng(20.1114619,-155.6038046);
san_francisco = new google.maps.LatLng(37.7576948,-122.4726194);

path = [bordeaux, kochi, varkala, jodhpur, mathura, delhi, bhaktapur, chame, yak_kharka, thorong_pedi, thorong_la_pass, kawah_ijen, gili_t, gunung_rinjani, amed, jemeluk, koyasan, miyajima, hiroshima, kyoto, tokyo, waikiki, kehena_beach, kilauea, kona, waipio, san_francisco];

  var mapCenter = new google.maps.LatLng(31.3938605,134.663557);

  var mapCanvas = document.getElementById("googleMap");
  var mapOptions = {center: mapCenter, zoom: 2, mapTypeId: google.maps.MapTypeId.TERRAIN, mapTypeControl: false, fullscreenControl: false, styles: [
            {elementType: 'geometry', stylers: [{color: '#242f3e'}]},
            {elementType: 'labels.text.stroke', stylers: [{color: '#242f3e'}]},
            {elementType: 'labels.text.fill', stylers: [{color: '#746855'}]},
            {
              featureType: 'administrative.locality',
              elementType: 'labels.text.fill',
              stylers: [{color: '#d59563'}]
            },
            {
              featureType: 'poi',
              elementType: 'labels.text.fill',
              stylers: [{color: '#d59563'}]
            },
            {
              featureType: 'poi.park',
              elementType: 'geometry',
              stylers: [{color: '#263c3f'}]
            },
            {
              featureType: 'poi.park',
              elementType: 'labels.text.fill',
              stylers: [{color: '#6b9a76'}]
            },
            {
              featureType: 'road',
              elementType: 'geometry',
              stylers: [{color: '#38414e'}]
            },
            {
              featureType: 'road',
              elementType: 'geometry.stroke',
              stylers: [{color: '#212a37'}]
            },
            {
              featureType: 'road',
              elementType: 'labels.text.fill',
              stylers: [{color: '#9ca5b3'}]
            },
            {
              featureType: 'road.highway',
              elementType: 'geometry',
              stylers: [{color: '#746855'}]
            },
            {
              featureType: 'road.highway',
              elementType: 'geometry.stroke',
              stylers: [{color: '#1f2835'}]
            },
            {
              featureType: 'road.highway',
              elementType: 'labels.text.fill',
              stylers: [{color: '#f3d19c'}]
            },
            {
              featureType: 'transit',
              elementType: 'geometry',
              stylers: [{color: '#2f3948'}]
            },
            {
              featureType: 'transit.station',
              elementType: 'labels.text.fill',
              stylers: [{color: '#d59563'}]
            },
            {
              featureType: 'water',
              elementType: 'geometry',
              stylers: [{color: '#17263c'}]
            },
            {
              featureType: 'water',
              elementType: 'labels.text.fill',
              stylers: [{color: '#515c6d'}]
            },
            {
              featureType: 'water',
              elementType: 'labels.text.stroke',
              stylers: [{color: '#17263c'}]
            }
          ]};

  map = new google.maps.Map(mapCanvas,mapOptions);

  var flightPath = new google.maps.Polyline({
    path: path,
    strokeColor: "#FF6600",
    strokeOpacity: 0.8,
    strokeWeight: 3,
    geodesic: true
  });

  flightPath.setMap(map);

  i = 0;

  path.forEach(function placeMarker(step) {

    var marker = new google.maps.Marker({
        position: step,
        map: map,
    });

    var infoWindow = new google.maps.InfoWindow({content: i.toString()});

    i += 1;

    google.maps.event.addListener(marker, 'click', function(event) {
        var location = infoWindow.getContent();
        if (location != 0) {
          toggleLocation(location);
        } else {

        }
    });

  });

};

function toggleLocation(locIndex) {
  $('#trip-container').html("");
  $('#trip-container').load(`locations.html #marker-${locIndex}`);
};

function recenterMap(locIndex) {
  map.setCenter((path[locIndex]));
  map.setZoom(8);
};
