<%String pageTitle = "SISCON | Calendario";%>
<%@ include file="includes/header_calendario.jsp" %>
<div class="container">
    <div class="row-fluid">
        <div class="span12">
            <div class="row-fluid">
                <div class="span2">
                    <ul class="nav nav-list">
                        <li class="nav-header">
                            ${usuario.nombreUsuario}
                        </li>
                        <li class="active">
                            <a href="Busqueda?objeto=usuario&id=${usuario.indexUsuario}&accion=informacion">Informaci&oacute;n</a>
                        </li>
                        <li>
                            <a href="Busqueda?objeto=usuario&id=${usuario.indexUsuario}&accion=horario">Consultar Horario</a>
                        </li>
                    </ul>
                </div>
                <div class="span10" id="calendar">
                    ${usuario.email}
                    <br />
                </div>
            </div>
        </div>
    </div>
</div> <!-- /container -->
<%@ include file="includes/footer_calendario.html" %>