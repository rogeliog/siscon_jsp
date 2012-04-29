<%
  String pageTitle = "SISCON | Buscar Por Atributos Profesores";
%>
<%@ include file="includes/header_aplicacion.jsp" %>

      
      <div class="container">
      
          <div class="row">
            <div class="span7 offset2">
                    <fieldset>
                        <legend>Centro de Notificaciones</legend>
                        <div class="control-group">
                            <span>
                            <span class="control-label">Nombre </span> 
                            <span  class="control-label">Apellido</span>  
                                <select name="tipo">
                                    <option>Profesor</option>
                                    <option>Director de Carrera</option>
                                    <option>Director de Departamento</option>
                                    <option>Otro</option>

                                </select>
                             <span>Administrador</span>
                            <input type="checkbox" name="Admin" value="ON" />
                            <button class="btn btn-inverse">Rechazar</button> 
                            <button class="btn btn-inverse">Aceptar</button>
                           
                            </span>
                        </div>
                        
                            
                        <button type="reset" class="btn">Cancelar</button>
                    </fieldset>
                
            </div> <!-- /span -->
          </div> <!-- /row -->
      </div> <!-- /container -->
<%@ include file="includes/footer_aplicacion_1.html" %>