const initUpdateNavbarOnScroll = () => {
  const nav = document.getElementById('navbar-inicial');

  window.addEventListener('scroll', function () {
    if (window.pageYOffset > 250) {
      nav.classList.add('bg-dark', 'shadow');
      const nav_search = `
      <form action="skates/" method="get">
        <input type="text" name="search" placeholder="   Type...">
        <input type="submit" value="Search">
      </form>`
      document.getElementById("box-nav").innerHTML = nav_search;
      document.getElementById("box").innerHTML = "";
    } else if (window.pageYOffset < 100) {
      nav.classList.remove('bg-dark', 'shadow');
      document.getElementById("box-nav").innerHTML = "";
      const nav_search = `
      <form action="skates/" method="get">
        <input type="text" name="search" placeholder="   Type...">
        <input type="submit" value="Search">
      </form>`
      document.getElementById("box").innerHTML = nav_search;
    }else{

    }
  });
}

export { initUpdateNavbarOnScroll };
