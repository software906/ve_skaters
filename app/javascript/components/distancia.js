// Imports
import mapboxgl from 'mapbox-gl';

const buildMap = (mapElement, marker) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v11',
    center: [ marker.lng, marker.lat ], // starting position [lng, lat]
    zoom: 10 // starting zoom
  });
};

const addMarkersToMap = (map, marker, data) => {
  const from = [ data.coords.longitude, data.coords.latitude ];
  const to = [ marker.lng, marker.lat ];
  const popup = new mapboxgl.Popup().setHTML(marker.info_window);   
  // Agregar marcadores al mapa
    new mapboxgl.Marker({ color: 'black', rotation: 45 })
      .setLngLat(from)
      .addTo(map);
    
    new mapboxgl.Marker()
      .setLngLat(to)
      .setPopup(popup)
      .addTo(map);
  // Calcular distancia
    const options = {
      units: 'kilometers'
    };
    const distance = turf.distance(to, from, options);
    console.log(distance);
  // Mostrar en el html
    const value = document.getElementById('map-overlay')
    const value = document.getElementById('card-distancia')
    value.innerHTML = `Distancia: ${distance.toFixed([2])} km`
};

const getMap = () => {
  const cardElement = document.getElementById('card-distancia');
  if (cardElement) {
    const marker = JSON.parse(mapElement.dataset.markers);
    const map = buildMap(mapElement, marker);
    navigator.geolocation.getCurrentPosition((data) => {      
      addMarkersToMap(map, marker, data);
    });    
  }
};

getMap();

export { getMap };

