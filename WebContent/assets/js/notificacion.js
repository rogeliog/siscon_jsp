$('button#rechazaBoton').on('click', function(){
	document.getElementById("rechaza").value = "true";
	document.getElementsByTagName("form")[0].submit();
});

$('button#aceptaBoton').on('click', function(){
	document.getElementById("acepta").value = "true";
	document.getElementsByTagName("form")[0].submit();
});