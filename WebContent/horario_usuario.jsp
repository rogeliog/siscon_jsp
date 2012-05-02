<%String pageTitle = "SISCON | Mi Horario";%>

<%@ include file="includes/header_calendario.jsp" %>
  
      <div class="container">
   
        <div class="row">
          <div class="span10 offset1">
            
              <div id="calendar"></div>
          </div>
        </div> <!-- /row -->

        <div class="row">
          <div class="span7 offset2">
             <form id="agregarAct" class="form-horizontal" action="guardaAct">
              <h1>Agregar Actividades</h1>
              <fieldset>
                <legend>Favor de llenar la informaci&oacute;n necesaria</legend>
                
                <div class="control-group">
                  <label for="actividad" class="control-label">Actividad:</label>
                  <div class="controls">
                    <select id="actividad" class="span2">
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
	                  		<input type="checkbox" name="dias" value="lunes" />Lunes
	                  	</label>
	                  	<label for="" class="checkbox inline">
	                      <input type="checkbox" name="dias" value="martes" />Martes
	                    </label>
	                    <label for="" class="checkbox inline">
	                      <input type="checkbox" name="dias" value="miercoles" />Miercoles
	                    </label>
	                    <label for="" class="checkbox inline">
	                      <input type="checkbox" name="dias" value="jueves" />Jueves
	                    </label>
	                    <label for="" class="checkbox inline">
	                      <input type="checkbox" name="dias" value="viernes" />Viernes
	                    </label>
	                    <label for="" class="checkbox inline">
	                      <input type="checkbox" name="dias" value="sabado" />Sabado
	                    </label>
	                    <br /><br />
	                    <span class="help-inline"></span>
                	</div>
                </div>
                
                <div class="control-group">
                	<label for="inicio" class="control-label">Hora de inicio:</label>
                	<div class="controls">
                		<input type="text" id="inicio" name="inicio" class="input-medium" />
                		<span class="help-inline"></span>
                	</div>
                </div>
                
                <div class="control-group">
                	<label for=fin"" class="control-label">Hora de fin:</label>
                	<div class="controls">
                		<input type="text" class="input-medium" id="fin" name="inicio" />
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