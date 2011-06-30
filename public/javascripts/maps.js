function initMap(width, height) {
	if (!GBrowserIsCompatible()) { return; }
  // init
  var map = new GMap2(
    document.getElementById("map_canvas"),
    { 'size': new GSize(width, height)}
  );
  // set UI
  map.addControl(new GMapTypeControl());
  map.addControl(new GScaleControl());
  map.addControl(new GSmallZoomControl());
  map.removeMapType(G_HYBRID_MAP);
	return map;
}

// FIXME don't pass in everything and the kitchen sink
function addReferencePoints(map, geocoder, pointsArray) {
  // add some city reference points
  pointsArray.each(function(point) {
    geocoder.getLatLng(point, function(latLng) {
      var markerOptions = {
        'title': point,
        'icon': icon('green')
      };
      var marker = new GMarker(latLng, markerOptions);
      map.addOverlay(marker);
    });    
  });
}

function icon(color) {
  var icon = new GIcon(G_DEFAULT_ICON);
  icon.image = "http://www.google.com/intl/en_us/mapfiles/ms/micons/" + color + "-dot.png";
  icon.iconSize = new GSize(34, 34);
  icon.shadow = false;
  return icon;
}

