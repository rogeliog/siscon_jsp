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
					<div class="span10 offset2">
						<legend>Centro de Notificaciones</legend>
			<%ResultSet rs = query.executeQuery(q);
			if(!rs.next()){
				%><p>No hay notificaciones pendientes por revisar</p><%
			}
			rs.beforeFirst(); 
			while (rs.next()) {
				String idUsuario = rs.getString(1);
			%>
				<div class="control-group">
					<form id="forma-<%=idUsuario%>" action="ControladorNotificaciones" method="POST">
					<span> 
					<span class="control-label"><%=rs.getString(2)%></span> 
					<span class="control-label"><%=rs.getString(3)%></span> 
					<select class="span3" name="tipo">
							<option value="P">Profesor</option>
							<option value="C">Director de Carrera</option>
							<option value="D">Director de Departamento</option>
							<option value="O">Otro</option>
					</select> 
					<span>Administrador</span> <input type="checkbox" name="Admin" value="ON" />
					<input type="hidden" name="id" value="<%=idUsuario%>"/>
							<input id="rechaza-<%=idUsuario%>" type="hidden" name="rechaza" value="false" />
							<button id="rechazaBoton-<%=idUsuario%>" class="btn btn-inverse" onclick="rechaza(<%=idUsuario%>)">Rechazar</button>
							<input id="acepta-<%=idUsuario%>" type="hidden" name="acepta" value="true" />
							<button id="aceptaBoton-<%=idUsuario%>" class="btn btn-inverse" onclick="acepta(<%=idUsuario%>)">Aceptar</button>
					</span>
					</form>
				</div>
				
			<%}
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
