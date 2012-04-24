<%
 String pageTitle = "SISCON | Buscar Profesor";
%>
<%@ include file="includes/header_aplicacion.jsp"%>      
      
<div class="container">
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
    </div> <!-- /span -->
  </div> <!-- /row -->
</div> <!-- /container -->
<%@ include file="includes/footer_aplicacion_1.html" %>