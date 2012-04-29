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
                <li class="dropdown">
                    <a href="#" data-toggle="dropdown" class="dropdown-toggle"><i class="icon-search icon-white"></i> Busquedas <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                      <li><a href="buscar_materia.jsp">Busqueda de materia</a></li>
                      <li><a href="buscar_profesor.jsp">Busqueda de profesor</a></li>
                      <li><a href="buscar_salon.jsp">Busqueda de sal&oacute;n</a></li>
                    </ul>
                </li>
                <li><a href="subir_archivo.jsp"><i class="icon-upload icon-white"></i> Subir archivo fuente</a></li>
                <li><a href="calendario.jsp"><i class="icon-calendar icon-white"></i> Calendario</a></li>
                <li class="active"><a href="horario_usuario.jsp"><i class="icon-time icon-white"></i> Mi Horario</a></li>
              </ul>
              <ul class="nav pull-right">
<%--               	<li><a href="#"><%= name %></a></li> --%>
                <li><a href="index.jsp"><i class="icon-off icon-white"></i> Cerrar Sesi&oacute;n</a></li>
                <!-- <li><a href="iniciar_sesion.jsp"><i class="icon-user icon-white"></i> Iniciar Sesi&oacute;n</a></li>
                <li class="divider-vertical"></li>
                <li><a href="registrar_usuario.jsp"><i class="icon-pencil icon-white"></i> Registrarse</a></li> -->
              </ul>
            </div><!--/.nav-collapse -->
          </div> <!-- /.container -->
        </div> <!-- /navbar-inner -->
      </div> <!-- /navbar -->