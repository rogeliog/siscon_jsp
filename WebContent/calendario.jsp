<%
  String pageTitle = "SISCON | Calendario";
%>
<%@ include file="includes/header_calendario.jsp" %>
<<script type="text/javascript">
	function exporta(){
		var navbar = document.getElementById("nav");
		var wrap = document.getElementById("wrap");
		wrap.removeChild(navbar);
		var bod = document.getElementsByTagName("body")[0];
		var foot = document.getElementsByTagName("footer")[0];
		bod.removeChild(foot);
		
		var calen = document.getElementById("calendar");
		var divs = calen.getElementsByTagName("div");
		var view = divs[0];
		var scroll = divs[16];
		
		view.style.height = "900px"
		scroll.style.height = "900px"
		scroll.style.overflowY = "hidden";
		
		regresa = document.getElementById("impr");
		regresa.onclick = "window.location.reload()";
		regresa.innerHTML = "Regresar";
	}
</script>
<div class="container">
  <div class="row">
    <div class="span10 offset1">
        <div id="calendar"></div>
        <a id="impr" href="#" onclick="exporta()">Versi&oacute;n para Imprimir</a>
    </div>
  </div> <!-- /row -->
</div> <!-- /container -->
<%@ include file="includes/footer_calendario.html" %>