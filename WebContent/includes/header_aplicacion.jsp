 <%
 	String name = (String) session.getAttribute("name");
 	  // handle null values
 	  if (name == null) {
 	      name = "";
 	  }
 %>
<%@ include file="usuario.jsp" %>
<jsp:include page="includes/header1.jsp" flush="true">
	<jsp:param name="pageTitle" value="<%=pageTitle%>" />
</jsp:include>
<%@ include file="style_bienvenido.html" %>
<%@ include file="hero_unit.html" %>
<%@ include file="header2.jsp" %>
<%
	if(usuario.getRol() == 'D') {
%>
		<%@ include file="navbar_director.jsp" %>
	<%
		} 
		else if (usuario.getRol() == 'O') {
	%>
		<%@ include file="navbar_admin.jsp" %>
	<% } 
	else { %>
		<%@ include file="navbar_usuario.jsp" %>
	<% } 
%>