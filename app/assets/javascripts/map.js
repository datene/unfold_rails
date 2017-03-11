$(document).on('ready', function() {
  var handler = Gmaps.build('Google', { markers: { clusterer: undefined }});
  handler.buildMap({
    internal: { id: 'map' }, 
    provider: { 
      zoom: 15,
      center: new google.maps.LatLng(52.3430396, 4.8288395),
    }
  }, 
  function(){
    markers = handler.addMarkers([
    {
      "lat": 52.3430396,
      "lng": 4.8288395,
      "infowindow": "<strong>B. Amsterdam</strong><p><img src='https://lh3.googleusercontent.com/-X4fh35ZBHEk/VuwlhTf2CqI/AAAAAAAAAFw/oDdCgsbEYwAB56BoS_MMrvUGEZO9Z8eKgCJkC/s415-k-no/' height='100'></p>"      }
      ]);
    handler.bounds.extendWith(markers);
  });
})