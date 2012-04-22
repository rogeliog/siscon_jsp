<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
    <title>SISCON | Iniciar Sesi&oacute;n</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <style>
      body {
        padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
        background-image: url('assets/img/tec2.jpg');
      }

      html, body {
          height: 92%;
      }
      footer {
          padding: 17px 0 18px 0;
          /*border-top: 1px solid #eee;*/
      }
      footer > p {
        /*color: white;*/
        font-weight: bold;
      }
      /* para quitar el borde */
      legend {
        border-bottom: none;
      }
      .wrapper {
          min-height: 100%;
          height: auto !important;
          height: 100%;
          margin: 0 auto -63px;
      }
      .push {
          height: 63px;
      }
      /* not required for sticky footer; just pushes hero down a bit */
      .wrapper > .container {
          height: 95%;
      } 
      form {
        background-color: white;
      }
      /* size down hero unit contents to fit a narrow viewport */
    @media (max-width: 480px) {
        .hero-unit {
        padding: 0;
        margin: 0;
        /*background: transparent;*/
        }
        .hero-unit h1 {
        font-size: 250%;
        }
        .hero-unit h2 {
        font-size: 180%;
        }
    }
    </style>
    <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="assets/img/portal.ico">
    <link rel="apple-touch-icon" href="assets/ico/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="assets/ico/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="assets/ico/apple-touch-icon-114x114.png">
  </head>
    <body>
      
    <div class="wrapper">
<!-- Barra de navegacion -->
        <div class="navbar navbar-fixed-top">
          <div class="navbar-inner">
            <div class="container">
              <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </a> <!-- / boton de colapsar -->
              <a class="brand" href="#">Tecnol&oacute;gico de Monterrey</a>
              <div class="nav-collapse">
                <ul class="nav pull-right">
                    <li class="active"><a href="index.html"><i class="icon-user icon-white"></i> Iniciar Sesi&oacute;n</a></li>
                    <li class="divider-vertical"></li>
                    <li><a href="registrar_usuario.html"><i class="icon-pencil icon-white"></i> Registrarse</a></li>
                  </ul>
              </div> <!-- /nav-collapse -->
            </div> <!-- /.container -->
          </div> <!-- /navbar-inner -->
        </div> <!-- /navbar -->
      
        <div class="container">
            <div class="row">
                <div class="span8 offset2">
                    <div class="hero-unit">
                        <h1>Bienvenido a SISCON</h1>
                        <p>Sistema Integrador de Servicios para Consultas en Objetos Normativos</p>
                    </div>
                </div> <!-- /span -->
                    <div class="span4 offset4">
                      <!-- <form method="get" action="servidor.html" class="well-large"> -->
                      <!-- <form method="get" action="index.html" class="well-large"> -->
                      <form action="inicio.html" class="well">
                        <fieldset>
                          <h1>Iniciar Sesi&oacute;n</h1>
                            <div class="control-group">
                              <label class="control-label" for="usuario">Usuario</label>
                              <div class="controls">
                                <input id="usuario" name="usuario" type="text" class="input-medium">
                                <span class="help-inline" id="usuarioInfo"></span>
                              </div>
                            </div>
                              <div class="control-group">
                                <label class="control-label" for="pwd">Contrase&nacute;a</label>
                                <div class="controls">
                                  <input id="pwd" name="pswd" type="password" class="input-medium">
                                  <span class="help-inline" id="passInfo"></span>
                                </div>
                              </div>
                            <div>
                              <button type="submit" class="btn btn-primary">Entrar</button>
                            </div>
                        </fieldset>
                      </form>
                    </div> <!-- /span -->
            </div> <!-- /row -->
        </div> <!-- /container -->
        <div class="push"><!-- footer al fondo --></div>
      </div><!-- /wrapper -->
    <footer class="container">
      <p>SISCON &copy; Departamento de Ciencias Computacionales</p>
      <p>Ave. Eugenio Garza Sada 2501 Sur Col. Tecnológico C.P. 64849 | Monterrey, Nuevo León, México | Tel. +52 (81) 8358-2000 </p>
      <p>D.R.© Instituto Tecnológico y de Estudios Superiores de Monterrey, México. 2012 </p>
    </footer>
        
    </body>
    <!-- Le javascript
================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.js"></script>
    <script src="assets/js/jquery.validate.js"></script>
    <script src="assets/js/validacion.js"></script>
    <!--
    <script src="js/bootstrap-transition.js"></script>
    <script src="js/bootstrap-alert.js"></script>
    <script src="js/bootstrap-modal.js"></script>
    <script src="js/bootstrap-dropdown.js"></script>
    <script src="js/bootstrap-scrollspy.js"></script>
    <script src="js/bootstrap-tab.js"></script>
    <script src="js/bootstrap-tooltip.js"></script>
    <script src="js/bootstrap-popover.js"></script>
    <script src="js/bootstrap-button.js"></script>
    <script src="js/bootstrap-collapse.js"></script>
    <script src="js/bootstrap-carousel.js"></script>
    <script src="js/bootstrap-typeahead.js"></script>
-->

</html>