<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<%
	String pageTitle = "SISCON | Iniciar Sesi&oacute;n";
  //get attributes from the session
  String msg = (String) session.getAttribute("msg");
  // handle null values
  if (msg == null) {
      msg = "";
  }
%>
<%@ include file="includes/header_principal.jsp" %>

         <div class="container">
            <div class="row">
                <div class="span8 offset2">
                    <div class="hero-unit">
                        <h1>Bienvenido a SISCON</h1>
                        <p>Sistema Integrador de Servicios para Consultas en Objetos Normativos</p>
                    </div>
                </div> <!-- /span -->
                    <div class="span4 offset4">
                    <%
                    	if(!msg.equals("")) {
                    %>
                    	<div class="alert alert-error">
			        		<a href="#" class="close" data-dismiss="alert">�</a>
			        		<h4><i class="icon icon-remove-sign"></i> �ERROR!</h4>
			        		<%= msg %>
		        		</div>
                    <%
                    	}
                    %>
                      <form action="IniciarSesion" class="well" method="post">
                        <fieldset>
                          <h1>Iniciar Sesi&oacute;n</h1>
                            <div class="control-group">
                              <label class="control-label" for="usuario">Usuario</label>
                              <div class="controls">
                                <input id="usuario" name="usuario" type="text" class="input-medium">
                                <span class="help-inline" id="usuarioInfo"></span>
                              </div>
                            </div>
                              <div class="control-group">
                                <label class="control-label" for="pwd">Contrase&ntilde;a</label>
                                <div class="controls">
                                  <input id="pwd" name="pswd" type="password" class="input-medium">
                                  <span class="help-inline" id="passInfo"></span>
                                </div>
                              </div>
                            <div>
                              <button type="submit" class="btn btn-primary">Entrar</button>
                            </div>
                          </fieldset>
                        </form>
                    </div> <!-- /span -->
            </div> <!-- /row -->
          </div> <!-- /container -->
<%@ include file="includes/footer_principal.jsp" %>
<% session = request.getSession();
   session.removeAttribute("msg"); %>