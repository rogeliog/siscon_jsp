<%
  String pageTitle = "SISCON | Administrar Usuarios";
  
  //get attributes from the session
  String cambios = (String) session.getAttribute("cambios");
  // handle null values
  if (cambios == null) {
      cambios = "";
  }
%>
      
<%@include file="includes/header_aplicacion.jsp" %>

<%@ page language="java" import="java.sql.*" %>

<%
	String url = "jdbc:mysql://localhost/SISCON";
	Connection con = (Connection) DriverManager.getConnection(url, "root", "");
	Statement query = (Statement) con.createStatement();
%>

	<div class="row">
		<div class="span8 offset2">
		  <form class="form-horizontal" action="GuardarUsuarios" method="post">
		      <fieldset>
		        <legend>Administrar cuentas de usuario</legend>
<%-- 		        <p style="font-size: 13px; color:gold"><i><%= cambios %></i></p> --%>
		        <%
		        	if(!cambios.equals("")) {
		        %>
		        	<div class="alert alert-success">
		        		<a href="#" class="close" data-dismiss="alert">×</a>
		        		<%= cambios %>
		        	</div>
		        <%
		        	}
		        %>
		        <table class="table table-striped table-bordered table-condensed">
		        	<tr>
						<th>N&oacute;mina</th>
					  	<th>Nombre</th>
					  	<th>Permisos</th>
					  	<th>Rol</th>
					  	<th></th>
					</tr>
					<% 
                        String q = "SELECT * FROM `Usuario` WHERE idDepartamento = " + usuario.IdD() + " AND alta = 1"; // solo los que han sido dados de alta
// 						String q = "SELECT * FROM `Usuario` WHERE idDepartamento = " + usuario.IdD() + "AND rol != 'O'";
						int cont = 0;
					    ResultSet rs = query.executeQuery(q);
					    while(rs.next()) {
						    if(usuario.IdU() != rs.getInt("indexUsuario")) { %>
						    	<tr>
							  		<td><%=rs.getString("idUsuario")%></td>
							  		<td><%=rs.getString("nombreUsuario") + " " + rs.getString("apellidoUsuario")%></td>
							  		<td>
								  		<% if(rs.getString("rol").charAt(0) != 'O') { %>
								  			<% if(rs.getBoolean("administrador")) { %>
								  				<input type="checkbox" name='Admin_<%=rs.getInt("indexUsuario")%>' value="ON" checked=checked /> Administrador
								  			<% } else { %>
								  				<input type="checkbox" name='Admin_<%=rs.getInt("indexUsuario")%>' value="ON" /> Administrador
								  			<% } %>
								  		<% } %>
							  		</td>
							  		<td>
								  		<select class="span3" name='tipo_<%=rs.getInt("indexUsuario")%>'>
								  		<% if(rs.getString("rol").charAt(0) == 'P') { %>
											<option value="P" selected=selected>Profesor</option>
									    <% } else { %>
									    	<option value="P">Profesor</option>
									    <% } %>
									    <% if(rs.getString("rol").charAt(0) == 'C') { %>
											<option value="C" selected=selected>Director de Carrera</option>
									    <% } else { %>
									    	<option value="C">Director de Carrera</option>
									    <% } %>
									    <% if(rs.getString("rol").charAt(0) == 'O') { %>
											<option value="O" selected=selected>Otro</option>
									    <% } else { %>
									    	<option value="O">Otro</option>
									    <% } %>
										</select>
							  		</td>
							  		<td><input type="hidden" value='<%=rs.getInt("indexUsuario")%>' name="idUsers_<%=cont%>" /></td>
							  	</tr>	
						   <% cont++; 
						   }
					    } 
				    %>
		        </table>
		        <input type="hidden" value='<%=cont%>' name="usuarios" />
		        <div class="form-actions">
		          <button type="submit" class="btn btn-inverse">Guardar Cambios</button>
		          <button type="reset" class="btn">Cancelar</button>
		        </div>
		      </fieldset>
			</form>
			
			<div id="bleh"></div>
			
		</div>
	</div>

	
<%@ include file="includes/footer_principal.jsp" %>
<% session = request.getSession();
   session.removeAttribute("cambios");%>