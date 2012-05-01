<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 
    String pageTitle = "SISCON | Registrar Usuario";
    //get attributes from the session
    String not = (String) session.getAttribute("not");
    String error = (String) session.getAttribute("error");

    // handle null values
    if (not == null) {
        not = "";
    }
    if (error == null) {
        error = "";
    }
%>
<%@ include file="includes/header_principal.jsp" %>
<%@ page language="java" import="java.sql.*" %>
<%
    String url = "jdbc:mysql://localhost/SISCON";
    Connection con = (Connection) DriverManager.getConnection(url, "root", "");
    Statement query = (Statement) con.createStatement();
%>

        <div class="container">
      
          <div class="row">
            <div class="span7 offset2">
              <div class="alert alert-block">
                <a class="close" data-dismiss="alert">&times;</a>
                <h3 class="alert-heading"><i class="icon-exclamation-sign"></i> &nbsp;Nota:</h3>
                <p>Una vez registrado, se debe ser autorizado por el Director de Departamento para utilizar
                  el sistema.</p>
                
              </div>
            </div>
          </div> <!-- /row -->
          
          <!-- <div class="span4 offset4">
            <h1>Registro</h1>
          </div> -->

        <div class="row">      
            <div class="span7 offset2">          
                        <form class="form-horizontal well" action="Registro" method="post">
                            <h1>Registro</h1>
                            <fieldset>
                                <legend>Favor de llenar la informaci&oacute;n necesaria</legend>
                                <h1 style="color:gold"><i><%= not %></i></h1>
                                <h1 style="color:red"><i><%= error %></i></h1>
                                <div class="control-group">
                                    <label class="control-label" for="matricula">Matr&iacute;cula</label>
                                    <div class="controls">
                                        <input name="matricula" id="matricula" class="input-small" type="text">
                                        <span>(Ej. L12345678)</span>	
                                        <span class="help-inline"></span>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="contrasenia">Contrase&ntilde;a</label>
                                    <div class="controls">
                                        <input name="contrasenia" id="contrasenia" class="input-medium" type="password">
                                        <span class="help-inline"></span>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="contraseniaC">Confirmaci&oacute;n contrase&ntilde;a</label>
                                    <div class="controls">
                                        <input name="contraseniaC" id="contraseniaC" class="input-medium" type="password">
                                        <span class="help-inline"></span>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="nombres">Nombre(s)</label>
                                    <div class="controls">
                                        <input name="nombre" id="nombre" class="input-small" type="text">
                                        <span class="help-inline"></span>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="apellidoP">Apellido Paterno</label>
                                    <div class="controls">
                                        <input id="apellidoP" name="apellidoP" class="input-small" type="text">
                                        <span class="help-inline"></span>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="apellidoM">Apellido Materno</label>
                                    <div class="controls">
                                        <input id="apellidoM" name="apellidoM" class="input-small" type="text">
                                        <span class="help-inline"></span>
                                    </div>
                                </div>
                                <div class="control-group">
                                  <label class="control-label">Sexo</label>
                                  <div class="controls">
                                    <label class="radio inline">
                                      <input id="sexo1" type="radio" value="masculino" name="sexo">
                                      Masculino
                                    </label>
                                    <label class="radio inline">
                                      <input id="sexo2" type="radio" value="femenino" name="sexo">
                                      Femenino
                                    </label>
                                  </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">&iquest;Eres Director de Departamento?</label>
                                    <div id="directorDept" class="controls">
                                        <label class="radio inline">
                                        	<input id="dt1" type="radio" value="D" name="DT"> S&iacute;
                                        </label>
                                        <label class="radio inline">
                                        	<input id="dt2" type="radio" value="P" name="DT"> No
                                        </label>
                                        <span class="help-inline"></span>                                        
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="departamento">Departamento</label>
                                    <div class="controls">
                                        <select id="departamento" name="departamento">
                                            <% 
                                                String q = "SELECT * FROM `Departamento`";
                                                ResultSet rs = query.executeQuery(q);
                                                while(rs.next()) { 
                                            %>
                                            <option value='<%=rs.getInt("idDepartamento")%>'><%=rs.getString("departamento")%></option>
                                            <%
                                                } 
                                            %>
                                        </select>
                                        <span class="help-inline"></span>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="email">E-mail</label>
                                    <div class="controls">
                                        <input id="email" name="email" class="input-large" type="text">
                                        <span class="help-inline"></span>
                                    </div>
                                </div>
                                <div class="control-group">
                                  <label class="control-label" for="telefonos">Tel&eacute;fonos</label>
                                  <div class="controls">
                                    <textarea id="telefonos" name="telefonos" class="input-xlarge" rows="3"></textarea>
                                    <p class="help-block">Escriba su(s) tel&eacute;fono(s) y su extensi&oacute;n separadas por saltos de l&iacute;nea.</p>
                                    <p class="help-block">Ejemplo:<br />83582000-4592<br />83284488</p>
                                  </div>
                                </div>
                                <div class="form-actions">
                                    <button class="btn btn-primary" type="submit">Registrarse</button>
                                    <button class="btn" type="reset">Cancelar</button>
                                </div>
                            </fieldset>
                        </form>
            </div> <!-- /span -->
        </div><!-- /row -->
        </div> <!-- /container -->
<%@ include file="includes/footer_principal.jsp" %>
<% 
   session = request.getSession();
   session.removeAttribute("not");
   session.removeAttribute("error"); 
%>