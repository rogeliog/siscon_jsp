<%
  String pageTitle = "SISCON | Buscar Profesores Por Atributo";
%>
<%@ include file="includes/header_aplicacion.jsp" %>
<div class="container">
    <div class="row">
      <div class="span7 offset2">
          <form action="calendario.jsp" class="form-horizontal">
              <fieldset>
                  <legend>Busqueda avanzada de profesores</legend>
                  <div class="control-group">
                      <label for="atributo" class="control-label">Selecciona un atributo</label>
                      <div class="controls">
                          <select name="atributo">
                              <option>CRN</option>
                              <option>attr1</option>
                              <option>attr1</option>
                              <option>attr1</option>
                              <option>attr1</option>
                              <option>attr1</option>
                              <option>attr1</option>
                              <option>attr1</option>
                              <option>attr1</option>
                              <option>attr1</option>
                              <option>attr1</option>
                              <option>attr1</option>
                              <option>attr1</option>
                              <option>attr1</option>
                              <option>attr1</option>
                              <option>attr1</option>
                              <option>attr1</option>
                              <option>attr1</option>
                              <option>attr1</option>
                              <option>attr1</option>
                          </select>
                        <input name="attr" type="text" class="input-xlarge" id="atributo">
                        <div><article></article></div>
                        
                      </div>
                  </div>
                  <div class="form-actions">
                      <button type="submit" class="btn btn-inverse">Buscar</button>
                      <button id="mo" type="na" class="btn btn-inverse">Nuevo</button>
                      <button type="reset" class="btn">Cancelar</button>
                  </div>
              </fieldset>
          </form>
      </div> <!-- /span -->
    </div> <!-- /row -->
</div> <!-- /container -->
<%@ include file="includes/footer_aplicacion_2.html" %>
