const initUpdateNavbarOnScroll = () => {
  const nav = document.getElementById('navbar-inicial');

  window.addEventListener('scroll', function () {
    if (window.pageYOffset > 250) {
      nav.classList.add('bg-dark', 'shadow');
      const nav_search = `
      <form action="#">
        <input type="text" name="" placeholder="   Type...">
        <input type="submit" name="" value="Search">
      </form>`
      document.getElementById("box-nav").innerHTML = nav_search;
      document.getElementById("box").innerHTML = "";
    }
    if (window.pageYOffset === 0 || window.pageYOffset < 100 ) {
      nav.classList.remove('bg-dark', 'shadow');
      document.getElementById("box-nav").innerHTML = "";
      const nav_search = `
      <form action="#">
        <input type="text" name="" placeholder="   Type...">
        <input type="submit" name="" value="Search">
      </form>`
      document.getElementById("box").innerHTML = nav_search;
    }else{

    }
  });
}

export { initUpdateNavbarOnScroll };
