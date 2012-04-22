<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>SISCON | Subir Archivo</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <style>
      body {
        padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
      }

      html, body {
          height: 92%;
      }
      footer {
          padding: 17px 0 18px 0;
          border-top: 1px solid #eee;
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

    
    <div class="wrapper"><!-- Barra de navegacion -->
      <div class="navbar navbar-fixed-top">
        <div class="navbar-inner">
          <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </a> <!-- / boton de colapsar -->
            <a class="brand" href="#">SISCON</a>
            <div class="nav-collapse">
              <ul class="nav">
                <li><a href="inicio.html"><i class="icon-home icon-white"></i> Inicio</a></li>
                <li class="dropdown">
                    <a href="#" data-toggle="dropdown" class="dropdown-toggle"><i class="icon-search icon-white"></i> Busquedas <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                      <li><a href="buscar_materia.html">Busqueda de materia</a></li>
                      <li><a href="buscar_profesor.html">Busqueda de profesor</a></li>
                      <li><a href="buscar_salon.html">Busqueda de sal&oacute;n</a></li>
                    </ul>
                </li>
                <li class="active"><a href="subir_archivo.html"><i class="icon-upload icon-white"></i> Subir archivo fuente</a></li>
                <li><a href="calendario.html"><i class="icon-calendar icon-white"></i> Calendario</a></li>
              </ul>
              <ul class="nav pull-right">
                <li><a href="index.html"><i class="icon-off icon-white"></i> Cerrar Sesi&oacute;n</a></li>
                <!-- <li><a href="iniciar_sesion.html"><i class="icon-user icon-white"></i> Iniciar Sesi&oacute;n</a></li>
                <li class="divider-vertical"></li>
                <li><a href="registrar_usuario.html"><i class="icon-pencil icon-white"></i> Registrarse</a></li> -->
              </ul>
            </div><!--/.nav-collapse -->
          </div> <!-- /.container -->
        </div> <!-- /navbar-inner -->
      </div> <!-- /navbar -->
      
      
      <div class="container">
      
          <div class="row">
      
              <h1>Subir Archivo</h1>
    			    <br />
              <p>Últimas actualizaciones</p>
              <table id="tabla1" class="table table-striped table-bordered table-condensed">
                  <tr>
                      <td>Fecha</td>
                      <td>Hora</td>
                      <td>Departamento</td>
                      <td>Archivo</td>
                  </tr>
              </table>
              <br />
              <div class="span3">
                  <h3>Subir documento nuevo</h3> 
                  <form >
            				<label class="control-label">Nombre del departamento:</label>
            				<input id="departamento" type="text" class="input-large">  
            				<label class="control-label">Selecciona el documento:</label>
            				<input class="input-file" id="fileInput" type="file">  			
            				<button type="button" class="btn" onclick="errorMsg()" >Subir</button> 
            				<label id="errorFile" class="control-label"></label>
            			</form>
        			</div>
              <div id="lectura" style="display: none" class="span3">
				          <h3>Realizar lectura de archivo</h3>
        				<p>Ejecutar la lectura del documento y actualizar la base de datos.	</p>
        				<button type="button" class="btn" onclick="errorLectura()" >Aceptar</button>  
        				<label id="errorLectura" class="control-label"></label>
        			</div>
        			<div id="resultadolectura" style="display: none" class="span3">
          				<h3>Lectura de archivo realizada</h3>
          				<span>Se ejecuto la lectura del documento de</span> <span id="dept" class="control-label"></span> 
          				<span>satisfactoriamente el </span><span id="fecha" class="control-label"></span> 
          				<button type="button" class="btn" onclick="errorLectura()" >Terminar</button>  
        			</div>
          </div> <!-- /row -->
      </div> <!-- /container -->
      <div class="push"><!-- empuja footer al fondo --></div>
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
  	<script src="assets/js/subir_archivo.js"></script>
    <!-- 
    <script src="assets/js/jquery.validate.js"></script>
    <script>
    $(document).ready(function(){
      $("#commentForm").validate();
    });
    </script>
     -->
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