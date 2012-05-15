<%String pageTitle = "SISCON | Resultados Busqueda de Materia";%>
<%@ include file="includes/header_calendario.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>td{padding:4px;}</style>
<div class="container">
  <div class="row">
      <fieldset>
            
            <br />
      <br />
<!--           <div class="form-actions"> -->
<!--               <button type="submit" class="btn btn-inverse">Nueva Busqueda</button> -->

<!--           </div> -->
        </fieldset>
    <div class="span7 offset2">
      <form action="buscar_materia_atributo.jsp" class="form-horizontal">
            <h2>Resultados de busqueda de materia</h2>
            <br />
          <table cellpadding="4" cellspacing="4" border="0">
                  <tr>
                      <td>Clave</td>
                      <td>Nombre Materia</td>
                  </tr>
          <c:forEach var="materia" items="${materias}">
          
              <tr>
                  <td><b>${materia.materia}${materia.curso}</b></td>
                  <td><b>${materia.nombreMateria}</b></td>
              </tr>
              <tr>
                  <td colspan="2">
                      <table class="well" cellpadding="4" cellspacing="4" border="0" width="100%">
                          <tr>
                              <td>Grupos (${fn:length(materia.getGrupos())})</td>
                          </tr>
                          <c:forEach var="grupo" items="${materia.getGrupos()}">
                              <tr>
                                  <td>
                                      CRN: ${grupo.crn}
                                      <br />
                                      Profesor: ${grupo.nombreUsuario}
                                      <br />
                                      Alumnos inscritos: ${grupo.alumnosInscritos}
                                      <br />
                                      Salon: ${grupo.salon}
                                      <br />
                                      Horario: ${grupo.horario}
                                  </td>
                              </tr>
                          </c:forEach>
                      </table>
                  </td>
              </tr>
          </c:forEach>
          </table>
</div>
      
      </form>
    </div> <!-- /span -->
  </div> <!-- /row -->
</div> <!-- /container -->
<%@ include file="includes/footer_calendario.html" %>