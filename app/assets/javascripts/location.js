var x = document.getElementById("demo");
function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else {
        x.innerHTML = "Geolocation is not supported by this browser.";
    }
},
function showPosition(position) {
    lat = position.coords.latitude;
    lon = position.coords.longitude;
    storeLocation(lat,lon);
    latlon = new google.maps.LatLng(lat, lon)
    mapholder = document.getElementById('mapholder');
    mapholder.style.height = '250px';
    mapholder.style.width = '500px';
    var myOptions = {
    center:latlon,zoom:14,
    mapTypeId:google.maps.MapTypeId.ROADMAP,
    mapTypeControl:false,
    navigationControlOptions:{style:google.maps.NavigationControlStyle.SMALL}
    }
    var map = new google.maps.Map(document.getElementById("mapholder"), myOptions);
    var marker = new google.maps.Marker({position:latlon,map:map,title:"You are here!";
},
function storeLocation(lat,lon) {
  $.ajax({
    debugger;
    url: '/location',
    type: 'POST',
    data: { lat: lat, lon: lon }
    success: function() {

      // TODO: make an html 'Location Stored'
      }
    })
};
