// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
// CSS
import 'mapbox-gl/dist/mapbox-gl.css';

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { initUpdateNavbarOnScroll } from '../components/navbar';
import { loadDynamicBannerText } from '../components/banner';
import { getMap } from '../components/map'
import { initUpdateGoTop } from '../components/gotop';
import { initSweetalert } from '../plugins/init_sweetalert';
// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  initUpdateNavbarOnScroll();
  loadDynamicBannerText();
  initUpdateGoTop();
  setInterval(refresh, 1000);
  const refresh = () => {
    getMap();
  };

  initSweetalert('#sweet-alert-demo', {
    title: "Bienvenido",
    text: "This is a great alert, isn't it?",
    icon: "success"
  });
});

console.log("Hello from app/javascript/packs/application.js!");
