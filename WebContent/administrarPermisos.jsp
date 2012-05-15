<%
  String pageTitle = "SISCON | Administrar Permisos";
  
  //get attributes from the session
  String cambios = (String) session.getAttribute("cambios");
  // handle null values
  if (cambios == null) {
      cambios = "";
  }
%>
      
<%@include file="includes/header_aplicacion.jsp" %>

<%@ page language="java" import="java.sql.*" import="clases.Conexion" %>

<%
	Connection con = null;
	con = Conexion.con();
	Statement query = (Statement) con.createStatement();
	
	String queries[] = 
		{
			"SELECT * FROM `Usuario` WHERE rol = 'P' AND buscarHorarioProfesores = 1",
			"SELECT * FROM `Usuario` WHERE rol = 'P' AND buscarHorarioMateria = 1",
			"SELECT * FROM `Usuario` WHERE rol = 'P' AND buscarHorarioSalon = 1",
			"SELECT * FROM `Usuario` WHERE rol = 'C' AND buscarHorarioProfesores = 1",
			"SELECT * FROM `Usuario` WHERE rol = 'C' AND buscarHorarioMateria = 1",
			"SELECT * FROM `Usuario` WHERE rol = 'C' AND buscarHorarioSalon = 1"
		};
	
	int cont[] = {0, 0, 0, 0, 0, 0};  
	/* donde 
		[0] = contPP 
		[1] = contPM
		[2] = contPS
		[3] = contCP
		[4] = contCM
		[5] = contCS
	*/
    ResultSet rs;
	for(int i = 0; i < cont.length; i++) {
		rs = query.executeQuery(queries[i]);
		while(rs.next()) {
	    	cont[i]++;
	    }
	}    
    
%>

	<div class="row">
		<div class="span8 offset2">
			<%
				if(!cambios.equals("")) {
			%>
				<div class="alert alert-success">
					<a href="#" class="close" data-dismiss="alert">�</a>
					<i class="icon icon-ok"></i> <%= cambios %>
				</div>
			<%
				}
			%>
		  <form class="form-horizontal" action="GuardarPermisos" method="post">
		      <fieldset>
		        <legend>Administrar permisos</legend>
		        <div style="margin-left:15px;">
 		        	<h4>Permisos de Profesores</h4>
		        	<table style="margin-left:15px;">
		        		<tr>
		        			<td>
		        			<% if(cont[0] > 0) { %>
		        				<input type="checkbox" name="buscarProfesores_profesores" value="ON" checked=checked /> Consultar horario de otros profesores
		        			<% } else { %>
		        				<input type="checkbox" name="buscarProfesores_profesores" value="ON" /> Consultar horario de otros profesores
		        			<% } %>
		        			</td>
		        		</tr>
		        		<tr>
		        			<td>
		        			<% if(cont[1] > 0) { %>
		        				<input type="checkbox" name="buscarMaterias_profesores" value="ON" checked=checked /> Consultar horario de materias
		        			<% } else { %>
		        				<input type="checkbox" name="buscarMaterias_profesores" value="ON" /> Consultar horario de materias
		        			<% } %>
		        			</td>
		        		</tr>
		        		<tr>
		        			<td>
		        			<% if(cont[2] > 0) { %>
		        				<input type="checkbox" name="buscarSalones_profesores" value="ON" checked=checked /> Consultar horario de salones
		        			<% } else { %>
		        				<input type="checkbox" name="buscarSalones_profesores" value="ON" /> Consultar horario de salones
		        			<% } %>
		        			</td>
		        		</tr>	
		        	</table>
		        	<br />
		        	<h4>Permisos de Directores de Carrera</h4>
		        	<table style="margin-left:15px;">
		        		<tr>
		        			<td>
		        			<% if(cont[3] > 0) { %>
		        				<input type="checkbox" name="buscarProfesores_carrera" value="ON" checked=checked /> Consultar horario de otros profesores
		        			<% } else { %>
		        				<input type="checkbox" name="buscarProfesores_carrera" value="ON" /> Consultar horario de otros profesores
		        			<% } %>
		        			</td>
		        		</tr>
		        		<tr>
		        			<td>
		        			<% if(cont[4] > 0) { %>
		        				<input type="checkbox" name="buscarMaterias_carrera" value="ON" checked=checked /> Consultar horario de materias
		        			<% } else { %>
		        				<input type="checkbox" name="buscarMaterias_carrera" value="ON" /> Consultar horario de materias
		        			<% } %>
		        			</td>
		        		</tr>
		        		<tr>
		        			<td>
		        			<% if(cont[5] > 0) { %>
		        				<input type="checkbox" name="buscarSalones_carrera" value="ON" checked=checked /> Consultar horario de salones
		        			<% } else { %>
		        				<input type="checkbox" name="buscarSalones_carrera" value="ON" /> Consultar horario de salones
		        			<% } %>
		        			</td>
		        		</tr>	
		        	</table>
		        </div>
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