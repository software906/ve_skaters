// Imports
import mapboxgl from 'mapbox-gl';

console.log("helpppppp");
  // Solicitar coordenadas a la API
const getMap = () => {
  // Constantes
    const apiKey = 'pk.eyJ1IjoiY3Jpc3RpYW0xNCIsImEiOiJja3VpcW1qcHkwY2k4MnBvNjR6NHBqcWFtIn0.t0R1MNl0wh8gQbADchcfAg';
    const direccion = "caracas"
    const baseUrl = `https://api.mapbox.com/geocoding/v5/mapbox.places/${direccion}.json?access_token=${apiKey}`;
  // Auxiliares
    mapboxgl.accessToken = apiKey;
    // Funciones auxiliares
    const showMap = (coord) => {
      console.log(coord)
      const map = new mapboxgl.Map({
      container: 'map', // container ID
      style: 'mapbox://styles/mapbox/streets-v11', // style URL
      center: coord, // starting position [lng, lat]
      zoom: 12 // starting zoom
    });
    new mapboxgl.Marker()
      .setLngLat(coord)
      .addTo(map);
    };
    console.log(baseUrl);
    fetch(baseUrl)
      .then(response => response.json())
      .then((data) => {
        const coord = data.features[0].center;
        // coordinates.innerText = `${coord[1]}, ${coord[0]}`;
        showMap(coord);
      });
  };
  getMap();
  export { getMap };