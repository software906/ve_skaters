import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Quieres alquilar una tabla?", "VeSkaters es tu mejor opcion", "Disfruta tu recorrido."],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
