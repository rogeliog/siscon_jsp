<%String pageTitle = "SISCON | Calendario";%>
<%@ include file="includes/header_calendario.jsp" %>
<div class="container">
  <div class="row">
    <div class="span7 offset2">
      <form action="buscar_materia_atributo.jsp" class="form-horizontal">
        <fieldset>
          <legend>Resultados de busqueda por atributo</legend>
          <div class="control-group">
            <label for="nombreSalon" class="control-label">Materia</label>
          <label for="nombreSalon" class="control-label">Curso</label>
          <label for="nombreSalon" class="control-label">Nombre Materia</label></br></br></br>
          <div>
          <p>gpo1</p>
        <table>
  <tr>
  <td>ATT 1</td>
  <td>DES1</td>
</tr>
<tr>
<td>ATT 2 </td>
<td>DES2</td>
</tr>
</table>
          <p>gpo2</p>
               <table>
  <tr>
  <td>ATT 1</td>
  <td>DES1</td>
</tr>
<tr>
<td>ATT 2 </td>
<td>DES2</td>
</tr>
</table>
          
          <p>gpo3</p>
               <table>
  <tr>
  <td>ATT 1</td>
  <td>DES1</td>
</tr>
<tr>
<td>ATT 2 </td>
<td>DES2</td>
</tr>
</table>
          <p>gpo4</p>
               <table>
  <tr>
  <td>ATT 1</td>
  <td>DES1</td>
</tr>
<tr>
<td>ATT 2 </td>
<td>DES2</td>
</tr>
</table>
          </div>
          </div>
          <div class="form-actions">
              <button type="submit" class="btn btn-inverse">Nueva Busqueda</button>

          </div>
        </fieldset>
      </form>
    </div> <!-- /span -->
  </div> <!-- /row -->
</div> <!-- /container -->
<%@ include file="includes/footer_calendario.html" %>