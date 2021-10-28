// Imports
import mapboxgl from 'mapbox-gl';

const buildMap = (mapElement, marker) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v11',
    center: [ marker.lng, marker.lat ], // starting position [lng, lat]
    zoom: 13 // starting zoom
  });
};

async function getRoute(from, to, map) {
  // make a directions request using cycling profile
  // an arbitrary start will always be the same
  // only the end or destination will change
  const query = await fetch(
    `https://api.mapbox.com/directions/v5/mapbox/driving/${from[0]},${from[1]};${to[0]},${to[1]}?steps=true&overview=full&geometries=geojson&access_token=${mapboxgl.accessToken}`,
    { method: 'GET' }
  );
  const json = await query.json();
  const data = json.routes[0];
  const route = data.geometry.coordinates;
  const geojson = {
    type: 'Feature',
    properties: {},
    geometry: {
      type: 'LineString',
      coordinates: route
    }
  };
  // if the route already exists on the map, we'll reset it using setData
  if (map.getSource('route')) {
    map.getSource('route').setData(geojson);
  }
  // otherwise, we'll make a new request
  else {
    map.addLayer({
      id: 'route',
      type: 'line',
      source: {
        type: 'geojson',
        data: geojson
      },
      layout: {
        'line-join': 'round',
        'line-cap': 'round'
      },
      paint: {
        'line-color': '#3887be',
        'line-width': 5,
        'line-opacity': 0.75
      }
    });
  }
  // add turn instructions here at the end
}

const addMarkersToMap = (map, markerSkater, markerUser) => {
  const from = [ markerUser.lng, markerUser.lat ];
  const to = [ markerSkater.lng, markerSkater.lat ];
  getRoute(from, to, map);
  const popup = new mapboxgl.Popup().setHTML(markerSkater.info_window);   
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
    value.innerHTML = `Distancia: ${distance.toFixed([2])} km`
};


const getMap = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) {
    const markerSkater = JSON.parse(mapElement.dataset.markerSkate);
    const markerUser = JSON.parse(mapElement.dataset.markerUser);
    const map = buildMap(mapElement, markerSkater);          
    addMarkersToMap(map, markerSkater, markerUser);        
  }
};
getMap();
export { getMap };
