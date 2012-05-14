<%String pageTitle = "SISCON | Buscar Materia";%>
<%@ include file="includes/header_aplicacion.jsp" %>

<div class="container">
    <div class="row">
      <div class="span7 offset2">
          <form action="Busqueda" class="form-horizontal" method="post">
              <input type="hidden" name="objeto" value="materia" />
              <input type="hidden" name="atributo1" value="nombreMateria" />
              <fieldset>
                  <legend>Buscar Materia</legend>
                  <div class="control-group">
                      <label for="nombreMateria" class="control-label">Nombre de la materia</label>
                      <div class="controls">
                        <input name="valor1" type="text" class="input-xlarge">
                      </div>
                  </div>
                  <div class="form-actions">
                      <button type="submit" class="btn btn-inverse">Buscar</button>
                      <a href="buscar_materia_atributo.jsp" class="btn btn-inverse">Busqueda Avanzada</a>
                      <button type="reset" class="btn">Cancelar</button>
                  </div>
              </fieldset>
          </form>
      </div> <!-- /span -->
    </div> <!-- /row -->
</div> <!-- /container -->
<%@ include file="includes/footer_aplicacion_1.html" %>
