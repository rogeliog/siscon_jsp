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
		        <legend>Administrar cuenta de usuario</legend>
		        <p style="font-size: 13px; color:gold"><i><%= cambios %></i></p>
		        <table>
		        	<tr>
						<th style='text-align:left; width:100px; padding:5px;'>Matr&iacute;cula</th>
					  	<th style='text-align:left; width:270px; padding:5px;'>Nombre</th>
					  	<th style='text-align:left; width:150px; padding:5px;'>Permisos</th>
					  	<th style='text-align:left; width:300px; padding:5px;'>Rol</th>
					  	<th></th>
					</tr>
					<% 
                        String q = "SELECT * FROM `Usuario` WHERE idDepartamento = " + usuario.IdD();
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
								  		<select class="span2" name='tipo_<%=rs.getInt("indexUsuario")%>'>
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
									    <% if(rs.getString("rol").charAt(0) == 'D') { %>
											<option value="D" selected=selected>Director de Departamento</option>
									    <% } else { %>
									    	<option value="D">Director de Departamento</option>
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
		</div>
	</div>
	
<%@ include file="includes/footer_principal.jsp" %>
<% session = request.getSession();
   session.removeAttribute("cambios");%>