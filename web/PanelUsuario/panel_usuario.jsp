<%-- 
    Document   : panel_usuario
    Created on : 10-12-2017, 22:33:23
    Author     : jg
--%>
<%@page import="DTO.Cliente"%>
<% HttpSession sessionCliente = request.getSession(); %>
<% Cliente cliente = (Cliente) sessionCliente.getAttribute("sessionCliente"); %>
<% if (cliente == null) {
   response.sendRedirect("index.jsp");
} %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edsge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Panel de Usuario </title>
    <link rel="apple-touch-icon" sizes="57x57" href="img/favicon/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="img/favicon/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="img/favicon/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="img/favicon/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="img/favicon/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="img/favicon/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="img/favicon/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="img/favicon/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="img/favicon/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="img/favicon/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="img/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="img/favicon/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="img/favicon/favicon-16x16.png">
    <link rel="manifest" href="img/favicon/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="img/favicon/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <link href="https://fonts.googleapis.com/css?family=Fira+Sans:400,700|Varela+Round" rel="stylesheet">
    <link href="../css/main.min.css" rel="stylesheet">
    <script src="https://www.google.com/recaptcha/api.js"></script>
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
    <style>
      #map {
        height: 85%;
      }
    </style>
  </head>
  <body>
    <!-- HEADER -->
    <%@include file="../header/header.jsp" %>
    <!-- FIN HEADER -->
    <main role="main">
      <div class="remodal-bg">
        <section class="container">
          <div class="row">
            <div class="col-12">
              <h1 class="o-title o-title--primary">Penel de Usuario</h1>
            </div>
            <div class="col-12">
              <section class="o-box o-box--recruiting u-mtb50">
                <div class="u-pad20">
                  <div class="row">
                    <div class="col-lg-8 u-mobile_second">
                      <h2 class="o-title o-title--subtitle u-mb10">Datos de tu Grúa</h2>
                      <p class="o text">Vista en Vivo de tu Grúa.</p>
                      <div id="map"></div>
                    </div>
                    <div class="col-lg-4 u-mobile_first">
                      <section class="c-summary" id="summary_sure">
                        <h2 class="c-summary__title">Resumen de tu cuenta</h2>
                        <div class="c-summary__company"><img class="c-summary__image" src="img/summary_seguros_sura.png" alt=""></div>
                        <h3 class="c-summary__subtitle">Datos del Usuario</h3>
                        <div class="row">
                          <div class="col-12">
                            <div class="c-summary__cost">
                              <div class="c-summary__label">Nombre : </div>
                              <div class="c-summary__price"><sup> </sup><%= cliente.getNombre() %><sub></sub></div>
                            </div>
                            <p class="c-summary__legal">Grúa en Camino : NO</p>
                          </div>
                          <div class="col-12 u-mobile_second">
                            <div class="o-collapse"><a class="o-collapse__button o-btn o-btn--outline o-btn--secundary o-btn o-btn--icon" href="#" state="0"> Ver detalle de la Cuenta<i class="o-icon o-icon--triangle"><span class="u-triangle_down"></span></i></a>
                              <div class="o-collapse__content">
                                <div class="c-summary__detail">
                                  <table class="o-table o-table--basic u-mb20">
                                    <thead class="o-table__head">
                                      <tr class="o-table__row">
                                        <th class="o-table__col">Correo</th>
                                        <th class="o-table__col">Telefono</th>
                                      </tr>
                                    </thead>
                                    <tbody class="o-table__body">
                                      <tr class="o-table__row">
                                          <td class="o-table__col"><%= cliente.getCorreo() %></td>
                                        <td class="o-table__col"><%= cliente.getTelefono() %></td>
                                      </tr>
                                    </tbody>
                                  </table>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="c-assistance u-mb30 u-hidden_mobile">
                          <h4 class="c-assistance__title">¿Necesitas asistencia?</h4><a class="c-assistance__button o-btn o-btn--outline o-btn--secundary o-btn o-btn--icon" href="#">Te llamamos gratis</a>
                          <p class="c-assistance__text">O llámanos gratis al<strong class="c-assistance__outstanding"> 600 500 5000</strong></p>
                        </div>
                      </section>
                    </div>
                  </div>
                </div>
              </section>
            </div>
          </div>
        </section>
      </div>
      <div class="remodal c-modal" data-remodal-id="loginModal" role="dialog" aria-labelledby="modal1Title" aria-describedby="modal1Desc">   
        <button class="remodal-close" data-remodal-action="close" aria-label="Close">  </button>
        <div class="c-modal__wrap">
          <div class="c-modal__modalHead">
            <div class="c-modal__modalHead-inner"><i class="o-icon">
                <svg width="20px" height="23px" viewbox="0 0 20 23" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                  <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                    <g id="iPhone-7-Copy" transform="translate(-115.000000, -119.000000)" fill="#E8772A">
                      <g id="user" transform="translate(115.000000, 119.000000)">
                        <g id="Group-4">
                          <path id="Shape" d="M19.8691499,18.2666667 L19.8691499,18.252381 C19.8691499,18.2142857 19.8643123,18.1761905 19.8643123,18.1333333 C19.835287,17.1904762 19.7723988,14.9857143 17.6729005,14.2809524 C17.6583878,14.2761905 17.6390376,14.2714286 17.6245249,14.2666667 C15.4427882,13.7190476 13.6287055,12.4809524 13.6093553,12.4666667 C13.3142645,12.2619048 12.90791,12.3333333 12.6998952,12.6238095 C12.4918804,12.9142857 12.5644437,13.3142857 12.8595345,13.5190476 C12.9417729,13.5761905 14.8671193,14.8952381 17.2762211,15.5047619 C18.4033711,15.9 18.5291475,17.0857143 18.5630104,18.1714286 C18.5630104,18.2142857 18.5630104,18.252381 18.5678479,18.2904762 C18.5726855,18.7190476 18.5436601,19.3809524 18.4662593,19.7619048 C17.6825756,20.2 14.6107289,21.7142857 9.93765202,21.7142857 C5.28392531,21.7142857 2.19272846,20.1952381 1.4042072,19.7571429 C1.32680634,19.3761905 1.29294347,18.7142857 1.30261857,18.2857143 C1.30261857,18.247619 1.30745613,18.2095238 1.30745613,18.1666667 C1.341319,17.0809524 1.4670954,15.8952381 2.59424543,15.5 C5.00334719,14.8904762 6.92869359,13.5666667 7.010932,13.5142857 C7.30602278,13.3095238 7.37858609,12.9095238 7.17057127,12.6190476 C6.96255646,12.3285714 6.55620195,12.2571429 6.26111117,12.4619048 C6.24176095,12.4761905 4.4373534,13.7142857 2.24594156,14.2619048 C2.22659134,14.2666667 2.21207868,14.2714286 2.19756602,14.2761905 C0.0980676904,14.9857143 0.0351794916,17.1904762 0.00615416912,18.1285714 C0.00615416912,18.1714286 0.00615416912,18.2095238 0.00131661537,18.247619 L0.00131661537,18.2619048 C-0.00352093838,18.5095238 -0.00835849214,19.7809524 0.248031857,20.4190476 C0.296407394,20.5428571 0.383483362,20.647619 0.499584652,20.7190476 C0.644711264,20.8142857 4.12291241,22.9952381 9.94248957,22.9952381 C15.7620667,22.9952381 19.2402679,20.8095238 19.3853945,20.7190476 C19.4966582,20.647619 19.5885718,20.5428571 19.6369473,20.4190476 C19.878825,19.7857143 19.8739874,18.5142857 19.8691499,18.2666667 Z" fill-rule="nonzero"></path>
                          <path id="Shape" d="M9.85057605,12.3904762 L9.92797691,12.3904762 L9.95700223,12.3904762 L10.0053778,12.3904762 C11.422781,12.3666667 12.5692813,11.8761905 13.4158532,10.9380952 C15.2783114,8.87142857 14.9687079,5.32857143 14.934845,4.99047619 C14.8139062,2.45238095 13.5948427,1.23809524 12.5886315,0.671428571 C11.8388106,0.247619048 10.9632134,0.019047619 9.98602756,0 L9.95216468,0 L9.93281447,0 L9.90378914,0 C9.36682068,0 8.31223396,0.0857142857 7.30118523,0.652380952 C6.28529894,1.21904762 5.04688518,2.43333333 4.92594633,4.99047619 C4.89208346,5.32857143 4.58248002,8.87142857 6.44493821,10.9380952 C7.28667256,11.8761905 8.4331728,12.3666667 9.85057605,12.3904762 Z M6.21757318,5.10952381 C6.21757318,5.0952381 6.22241074,5.08095238 6.22241074,5.07142857 C6.38205001,1.65714286 8.84436487,1.29047619 9.89895159,1.29047619 L9.9183018,1.29047619 L9.95700223,1.29047619 C11.2631417,1.31904762 13.4835789,1.84285714 13.6335431,5.07142857 C13.6335431,5.08571429 13.6335431,5.1 13.6383806,5.10952381 C13.6432182,5.14285714 13.981847,8.38095238 12.4435049,10.0857143 C11.8339731,10.7619048 11.0212641,11.0952381 9.95216468,11.1047619 L9.92797691,11.1047619 L9.92797691,11.1047619 L9.90378914,11.1047619 C8.83952732,11.0952381 8.02198073,10.7619048 7.41728652,10.0857143 C5.88378198,8.39047619 6.21273563,5.13809524 6.21757318,5.10952381 Z" fill-rule="nonzero"></path>
                        </g>
                      </g>
                    </g>
                  </g>
                </svg></i>
              <h1>INICIO SESIÓN</h1>
            </div>
          </div>
          <div class="c-modal__modalBody">
            <form class="o-form--loginForm" id="login">
              <div class="row">
                <div class="col-lg-12">
                  <div class="o-form__field">
                    <label class="o-form__label">RUT</label>
                    <input class="o-form__input" type="text" placeholder="Ej: 1234567-9" required="" name="rut" maxlength="12"><span class="o-form__message"></span>
                  </div>
                </div>
                <div class="col-lg-12">
                  <div class="o-form__field">
                    <label class="o-form__label">Contraseña</label>
                    <input class="o-form__input" type="text" placeholder="*******" required="" name="password"><span class="o-form__message"></span>
                  </div>
                </div>
                <div class="col-lg-12">
                  <div class="o-form__field">
                    <button class="o-btn o-btn--primary" id="enter" type="submit">Ingresar</button>
                  </div>
                </div>
              </div>
            </form>
          </div>
          <div class="c-modal__modalLinks">
            <div class="row">
              <div class="col-lg-12"><a class="lostPass" href="#">¿OLVIDASTE TU CONTRASEÑA?</a><a class="lostPass" href="#">¿Para que sirve tu clave? </a></div>
              <div class="col-lg-12"><a class="registration" href="#"><i class="o-icon">
                    <svg width="18px" height="18px" viewbox="0 0 18 18" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                      <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                        <g id="iPhone-7-Copy" transform="translate(-133.000000, -443.000000)" fill="#E8772A">
                          <g id="key" transform="translate(133.000000, 443.000000)">
                            <g id="Group-14">
                              <path id="Shape" d="M16.3993732,1.59392593 C15.3694392,0.566074074 13.9999918,0 12.5434021,0 C11.0867753,0 9.71736495,0.566074074 8.68743093,1.59392593 C7.12028041,3.15785185 6.66508454,5.48944444 7.49738969,7.50866667 L0.00612371134,14.9845926 L0,17.9574815 L5.36518763,17.9635926 L5.36518763,15.8998148 L7.43258969,15.8998148 L7.43258969,13.8366667 L9.49999175,13.8366667 L9.49999175,11.4480741 L10.4728082,10.4772593 C11.1265608,10.744037 11.8347959,10.8837778 12.543699,10.8837778 C14.0001773,10.8837778 15.3695134,10.3177778 16.3993732,9.29 C18.5255629,7.16818519 18.5255629,3.71574074 16.3993732,1.59392593 Z M15.6120866,8.50433333 C14.7925113,9.32222222 13.7027876,9.77266667 12.543699,9.77266667 C11.8707216,9.77266667 11.1988206,9.6147037 10.600701,9.31588889 L10.2417402,9.13655556 L8.38658969,10.9878519 L8.38658969,12.7255556 L6.31918763,12.7255556 L6.31918763,14.7887037 L4.25178557,14.7887037 L4.25178557,16.8512222 L1.11570309,16.8476667 L1.11859794,15.4458148 L8.84122887,7.73888889 L8.66152577,7.38066667 C7.82380206,5.71077778 8.15058557,3.701 9.47471753,2.37959259 C10.2944041,1.56159259 11.3842021,1.11111111 12.5434021,1.11111111 C13.7026021,1.11111111 14.7924,1.56159259 15.6120866,2.37959259 C17.3041608,4.06818519 17.3041608,6.81574074 15.6120866,8.50433333 Z" fill-rule="nonzero"></path>
                              <path id="Shape" d="M13.0363196,3 C12.4921258,3 11.9805546,3.21148148 11.5957258,3.59548148 C10.8014247,4.38818519 10.8014247,5.678 11.5957258,6.4707037 C11.9805175,6.8547037 12.4921258,7.06618519 13.0362825,7.06618519 C13.5804392,7.06618519 14.0920474,6.8547037 14.4768763,6.4707037 C15.2711773,5.678 15.2711773,4.38818519 14.4768763,3.59548148 C14.0920845,3.21148148 13.5804763,3 13.0363196,3 Z M13.6895897,5.685 C13.5150825,5.85914815 13.2830866,5.95507407 13.0362825,5.95507407 C12.7894784,5.95507407 12.5574825,5.85914815 12.3829753,5.68503704 C12.0227526,5.32555556 12.0227526,4.74062963 12.3829753,4.38114815 C12.5574825,4.207 12.7894784,4.11111111 13.0362825,4.11111111 C13.2830866,4.11111111 13.5150454,4.207 13.6895897,4.38114815 C14.0498124,4.74062963 14.0498124,5.32551852 13.6895897,5.685 Z" fill-rule="nonzero"></path>
                            </g>
                          </g>
                        </g>
                      </g>
                    </svg></i>REGÍSTRATE</a></div>
            </div>
          </div>
        </div>
      </div>
      <div class="remodal c-modal c-modal--modal-options" data-remodal-id="continueModal" role="dialog" aria-labelledby="modal1Title" aria-describedby="modal1Desc">   
        <button class="remodal-close" data-remodal-action="close" aria-label="Close">  </button>
        <div class="c-modal__wrap">
          <div class="c-modal__modalHead">
            <div class="c-modal__modalHead-inner"> 
              <h2>Selecciona como deseas continuar tu compra</h2>
            </div>
          </div>
          <div class="c-modal__modalBody">
            <div class="row">
              <div class="col-md-6"> 
                <div class="item guest">
                  <h3>Continuar como invitado</h3>
                  <button class="o-btn o-btn--primary o-btn--medium" id="enter" type="submit">Comprar sin registrarme </button>
                  <p>Podrás realizar tus compras sin estar registrado y crear tu contraseña después. </p>
                </div>
              </div>
              <div class="col-md-6"> 
                <div class="item login">
                  <h3>O como usuario registrado</h3>
                  <form class="o-form--loginForm" id="login">
                    <div class="row">
                      <div class="col-lg-12">
                        <div class="o-form__field">
                          <label class="o-form__label">RUT</label>
                          <input class="o-form__input" type="text" placeholder="Ej: 1234567-9" required="" name="rut" maxlength="12"><span class="o-form__message"></span>
                        </div>
                      </div>
                      <div class="col-lg-12">
                        <div class="o-form__field">
                          <label class="o-form__label">Contraseña</label>
                          <input class="o-form__input" type="text" placeholder="*******" required="" name="password"><span class="o-form__message"></span>
                        </div>
                      </div>
                      <div class="col-lg-12">
                        <div class="o-form__field">
                          <button class="o-btn o-btn--primary o-btn--medium" id="enter" type="submit">Ingresar y continuar  </button>
                        </div>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
    <%@include file="../footer/footer.jsp" %>
    <script src="../js/libs/bundle.js"></script>
    <script src="../js/libs/slick.min.js"></script>
    <script src="../js/libs/jquery.responsiveTabs.js"></script>
    <script src="../js/libs/remodal.js"></script>
    <script src="../js/main.min.js"></script>
    <script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js">
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBdz1DcKwHUPmTn5si-CF13IeOP91i8dgc&callback=initMap"
    async defer></script>
    <script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
  </body>
</html>
