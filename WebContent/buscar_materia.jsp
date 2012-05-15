
<%
	String pageTitle = "SISCON | Buscar Materia";
%>
<%@ include file="includes/header_aplicacion.jsp"%>

<div class="container">
	<div class="row">
		<div class="span7 offset2">
			<form action="Busqueda" class="form-search" method="post">
				<fieldset>
					<input type="hidden" name="objeto" value="materia" /> <input
						type="hidden" name="atributo1" value="nombreMateria" />
					<div class="well">
						<legend>Buscar Materia</legend>
						<label for="nombreMateria" class="control-label">Nombre de
							la materia</label> <input name="valor1" type="text"
							class="input-medium search-query">
						<button type="submit" class="btn btn-inverse">Buscar</button>

					</div>
				</fieldset>
			</form>
		</div>
		<!-- /span -->

	</div>
	<!-- /row -->
</div>
<!-- /container -->
<%@ include file="includes/footer_aplicacion_1.html"%>
