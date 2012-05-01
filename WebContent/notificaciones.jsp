<%	String pageTitle = "SISCON | Buscar Por Atributos Profesores"; %>
<%@ include file="includes/header_aplicacion.jsp"%>

<%@page import="java.io.IOException"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Logger"%>

<%@page import="clases.Usuario"%>

<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="com.mysql.jdbc.Statement"%>

<div class="container">

	<%try {
			Class.forName("com.mysql.jdbc.Driver");

			String url = "jdbc:mysql://localhost/SISCON";
			Connection con = (Connection) DriverManager.getConnection(url,
					"root", "");
			Statement query = (Statement) con.createStatement();

			Usuario usuariologgeado = (Usuario) session.getAttribute("usuario");
			//SELECT u.nombreUsuario, u.apellidoUsuario FROM Usuario u, tablaNotificacion t  WHERE t.idDepartamento=1 and t.indexUsuario=u.indexUsuario

			String q = "SELECT u.indexUsuario, u.nombreUsuario, u.apellidoUsuario FROM Usuario u, tablaNotificacion t  WHERE t.idDepartamento='"
			+ usuariologgeado.IdD() + "' and t.indexUsuario=u.indexUsuario";
			%>	<div class="row">
					<div class="span7 offset2">
<!-- 					<fieldset> -->
						<legend>Centro de Notificaciones</legend>
						 
			<%ResultSet rs = query.executeQuery(q);
			int p = 0;
			while (rs.next()) {%>
				<div class="control-group">
					<form class="well form-inline" action="ControladorNotificaciones" method="POST">
						<label><b>Nombre:</b> <%=rs.getString(2)%> <%=rs.getString(3)%></label> 
						<label><b>Rol:</b> </label>
						<select class="span2" name="tipo">
								<option value="P">Profesor</option>
								<option value="C">Director de Carrera</option>
								<option value="D">Director de Departamento</option>
								<option value="O">Otro</option>
						</select> 
						<label class="checkbox">
							<input type="checkbox" name="Admin" value="ON" />Administrador
						</label> 
						<input type="hidden" name="id" value="<%=rs.getString(1)%>"/>
						<input id="rechaza<%= p %>>" type="hidden" name="rechaza" value="false" />
						<button class="btn btn-inverse">Rechazar</button>
						<input id="acepta<%= p %>" type="hidden" name="acepta" value="false" />
						<button class="btn btn-inverse">Aceptar</button>
					</form>
				</div>
				
			<%
			p++;
			}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}%>

		</div>
		<!-- /span -->
	</div>
	<!-- /row -->
</div>
<!-- /container -->
<%@ include file="includes/footer_aplicacion_1.html"%>
