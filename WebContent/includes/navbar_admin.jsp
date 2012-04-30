    <div id="wrap" class="wrapper">
      <!-- Barra de navegacion -->
      <div id="nav" class="navbar navbar-fixed-top">
        <div class="navbar-inner">
          <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </a> <!-- / boton de colapsar -->
            <span class="brand">SISCON</span>
            <div class="nav-collapse">
              <ul class="nav">
                <li><a href="bienvenido.jsp"><i class="icon-home icon-white"></i> Inicio</a></li>
                <li><a href="interfaz_admin_administraUsuario.jsp"><i class="icon-th-list icon-white"></i> Administrar usuarios</a></li>
                <li><a href="subir_archivo.jsp"><i class="icon-upload icon-white"></i> Subir archivo fuente</a></li>
                <li><a href="notificaciones.jsp"><i class="icon-exclamation-sign icon-white"></i> Centro de Notificaciones</a></li>
              </ul>
              <ul class="nav pull-right">
				<li><a href="bienvenido.jsp"><i class="icon-user icon-white"></i> <%= usuario.getNombre() + " " + usuario.getApellido() %></a></li>
                <li><a href="CerrarSesion"><i class="icon-off icon-white"></i> Cerrar Sesi&oacute;n</a></li>
                <!-- <li><a href="iniciar_sesion.jsp"><i class="icon-user icon-white"></i> Iniciar Sesi&oacute;n</a></li>
                <li class="divider-vertical"></li>
                <li><a href="registrar_usuario.jsp"><i class="icon-pencil icon-white"></i> Registrarse</a></li> -->
              </ul>
            </div><!--/.nav-collapse -->
          </div> <!-- /.container -->
        </div> <!-- /navbar-inner -->
      </div> <!-- /navbar -->