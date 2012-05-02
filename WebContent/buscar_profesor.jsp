<%String pageTitle = "SISCON | Buscar Profesor";%>
<%@ include file="includes/header_aplicacion.jsp"%>      
      
<!-- <div class="container">
  <div class="row">
    <div class="span7 offset2">
        <form action="calendario.jsp" class="form-horizontal">
          <fieldset>
            <legend>Buscar Profesor</legend>
            <div class="control-group">
              <label for="nombreProfesor" class="control-label">Nombre del Profesor</label>
              <div class="controls">
                <input name="profesor" type="text" class="input-xlarge" id="nombreProfesor">
              </div>
            </div>
            <div class="form-actions">
                <button type="submit" class="btn btn-inverse">Buscar</button>
                <a href="buscar_profesor_atributo.jsp" class="btn btn-inverse">Busqueda Avanzada</a>
                <button type="reset" class="btn">Cancelar</button>
            </div>
          </fieldset>
      </form>
    </div>
  </div>
</div> -->
<div class="container">
    <div class="row">
        <div class="span7 offset2">
        <form class="form-search" action="Busqueda" method="post">
        <fieldset>
        <input type="hidden" name="tipoDeConsulta" value="nombreUsuario" />
        <div class="well">
        <legend>B&uacute;squeda de Usuarios por Nombre</legend>
                <label class="control-label" for="nombreUsuario">Nombre de Usuario</label>
        <input type="text" id="nombreUsuario" name="attr" class="input-medium search-query">
        <button type="submit" class="btn">Buscar</button>
        </div>
        </fieldset>
          </form>
        </div>

        <div class="span7 offset2">
		  <form class="form-horizontal" action="Busqueda" method="post">
		      <fieldset>
		    
		        <legend>Busqueda avanzada de profesores</legend>
		        <div class="control-group">
		            <label for="atributo" class="control-label">Selecciona un atributo</label>
		            <div class="controls">
		                <select name="tipoDeConsulta">
		                    <option value="idUsuario">Nomina</option>
		                    <option value="nombreUsuario">Nombre</option>
		                    <option value="apellidoUsuario">Apellido</option>
		                    <option value="email">Email</option>
		                    <option value="rol">Rol</option>
		                </select>
		                <input name="attr" type="text" class="input-xlarge" id="atributo">
		                <div><article></article></div>
		
		            </div>
		        </div>
		        <div class="form-actions">
		            <button type="submit" class="btn btn-inverse">Buscar</button>
		            <button type="reset" class="btn">Cancelar</button>
		        </div>
		      </fieldset>
		</form>
    </div>
  </div>
</div>
<%@ include file="includes/footer_aplicacion_1.html" %>