// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require react
//= require react_ujs
//= require materialize-sprockets
//= require components
//= require_tree .

$(document).ready(function(){

    var x = document.getElementById("mapholder");
    function getLocation() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(showPosition);
        } else {
            x.innerHTML = "Geolocation is not supported by this browser.";
        }
    }
    function showPosition(position) {
        lat = position.coords.latitude;
        lon = position.coords.longitude;
        latlon = new google.maps.LatLng(lat,lon)
        mapholder = document.getElementById('mapholder');
        mapholder.style.height = '250px';
        mapholder.style.width = '800px';
        storeLocation(lat, lon)
        var myOptions = {
        center:latlon,zoom:14,
        mapTypeId:google.maps.MapTypeId.ROADMAP,
        mapTypeControl:false,
        navigationControlOptions:{style:google.maps.NavigationControlStyle.SMALL}
        }
        
        var map = new google.maps.Map(document.getElementById("mapholder"), myOptions);
        var marker = new google.maps.Marker({position:latlon,map:map,title:"You are here!"});
    }
    function storeLocation(lat,lon) {
      var 
      $.ajax({
        url: '/requests/' + ,
        debugger;
        type: 'PUT',
        dataType: 'JSON',
        data: { request: {lat: lat, lon: lon} }
        success(data) {
          console.log('success')
        }
      });
    }
    

    // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
    $('.modal-trigger').leanModal();

    $('#locationbutton').click(function() {
     getLocation()
    });

    $("#user_roles_provider").click(function() {
      $("#towsmithunique").removeClass("hide")
    })

    $("#user_roles_user").click(function() {
      $("#towsmithunique").addClass("hide")
    })

    $(".button-collapse").sideNav();

    $('.slider').slider({full_width: true});

    $('.dropdown-button').dropdown({
      inDuration: 300,
      outDuration: 225,
      constrain_width: false, // Does not change width of dropdown to that of the activator
      hover: true, // Activate on hover
      gutter: 0, // Spacing from edge
      belowOrigin: false, // Displays dropdown below the button
      alignment: 'left' // Displays dropdown with edge aligned to the left of button
    });
  });

