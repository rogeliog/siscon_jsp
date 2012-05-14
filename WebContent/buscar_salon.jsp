<%String pageTitle = "SISCON | Buscar Sal&oacute;n";%>
<%@ include file="includes/header_aplicacion.jsp"%>

<div class="container">
  <div class="row">
    <div class="span7 offset2">
      <form action="Busqueda" class="form-horizontal">
                <fieldset>
                <legend>Buscar Sal&oacute;n</legend>
                <div class="control-group">
                    <label for="nombreSalon" class="control-label">Nombre del sal&oacute;n</label>
                    <div class="controls">
                    <input name="id" type="text" class="input-xlarge" id="nombreSalon">
                    <input type="hidden" value="salon" name="objeto" />
                    </div>
                </div>
                <div class="form-actions">
                    <button type="submit" class="btn btn-inverse">Buscar</button>
                    <button type="reset" class="btn">Cancelar</button>
                </div>
                </fieldset>
            </form>
    </div> <!-- /span -->
  </div> <!-- /row -->
</div> <!-- /container -->
<%@ include file="includes/footer_aplicacion_1.html" %>