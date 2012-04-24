<%@page import="clases.Usuario" %>
<%
  	//get attributes from the session
  	Usuario usuario = (Usuario) session.getAttribute("user");
	// handle null values
	if (usuario == null) {
		usuario = new Usuario();
	}
%>