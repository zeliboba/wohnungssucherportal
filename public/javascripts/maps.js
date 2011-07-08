// FIXME don't pass in everything and the kitchen sink
function addReferencePoints(map, geocoder, adressesArray) {
  // add some city reference points
  adressesArray.each(function(address) {
    geocoder.geocode({'address': address}, function(results, status) {
      var markerOptions = {
        'position': results[0].geometry.location,
        'title': address,
        'icon': icon('green'),
        'map': map
      };
      var marker = new google.maps.Marker(markerOptions);
    });    
  });
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