<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>SISCON | Registrar Usuario</title>
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
      .form-actions {
        background-color: transparent;
        border-top: none;
      }
      form {
        background-color: white;
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
                    <li><a href="index.jsp"><i class="icon-user icon-white"></i> Iniciar Sesi&oacute;n</a></li>
                    <li class="divider-vertical"></li>
                    <li class="active"><a href="registrar_usuario.jsp"><i class="icon-pencil icon-white"></i> Registrarse</a></li>
                  </ul>
              </div> <!-- /nav-collapse -->
            </div> <!-- /.container -->
          </div> <!-- /navbar-inner -->
        </div> <!-- /navbar -->
      
      
        <div class="container">
      
          <div class="row">
            <div class="span7 offset2">
              <div class="alert alert-block">
                <a class="close" data-dismiss="alert">&times;</a>
                <p><i class="icon-exclamation-sign"></i> &nbsp;&nbsp;Una vez registrado, se debe ser autorizado por el Director de Departamento para utilizar
                  el sistema.</p>
                
              </div>
            </div>
          </div> <!-- /row -->
          
          <!-- <div class="span4 offset4">
            <h1>Registro</h1>
          </div> -->

        <div class="row">      
            <div class="span7 offset2">          
                        <form class="form-horizontal well" action="servidor.jsp" method="get">
                            <h1>Registro</h1>
                            <fieldset>
                                <legend>Favor de llenar la informaci&oacute;n necesaria</legend>
                                <div class="control-group">
                                    <label class="control-label" for="matricula">Matr&iacute;cula</label>
                                    <div class="controls">
                                        <input name="matricula" id="matricula" class="input-small" type="text">
                                        <span class="help-inline"></span>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="contrasenia">Contrase&ntilde;a</label>
                                    <div class="controls">
                                        <input name="contrasenia" id="contrasenia" class="input-medium" type="password">
                                        <span class="help-inline"></span>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="contraseniaC">Confirmaci&oacute;n contrase&ntilde;a</label>
                                    <div class="controls">
                                        <input name="contraseniaC" id="contraseniaC" class="input-medium" type="password">
                                        <span class="help-inline"></span>
                                        <!-- <p class="help-block">Nota: Puede utilizar la contrase&ntilde;a de su cuenta del Tec para mayor facilidad</p> -->
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="nombres">Nombre(s)</label>
                                    <div class="controls">
                                        <input name="nombre" id="nombre" class="input-small" type="text">
                                        <span class="help-inline"></span>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="apellidoP">Apellido Paterno</label>
                                    <div class="controls">
                                        <input id="apellidoP" name="apellidoP" class="input-small" type="text">
                                        <span class="help-inline"></span>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="apellidoM">Apellido Materno</label>
                                    <div class="controls">
                                        <input id="apellidoM" name="apellidoM" class="input-small" type="text">
                                        <span class="help-inline"></span>
                                    </div>
                                </div>
                                <div class="control-group">
                                  <label class="control-label">Sexo</label>
                                  <div class="controls">
                                    <label class="radio inline">
                                      <input id="sexo1" type="radio" value="masculino" name="sexo">
                                      Masculino
                                    </label>
                                    <label class="radio inline">
                                      <input id="sexo2" type="radio" value="femenino" name="sexo">
                                      Femenino
                                    </label>
                                  </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="departamento">Departamento</label>
                                    <div class="controls">
                                        <select id="departamento" name="departamento">
                                            <option value="0">Seleccione su departamento</option>
                                            <option value="ciencias comp">Ciencias Computacionales</option>
                                            <option value="otro">Otro</option>
                                            <option value="otro">Otro</option>
                                            <option value="otro">Otro</option>
                                        </select>
                                        <span class="help-inline"></span>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="email">E-mail</label>
                                    <div class="controls">
                                        <input id="email" name="email" class="input-large" type="text">
                                        <span class="help-inline"></span>
                                    </div>
                                </div>
                                <div class="control-group">
                                  <label class="control-label" for="telefonos">Tel&eacute;fonos</label>
                                  <div class="controls">
                                    <textarea id="telefonos" name="telefonos" class="input-xlarge" rows="3"></textarea>
                                    <p class="help-block">Escriba su(s) tel&eacute;fono(s) y su extensi&oacute;n separadas por saltos de l&iacute;nea.</p>
                                    <p class="help-block">Ejemplo:<br />83582000-4592<br />83284488</p>
                                  </div>
                                </div>
                                <div class="form-actions">
                                    <button class="btn btn-primary" type="submit">Registrarse</button>
                                    <button class="btn" type="reset">Cancelar</button>
                                </div>
                            </fieldset>
                        </form>
            </div> <!-- /span -->
        </div><!-- /row -->
        </div> <!-- /container -->
        <div class="push"><!-- footer al fondo --></div>
      </div> <!-- /wrapper -->
    <footer class="container">
      <p>SISCON &copy; Departamento de Ciencias Computacionales</p>
      <p>Ave. Eugenio Garza Sada 2501 Sur Col. Tecnológico C.P. 64849 | Monterrey, Nuevo León, México | Tel. +52 (81) 8358-2000 </p>
      <p>D.R.© Instituto Tecnológico y de Estudios Superiores de Monterrey, México. 2012 </p>
    </footer>

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

  </body>
</html>