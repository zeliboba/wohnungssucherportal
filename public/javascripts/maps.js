function placeMarkers(addresses, markerColor) {
  var markers = {};
  $(addresses).each(function(index, flat) {
    var markerOptions = {
      'position': new google.maps.LatLng(flat.latitude, flat.longitude),
      'title': flat.name || flat.full_address,
      'icon': icon(markerColor || 'red'),
      'map': map
    };
    var marker = new google.maps.Marker(markerOptions);
    markers[flat.id] = marker;
  });
  return markers;  
}

function icon(color) {
  return new google.maps.MarkerImage(
    "http://www.google.com/intl/en_us/mapfiles/ms/micons/" + color + "-dot.png",
    new google.maps.Size(32, 32)
  );
}

function centerMap(map, geocoder) {
  geocoder.geocode({'address': 'Kleinhesseloher See, München'}, function(results, status) {
    map.setCenter(results[0].geometry.location);
  });
}