<%@page import="clases.Usuario" %>
<%
  	//get attributes from the session
  	Usuario usuario = (Usuario) session.getAttribute("usuario");
	// handle null values
	if (usuario == null) {
		usuario = new Usuario();
	}
%>