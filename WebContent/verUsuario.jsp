<%String pageTitle = "SISCON | Calendario";%>
<%@ include file="includes/header_calendario.jsp" %>
<div class="container">
    <div class="row-fluid">
        <div class="span12">
            <div class="row-fluid">
<!--                 <div class="span2"> -->
<!--                     <ul class="nav nav-list"> -->
<!--                         <li class="nav-header"> -->
<%--                             ${usuario.nombreUsuario} --%>
<!--                         </li> -->
<!--                         <li class="active"> -->
<%--                             <a href="Busqueda?objeto=usuario&id=${usuario.indexUsuario}&accion=informacion"><i class="icon icon-book"></i> Informaci&oacute;n</a> --%>
<!--                         </li> -->
<!--                         <li> -->
<%--                             <a href="Busqueda?objeto=usuario&id=${usuario.indexUsuario}&accion=horario"><i class="icon icon-time"></i> Consultar Horario</a> --%>
<!--                         </li> -->
<!--                     </ul> -->
<!--                 </div> -->
				<div class="span10">
                    <h3>${usuario.nombreUsuario}</h3> 
                    <h3>Email: ${usuario.email}</h3>
				</div>	
                <div class="span10" id="calendar">
                    <br />
                </div>
            </div>
        </div>
    </div>
</div> <!-- /container -->
<%@ include file="includes/footer_calendario.html" %>