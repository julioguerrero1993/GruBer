<%-- 
    Document   : header
    Created on : 10-12-2017, 22:44:31
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script> 
      function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -34.397, lng: 150.644},
          zoom: 15
        });
        var infoWindow = new google.maps.InfoWindow({map: map});

        // intenta iniciar el mapa.
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var pos = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };

            infoWindow.setPosition(pos);
            infoWindow.setContent("Ubicacion encontrada");
            agregaColorTextoContent();
            map.setCenter(pos);
          }, function() {
            handleLocationError(true, infoWindow, map.getCenter());
          });
          agregaColorTextoContent();
        } else {
          // navegador no puede utilizar el geolocalizador
          handleLocationError(false, infoWindow, map.getCenter());
        }
      }
      
      function agregaColorTextoContent(){
          $('.gm-style-iw').css('color','black');
      }
      
      function handleLocationError(browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
                              'Error: The Geolocation service failed.' :
                              'Error: Your browser doesn\'t support geolocation.');
      }
      function buscarGruas(){
        var map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -34.397, lng: 150.644},
          zoom: 15
        });
        var marker = new google.maps.Marker({
          position: posgruas,
          map: map
        });
        var infoWindow2 = new google.maps.InfoWindow({map: map});
        var posgruas = {lat: -33.4206593, lng: -70.6067563};
        navigator.geolocation.getCurrentPosition(function(position) {
            infoWindow2.setPosition(posgruas);
            infoWindow2.setContent("Grúa encontrada");
            agregaColorTextoContent();
            map.setCenter(posgruas);
      });}
    </script>
<header class="c-header">
      <div class="container">
        <div class="row">
          <div class="col-sm-12">
            <div class="c-header__link"><a href="#"><img src="${pageContext.request.contextPath}/img/grua2.png"></a></div>
            <div class="c-header__sesion"><a class="c-header__btn c-header__btn--login" href="#loginModal">Iniciar Sesión</a><a class="c-header__btn c-header__btn--help" href="#">Te ayudamos</a></div>
            <div class="c-header__service"><span>Servicio al cliente</span><a href="tel:+5626005005000">600 500 5000</a></div>
            <div class="c-header__toogle"><a class="c-header__menu" id="menu-mobile" href="#" state="0"></a></div>
            <div class="c-header__mobile-buttons"><a class="c-header__btn-mobile c-header__btn-mobile--call" href="tel:6005005000"><i></i></a><a class="c-header__btn-mobile c-header__btn-mobile--user" href="#loginModal"><i></i></a></div>
          </div>
        </div>
      </div>
    </header>
    <nav class="c-nav">
      <ul class="c-nav__items">
        <li class="c-nav__item--closeMenu u-hidemobile"><a id="close_menu" href="#"><i class="mx-cancel"></i></a></li>
        <li class="c-nav__item"><a class="c-nav__link" href="#">Inicio</a></li>
        <li class="c-nav__item"><a class="c-nav__link js-nav-mobile" href="#">Nosotros<i class="mx-chevron-down"> </i></a>
          <ul class="c-nav__sub">
            <li class="c-nav__subitem"><a class="c-nav__link" href="#">Vision</a></li>
            <li class="c-nav__subitem"><a class="c-nav__link" href="#">Mision</a></li>
            <li class="c-nav__subitem"><a class="c-nav__link" href="#">Historia de la Empresa</a></li>
          </ul>
        </li>
        <li class="c-nav__item"><a class="c-nav__link js-nav-mobile" href="#">Nuestra Flota<i class="mx-chevron-down"> </i></a></li>
        <li class="c-nav__item"><a class="c-nav__link js-nav-mobile" href="#">Servicios<i class="mx-chevron-down"></i></a>
          <ul class="c-nav__sub">
            <li class="c-nav__subitem"><a class="c-nav__link" href="#">Grúas </a></li>
            <li class="c-nav__subitem"><a class="c-nav__link" href="#">Servicios adicionales</a></li>
          </ul>
        </li>
      </ul>
    </nav>
