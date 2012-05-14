<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 
    String pageTitle = "SISCON | Mi perfil";
    //get attributes from the session
    String cambios = (String) session.getAttribute("cambios");
    String error = (String) session.getAttribute("error");

    // handle null values
    if (cambios == null) {
        cambios = "";
    }
    if (error == null) {
        error = "";
    }

%>
<%@ include file="includes/header_aplicacion.jsp" %>
<%@ page language="java" import="java.sql.*" import="clases.Conexion" %>
<%
    
    Connection con = null;
	con = Conexion.con();
    Statement query = (Statement) con.createStatement();
%>
        <div class="container">      
        <div class="row">
            <div class="span7 offset2">
              <div class="alert alert-block">
                <a class="close" data-dismiss="alert">&times;</a>
                <h4 class="alert-heading"><i class="icon-exclamation-sign"></i> &nbsp;Nota:</h4>
                <p>Deber&aacute; introducir su contrase&ntilde;a actual para poder realizar cambios</p>
              </div>
            </div>
        </div> <!-- /row -->
        <div class="row">      
            <div class="span7 offset2">          
                        <form class="form-horizontal" action="CambiarPerfil" method="post">
                            <fieldset>
                            <legend>Cambiar mi informaci&oacute;n</legend>
                                <p style="color:gold"><i><%= cambios %></i></p>
                                <p style="color:red"><i><%= error %></i></p>
                                <br />
                                <div class="control-group">
                                    <label class="control-label">N&oacute;mina</label>
                                    <div class="controls">
                                    	<span class="input-small uneditable-input"><%= usuario.getMatricula() %></span>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="pswdV">Contrase&ntilde;a actual</label>
                                    <div class="controls">
                                        <input name="pswdV" id="pswdV" class="input-medium" type="password">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="pswd">Cambiar contrase&ntilde;a</label>
                                    <div class="controls">
                                        <input name="pswd" id="pswd" class="input-medium" type="password">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="pswdC">Confirmar contrase&ntilde;a nueva</label>
                                    <div class="controls">
                                        <input name="pswdC" id="pswdC" class="input-medium" type="password">
                                    </div>
                                </div>
                                <div class="control-group">
                                  <label class="control-label" for="telefonos">Tel&eacute;fonos</label>
                                  <div class="controls">
                                    <textarea id="telefonos" name="telefonos" rows="3">
	                                    <% 
	                                    	String tel[] = usuario.getTelefonos(); 
	                                		for(int i = 0; i < tel.length; i++) { 
	                                			  if(!tel[i].equals("0")) 
	                                	%>
	                                	<%= tel[i] %>
	                                	<% 
	                                		}
	                                	%>
                                	</textarea>
                                    <p class="help-block">Escriba su(s) tel&eacute;fono(s) y su extensi&oacute;n separadas por saltos de l&iacute;nea.</p>
                                    <p class="help-block">Ejemplo:<br />83582000-4592<br />83284488</p>
                                  </div>
                                </div>
                                <div class="form-actions">
                                    <button class="btn btn-inverse" type="submit">Guardar cambios</button>
                                    <button class="btn" type="reset">Cancelar</button>
                                </div>
                            </fieldset>
                        </form>
            </div> <!-- /span -->
        </div><!-- /row -->
        </div> <!-- /container -->
<%@ include file="includes/footer_aplicacion_1.html" %>
<% 
   session = request.getSession();
   session.removeAttribute("cambios");
   session.removeAttribute("error");
%>