 <% 
	 String name = (String) session.getAttribute("name");
	  // handle null values
	  if (name == null) {
	      name = "";
	  }
 %>

<jsp:include page="includes/header1.jsp" flush="true">
	<jsp:param name="pageTitle" value="<%= pageTitle %>" />
</jsp:include>
<%@ include file="style_bienvenido.html" %>
<%@ include file="hero_unit.html" %>
<%@ include file="header2.jsp" %>
<%@ include file="navbar_aplicacion.jsp" %>