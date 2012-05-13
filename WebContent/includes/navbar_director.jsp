<%@page import="java.io.IOException"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Logger"%>

<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%
	int rowCount = 0;
	int id = 0;
  try {
    Class.forName("com.mysql.jdbc.Driver");
    
    String url = "jdbc:mysql://localhost/SISCON";
    Connection con = (Connection) DriverManager.getConnection(url,"root", "");
    Statement query = (Statement) con.createStatement();
    
    Usuarios usuariologgeado = (Usuarios) session.getAttribute("usuario");
    id = usuariologgeado.IdU();
    
    String q = "SELECT u.indexUsuario, u.nombreUsuario, u.apellidoUsuario FROM Usuario u, tablaNotificacion t WHERE t.idDepartamento='"
+ usuariologgeado.IdD() + "' and u.rol='P' and  t.indexUsuario=u.indexUsuario";
    
    
    ResultSet rs = query.executeQuery(q);
    while (rs.next()) {
    }
    rs.last();
    rowCount = rs.getRow();
  }
  catch (Exception e) {
    // TODO Auto-generated catch block
    e.printStackTrace();
  }
%>

    <div id="wrap" class="wrapper">
      <!-- Barra de navegacion -->
      <div  id="nav" class="navbar navbar-fixed-top">
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
                    <a href="#" data-toggle="dropdown" class="dropdown-toggle"><i class="icon-search icon-white"></i> B&uacute;squedas <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                      <li><a href="buscar_materia.jsp">B&uacute;squeda de materia</a></li>
                      <li><a href="buscar_profesor.jsp">B&uacute;squeda de profesor</a></li>
                      <li><a href="buscar_salon.jsp">B&uacute;squeda de sal&oacute;n</a></li>
                    </ul>
                </li>
                <li><a href="horario_usuario.jsp?id=<%= id %>"><i class="icon-time icon-white"></i> Mi Horario</a></li>
                <li class="dropdown">
                    <a href="#" data-toggle="dropdown" class="dropdown-toggle"><i class="icon-cog icon-white"></i> Administraci&oacute;n <span class="badge"><%= rowCount %></span> <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                      <li><a href="administrarPermisos.jsp">Administrar permisos</a></li>
                	  <li><a href="administrarUsuarios.jsp">Administrar usuarios</a></li>
                      <li><a href="notificaciones.jsp">Centro de Notificaciones <span class="badge badge-inverse"><%= rowCount %></span></a></li>
                    </ul>
                </li>
                <li class="dropdown">
                	<a href="#" data-toggle="dropdown" class="dropdown-toggle"><i class="icon-upload icon-white"></i> Subir Archivos <b class="caret"></b></a>
                	<ul class="dropdown-menu">
                		<li><a href="subir_archivo.jsp">Subir archivo fuente</a></li>
                		<li><a href="subirPlan.jsp">Subir plan de estudios</a></li>
                	</ul>                	
                </li>
              </ul>
              <ul class="nav pull-right">
				<li><a href="#"><i class="icon-user icon-white"></i> <%= usuario.getNombre() + " " + usuario.getApellido() %></a></li>
                <li><a href="CerrarSesion"><i class="icon-off icon-white"></i> Cerrar Sesi&oacute;n</a></li>
              </ul>
            </div><!--/.nav-collapse -->
          </div> <!-- /.container -->
        </div> <!-- /navbar-inner -->
      </div> <!-- /navbar -->