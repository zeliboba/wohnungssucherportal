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

