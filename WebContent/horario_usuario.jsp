<%
  String pageTitle = "SISCON | Mi Horario";
%>

<%@ include file="includes/header_calendario.jsp" %>
  
      <div class="container">
   
        <div class="row">
          <div class="span10 offset1">
            
              <div id="calendar"></div>
          </div>
   
        </div> <!-- /row -->
        <div class="row">
          <div class="span10 offset1">
            <form action="#" class="form-horizontal well" method="get">
              <h1>Actividades Extra</h1>
              <fieldset>
                <legend>Favor de llenar la informacion necesaria</legend>
                <div class="control-group">
                  <label for="tipo" class="control-label">
                    
                  </label>
                </div>
              </fieldset>
            </form>
          </div>
        </div>
   
      </div> <!-- /container -->
<%@ include file="includes/footer_calendario.html" %>