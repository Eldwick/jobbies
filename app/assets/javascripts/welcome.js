var ready, openWindow;
ready = function() {
  if (google)
    google.maps.event.addDomListener(window, 'load', initialize);
  $(".company_row, .job_row").click(function() {
        window.document.location = $(this).attr("href");
  });
  $('.checkbox_filter').click(function() {
      $('#filter_form').submit();
  });
};

function initialize() {

  //Create Google Map Canvas
  geocoder = new google.maps.Geocoder();
  var latlng = new google.maps.LatLng(39.828127, -98.579404); //Center of contiguous USA
  var mapOptions = {
    zoom: 5,
    center: latlng
  }

  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
  
  for (var company_index in companies_addresses){
    var image = 'http://google-maps-icons.googlecode.com/files/workoffice.png';
    var companyGeoCordinates = new google.maps.LatLng(companies_addresses[company_index][0],companies_addresses[company_index][1]);
    console.log()
    var activeMarker = new google.maps.Marker({
      map: map,
      position: companyGeoCordinates,
      icon: image,
      title: companies_addresses[company_index][0].toString(),
    });

    var mapclick = function(companyGeoCordinates) {
      // map.setZoom(12);
      map.setCenter(companyGeoCordinates);
    }
    console.log(companyGeoCordinates)
    

    var contentString = "<p><img src='"+companies_addresses[company_index][4]+"'></p><a href='/companies/"+
      companies_addresses[company_index][3]+"'><h1> "
       +  companies_addresses[company_index][2] +" </h1></a>"

    var infowindow = new google.maps.InfoWindow({
      content: contentString
    });
    google.maps.event.addListener(activeMarker, 'click', function(marker, inwin){ return function() {
        if (map.getZoom() < 10 )
          map.setZoom(5);
        if (openWindow)
          openWindow.close();
        inwin.open(map, marker);
        openWindow = inwin;
        if (map.getZoom() < 10 )
          map.setCenter(marker.getPosition());
          map.setZoom(12);
      }
    }(activeMarker, infowindow));

  }

}
    

  // //Adds right click function: finds geocordinates of the location of click and compares it to geolocation of the activemarker, 
  // //displays an infowindow with distance, and ability to see all schools within that radius
  // google.maps.event.addListener(map, "rightclick", function(event) {

  //   //Coordinates of right click
  //   var clickLat = event.latLng.lat();
  //   var clickLng = event.latLng.lng();
  //   var clickLatlng = new google.maps.LatLng(clickLat, clickLng);   
    
  //   //Coordinates of active marker
  //   var markerLat = activeMarker.position.lat();
  //   var markerLng = activeMarker.position.lng();
  //   var markerLatlng = new google.maps.LatLng(markerLat, markerLng);
    
  //   //Calculate distance between click and active marker
  //   var distance = getDistance(clickLatlng, markerLatlng);
  //   var distanceInMiles = Math.floor(distance * 100) / 100;
    
  //   //creates infowindow to display miles from 
  //   var infowindow = new google.maps.InfoWindow({
  //     position: clickLatlng,
  //     content: "<b>" + distanceInMiles + " miles from " + activeSchoolName + "."+ "</b>"+
  //         '</br><a href="javascript:schoolsInRadius(' + markerLat + ',' + markerLng +',' + distance + ')">See schools within radius</a>',
  //   });
    
  //   //Close distanceWindows if any are already open
  //   if(openDistanceInfoWindow){
  //     openDistanceInfoWindow.close();
  //   }
    
  //   //Assign infowindow to global
  //   openDistanceInfoWindow = infowindow;
    
  //   //open infowindow on map at click location
  //   infowindow.open(map);
  // })  


$(document).ready(ready);
$(document).on('page:load', ready);
