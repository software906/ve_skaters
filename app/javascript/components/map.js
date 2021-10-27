// Imports
import mapboxgl from 'mapbox-gl';
// import 'mapbox-gl/dist/mapbox-gl.css';


const buildMap = (mapElement, marker) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v11',
    center: [ marker.lng, marker.lat ], // starting position [lng, lat]
    zoom: 13 // starting zoom
  });
};

const addMarkersToMap = (map, marker, data) => {  
  const popup = new mapboxgl.Popup().setHTML(marker.info_window);
    new mapboxgl.Marker()      
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);

    new mapboxgl.Marker()      
      .setLngLat([ data.coords.longitude, data.coords.latitude ])
      .addTo(map);  
};

const getMap = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) {
    const marker = JSON.parse(mapElement.dataset.markers);
    const map = buildMap(mapElement, marker);
    navigator.geolocation.getCurrentPosition((data) => {
      console.log(data);
      addMarkersToMap(map, marker, data);
    });    
  }
};

getMap();

export { getMap };

