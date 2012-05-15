<%String pageTitle = "SISCON | Resultado Busqueda de Materia";%>
<%@ include file="includes/header_calendario.jsp" %>
<div class="container">
    <div class="row-fluid">
        <div class="span12">
            <div class="row-fluid">
<!--                 <div class="span2"> -->
<!--                     <ul class="nav nav-list"> -->
<!--                         <li class="nav-header"> -->
<!--                         </li> -->
<!--                         <li class="active"> -->
<!--                             <a href="Busqueda?objeto=usuario&id=&accion=informacion">Informaci&oacute;n</a> -->
<!--                         </li> -->
<!--                         <li> -->
<!--                             <a href="Busqueda?objeto=usuario&id=&accion=horario">Consultar Horario</a> -->
<!--                         </li> -->
<!--                     </ul> -->
<!--                 </div> -->
				<div class="span10">
                    <h3>Horarios en que se da la materia: ${materia.nombreMateria}</h3>
					
				</div>
                <div class="span10" id="calendar">
                	<br />
                </div>
            </div>
        </div>
    </div>
</div> <!-- /container -->
<%@ include file="includes/footer_calendario.html" %>