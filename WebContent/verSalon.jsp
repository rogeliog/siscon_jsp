<%String pageTitle = "SISCON | Calendario";%>
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
                    <h3>Horario del sal&oacute;n: ${salon.clave}</h3>
					
				</div>
                <div class="span10" id="calendar">
                	<br />
                </div>
            </div>
        </div>
    </div>
</div> <!-- /container -->
<%@ include file="includes/footer_calendario.html" %>