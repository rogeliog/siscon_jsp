
<%
	String pageTitle = "SISCON | Buscar Por Atributos Profesores"; %>
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
					<fieldset>
						<legend>Centro de Notificaciones</legend>
						<div class="control-group"> 
			<%ResultSet rs = query.executeQuery(q);
			while (rs.next()) {%>
				
					<span> 
					<span class="control-label"><%=rs.getString(2)%></span> 
					<span class="control-label"><%=rs.getString(3)%></span> 
					<select name="tipo">
							<option>Profesor</option>
							<option>Director de Carrera</option>
							<option>Director de Departamento</option>
							<option>Otro</option>
					</select> 
					<span>Administrador</span> <input type="checkbox" name="Admin" value="ON" />
						<div>
						<button class="btn btn-inverse">Rechazar</button>
						<button class="btn btn-inverse">Aceptar</button> <br/> <br/> <br/>
						</div>
					</span>
				
			<%}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}%>
				</div>

		




				
			</fieldset>

		</div>
		<!-- /span -->
	</div>
	<!-- /row -->
</div>
<!-- /container -->
<%@ include file="includes/footer_aplicacion_1.html"%>