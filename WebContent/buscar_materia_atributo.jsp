<%String pageTitle = "SISCON | Buscar Materia Por Atributo";%>
<%@ include file="includes/header_aplicacion.jsp" %>
<div class="container">
    <div class="row">
      <div class="span7 offset2">
          <form action="Busqueda" class="form-horizontal" method="post">
            <input type="hidden" name="objeto" value="materia" />
              <fieldset>
                  <legend>Busqueda avanzada de materias</legend>
                  <div class="control-group">
                      <label for="atributo" class="control-label">Selecciona un atributo</label>
                      <div class="controls">
                          <select name="atributo1">
                              <option value="nombreMateria">Nombre Materia</option>
                              <option value="siglasCarrera">Siglas Carrera</option>
                          </select>
                          
                        <input name="atributo2" type="text" class="input-xlarge" id="atributo">
                        <br />
                        <div id="showAnioPlan" name="showAnioPlan" style="display:none;"><select name="anioPlan" id="anioPlan"><option>2011</option><option>2012</option></select></div>
                      <script src="http://code.jquery.com/jquery-latest.js"></script>
                      <script>
                      
    $("select").change(function () {
          var str = "";
          $("select option:selected").each(function () {
            if ($(this).val()=='Siglas Carrera')
            {
                $('#showAnioPlan').show();    
            }
          });
                
    });
</script>
                      
                        
                      </div>
                  </div>
                  <div class="form-actions">
                      <button type="submit" class="btn btn-inverse">Buscar</button>
                     
                      <% int i=1;
                      i++;    
                          %>
                      <button id="mo" type="na" class="btn btn-inverse">Nuevo</button>
                      <button type="reset" class="btn">Cancelar</button>
                  </div>
              </fieldset>
          </form>
      </div> <!-- /span -->
    </div> <!-- /row -->
</div> <!-- /container -->
<%@ include file="includes/footer_aplicacion_2.html" %>