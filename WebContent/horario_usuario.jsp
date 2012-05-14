<%String pageTitle = "SISCON | Mi Horario";%>
<%@page import="org.apache.catalina.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*" import = "java.io.*"%>
<%@ include file="includes/header_calendario.jsp" %>
  
      <div class="container">
   
        <div class="row">
          <div class="span10 offset1">
            
              <div id="calendar"></div>
          </div>
        </div> <!-- /row -->

        <div class="row">
          <div class="span7 offset2">
          	<table id="tablaAct" class="table table-striped table-bordered table-condensed">
          		<tr>
          			<th>Actividad</th>
          			<th>D&iacute;a</th>
          			<th>Hora Inicio</th>
          			<th>Hora Fin</th>
          			<th>Borrar Actividad</th>
          		</tr>
          	
 <%
        Connection connection = null;
        ResultSet resultados = null;
            try
            {   
                /* Conexión a la base de datos */
          Class.forName( "com.mysql.jdbc.Driver" );
    connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/SISCON","root","");
                Statement statement = (Statement) connection.createStatement();
                int id = usuario.IdU();
                /* Cambiar la consulta por el indexUsuario de la sesion*/
                resultados = statement.executeQuery("SELECT `actividad`, `diaSemana`, `horaInicio`, `horaFin`, `idActividadesExtra` FROM actividadesExtra WHERE `indexUsuario` = "+id+";");
            
                while(resultados.next()){
                %>
                
                <tr>
                    <td><%= resultados.getString(1) %></td>
                    <td><%= resultados.getString(2) %></td>
                    <td><%= resultados.getString(3) %></td>
                    <td><%= resultados.getString(4) %></td>
                    <td><a href="borraAct?borra=<%= resultados.getString(5) %>&id=<%= usuario.IdU() %>"><input class="btn btn-primary" type="button" value="Borrar"/></a></td>
                </tr>
                
            <%
                }
            statement.close();
            resultados.close();
        }catch(Exception e){
                e.printStackTrace();
            }
        %>
			</table>
			
			<div class="modal hide fade" id="myModal">
			  <div class="modal-header">
			    <button class="close" data-dismiss="modal">×</button>
			    <h3>Agregar Actividades</h3>
			  </div>
			  <div class="modal-body">
				<div id="banner" class="alert alert-warning">
					<a href="" class="close" data-dismiss="alert">×</a>
					<h4><i class="icon-ok-circle"></i> Nota: </h4>Las horas de actividades extra se consideran como horas de clase,
					es decir que solo pueden empezar en HH:00 o en HH:30 y terminar de la misma manera.
					El formato utilizado es HH:MM de 24 horas.
				</div>
	             <form id="forma2" name="forma2" class="form-horizontal" action="guardaAct" method="post">
	              <fieldset>
	                <legend>Favor de llenar la informaci&oacute;n necesaria</legend>
	                
	                <div class="control-group">
	                  <label for="actividad" class="control-label">Actividad:</label>
	                  <div class="controls">
	                    <select name="actividad" id="actividad" class="span2">
	                    <option value="0">Seleccionar actividad</option>
	                    <option value="comida">Comida</option>
	                    <option value="asesorias">Asesorias</option>
	                    <option value="otras">Otras Act</option>
	                    </select>
	                    <span class="help-inline"></span>
	                  </div>
	                </div>
	                
	                <div class="control-group">
	                	<label for="inlineCheckboxes" class="control-label">D&iacute;as:</label>
	                	<div id="checkboxDias" class="controls">
		                  	<label for="" class="checkbox inline">
		                  		<input type="checkbox" name="dias" value="Lunes" />Lunes
		                  	</label>
		                  	<label for="" class="checkbox inline">
		                      <input type="checkbox" name="dias" value="Martes" />Martes
		                    </label>
		                    <label for="" class="checkbox inline">
		                      <input type="checkbox" name="dias" value="Miercoles" />Miercoles
		                    </label>
		                    <label for="" class="checkbox inline">
		                      <input type="checkbox" name="dias" value="Jueves" />Jueves
		                    </label>
		                    <label for="" class="checkbox inline">
		                      <input type="checkbox" name="dias" value="Viernes" />Viernes
		                    </label>
		                    <label for="" class="checkbox inline">
		                      <input type="checkbox" name="dias" value="Sabado" />Sabado
		                    </label>
		                    <span class="help-inline"></span>
	                	</div>
	                </div>
	                
	                <div class="control-group">
	                	<label for="inicio" class="control-label">Hora de inicio:</label>
	                	<div class="controls">
	                		<input type="text" id="inicio" name="horaInicio" class="input-medium" />
	                		<span class="help-inline">Teclear en formato de 24 horas (HH:MM)</span>
	                	</div>
	                </div>
	                
	                <div class="control-group">
	                	<label for="fin" class="control-label">Hora de fin:</label>
	                	<div class="controls">
	                		<input type="text" class="input-medium" id="horaFin" name="horaFin" />
	                		<span class="help-inline">Teclear en formato de 24 horas (HH:MM)</span>
	                	</div>
	                </div>
	                
	                <div class="form-actions">
	                	<button class="btn btn-primary" type="submit">Enviar</button>
	                    <button class="btn" type="reset" data-dismiss="modal">Cancelar</button>
	                </div>                
	              </fieldset>
	            </form>
			  </div>
<!-- 			  <div class="modal-footer"> -->
<!-- 			    <a href="#" class="btn">Close</a> -->
<!-- 			    <a href="#" class="btn btn-primary">Save changes</a> -->
<!-- 			  </div> -->
			</div>
			
			
          </div>
        </div>
        <div class="row">
        
			<div class="span3 offset4">
				<a id="agregarBoton" class="btn btn-primary btn-large" data-toggle="modal" href="#myModal" >Agregar Actividad</a>
			</div>
        </div>
         <div class="row">
			  <div class="span3 offset4">
		    	<span class="btn btn-primary" id="impr" >Versi&oacute;n para Imprimir</span>
		    	<span class="btn btn-primary" id="back">Regresar</span>
			  </div>
		  </div>
   
      </div> <!-- /container -->
<%@ include file="includes/footer_calendario.html" %>