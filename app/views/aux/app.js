// TODO: Write your JS code in here
// Imports
import mapboxgl from 'mapbox-gl';
// Constantes
const inputText = document.getElementById("input-text-box");
const apiKey = 'pk.eyJ1IjoiY3Jpc3RpYW0xNCIsImEiOiJja3VpcW1qcHkwY2k4MnBvNjR6NHBqcWFtIn0.t0R1MNl0wh8gQbADchcfAg';
const submitBtn = document.getElementById("submit-btn");
const coordinates = document.getElementById("coordinates");
const results = document.getElementById("results");

// Auxiliares
mapboxgl.accessToken = apiKey;
// Auto completar
inputText.addEventListener("keyup", (event) => {
  fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${inputText.value}.json?access_token=${apiKey}`)
    .then(response => response.json())
    .then((data) => {
      data.features.forEach((result) => {
        const lugar = result.place_name;
        lugar.replace(/,/, "");
        const wordTag = `<option value=${lugar}></option>`;
        results.insertAdjacentHTML("beforeend", wordTag);
      });
    });
});
inputText.addEventListener("keydown", (event) => {
  results.innerHTML = '';
});

// Funciones auxiliares
const showMap = (coord) => {
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

// Solicitar coordenadas a la API
const getData = (baseUrl) => {
  fetch(baseUrl)
    .then(response => response.json())
    .then((data) => {
      const coord = data.features[0].center;
      coordinates.innerText = `${coord[1]}, ${coord[0]}`;
      showMap(coord);
    });
};

// Eventos
submitBtn.addEventListener("click", (event) => {
  event.preventDefault();
  const direccion = inputText.value;
  const baseUrl = `https://api.mapbox.com/geocoding/v5/mapbox.places/${direccion}.json?access_token=${apiKey}`;
  getData(baseUrl);
});
