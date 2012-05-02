<%String pageTitle = "SISCON | Calendario";%>
<%@page import="calendar.data.Usuario" %>
<%@ include file="includes/header_calendario.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
  <div class="row">
    <div class="span7 offset2">
      <table width="100%" cellpadding="0" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Nomina</th>
                    <th>Email</th>
                    <th>&nbsp;</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="usuarioCal" items="${usuarios}">
                <tr>
                    <td>${usuarioCal.nombreUsuario}</td>
                    <td>${usuarioCal.idUsuario}</td>
                    <td>${usuarioCal.email}</td>
                    <td><a href="Busqueda?id=${usuarioCal.indexUsuario}">Ver Usuario</a></td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
    </div> <!-- /span -->
  </div> <!-- /row -->
</div> <!-- /container -->
<%@ include file="includes/footer_calendario.html" %>