<%
  String pageTitle = "SISCON | Subir Archivo";
%>
<%@ include file="includes/header_aplicacion.jsp" %>
<div class="container">

  <div class="row">

    <h1>Subir Archivo</h1>
    <br />
    <p>Últimas actualizaciones</p>
    <table id="tabla1" class="table table-striped table-bordered table-condensed">
        <tr>
            <td>Fecha</td>
            <td>Hora</td>
            <td>Departamento</td>
            <td>Archivo</td>
        </tr>
    </table>
    <br />
    <div class="span3">
        <h3>Subir documento nuevo</h3> 
        <form >
  				<label class="control-label">Nombre del departamento:</label>
  				<input id="departamento" type="text" class="input-large">  
  				<label class="control-label">Selecciona el documento:</label>
  				<input class="input-file" id="fileInput" type="file">  			
  				<button type="button" class="btn" onclick="errorMsg()" >Subir</button> 
  				<label id="errorFile" class="control-label"></label>
  			</form>
		</div>
    <div id="lectura" style="display: none" class="span3">
        <h3>Realizar lectura de archivo</h3>
			<p>Ejecutar la lectura del documento y actualizar la base de datos.	</p>
			<button type="button" class="btn" onclick="errorLectura()" >Aceptar</button>  
			<label id="errorLectura" class="control-label"></label>
		</div>
		<div id="resultadolectura" style="display: none" class="span3">
				<h3>Lectura de archivo realizada</h3>
				<span>Se ejecuto la lectura del documento de</span> <span id="dept" class="control-label"></span> 
				<span>satisfactoriamente el </span><span id="fecha" class="control-label"></span> 
				<button type="button" class="btn" onclick="errorLectura()" >Terminar</button>  
		</div>
  </div> <!-- /row -->
</div> <!-- /container -->
<%@ include file="/includes/footer_subir_archivo.html" %>