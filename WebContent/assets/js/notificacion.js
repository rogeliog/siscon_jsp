function rechazar(id){
	document.getElementById("rechaza-"+id).value = "true";
	document.getElementById("acepta-"+id).value = "false";
	document.getElementById("forma-"+id).submit();
}

function aceptar(id){
	document.getElementById("acepta-"+id).value = "true";
	document.getElementById("rechaza-"+id).value = "false";
	document.getElementById("forma-"+id).submit();
}