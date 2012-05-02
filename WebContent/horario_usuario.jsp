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
                <table border="1" method="post" cellpadding="10">
                <tr>
                    <td><%= resultados.getString(1) %></td>
                    <td><%= resultados.getString(2) %></td>
                    <td><%= resultados.getString(3) %></td>
                    <td><%= resultados.getString(4) %></td>
                    <td><a href="borraAct?borra=<%= resultados.getString(5) %>&id=<%= usuario.IdU() %>"><input type="button" value="Borrar"/></a></td>
                </tr>
                </table>
            <%
                }
            statement.close();
            resultados.close();
        }catch(Exception e){
                e.printStackTrace();
            }
        %>

             <form id="forma2" name="forma2" class="form-horizontal" action="guardaAct" method="post">
              <h1>Agregar Actividades</h1>
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
                	<div class="controls">
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
	                    <br /><br />
	                    <span class="help-inline"></span>
                	</div>
                </div>
                
                <div class="control-group">
                	<label for="inicio" class="control-label">Hora de inicio:</label>
                	<div class="controls">
                		<input type="text" id="inicio" name="horaInicio" class="input-medium" />
                		<span class="help-inline"></span>
                	</div>
                </div>
                
                <div class="control-group">
                	<label for="fin" class="control-label">Hora de fin:</label>
                	<div class="controls">
                		<input type="text" class="input-medium" id="horaFin" name="horaFin" />
                		<span class="help-inline"></span>
                	</div>
                </div>
                
                <div class="form-actions">
                	<button class="btn btn-primary" type="submit">Enviar</button>
                    <button class="btn" type="reset">Cancelar</button>
                </div>                
              </fieldset>
            </form>
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