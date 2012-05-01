function rechaza(p){
	console.log(p);
	document.getElementById("rechaza"+ p).value = "true";
	document.getElementsByTagName("form")[0].submit();
}

function acepta(p){
	console.log(p);
	document.getElementById("acepta"+ p).value = "true";
	document.getElementsByTagName("form")[0].submit();
}