<% 
    String pageTitle = "SISCON | Registrar Usuario";
%>
<%@ include file="includes/header_principal.jsp" %>

        <div class="container">
      
          <div class="row">
            <div class="span7 offset2">
              <div class="alert alert-block">
                <a class="close" data-dismiss="alert">&times;</a>
                <p><i class="icon-exclamation-sign"></i> &nbsp;&nbsp;Una vez registrado, se debe ser autorizado por el Director de Departamento para utilizar
                  el sistema.</p>
                
              </div>
            </div>
          </div> <!-- /row -->
          
          <!-- <div class="span4 offset4">
            <h1>Registro</h1>
          </div> -->

        <div class="row">      
            <div class="span7 offset2">          
                        <form class="form-horizontal well" action="servidor.jsp" method="get">
                            <h1>Registro</h1>
                            <fieldset>
                                <legend>Favor de llenar la informaci&oacute;n necesaria</legend>
                                <div class="control-group">
                                    <label class="control-label" for="matricula">Matr&iacute;cula</label>
                                    <div class="controls">
                                        <input name="matricula" id="matricula" class="input-small" type="text">
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
                                        <!-- <p class="help-block">Nota: Puede utilizar la contrase&ntilde;a de su cuenta del Tec para mayor facilidad</p> -->
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
                                    <label class="control-label" for="departamento">Departamento</label>
                                    <div class="controls">
                                        <select id="departamento" name="departamento">
                                            <option value="0">Seleccione su departamento</option>
                                            <option value="ciencias comp">Ciencias Computacionales</option>
                                            <option value="otro">Otro</option>
                                            <option value="otro">Otro</option>
                                            <option value="otro">Otro</option>
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