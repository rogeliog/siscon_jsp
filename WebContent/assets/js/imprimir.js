var back = $('span#back');

$(function() {
	back.hide();
	// validacion de la forma
		//validacion de actividades
	$('#actividad').validate( {
		expression: "if (VAL != '0') return true; else return false;",
		message: 	"Seleccione una actividad"
	});

	$('#checkboxDias').validate( {
		expression: "if (isChecked(SelfID)) return true; else return false;",
		message: 	"Seleccione los dias de la actividad"
	});
	$('#inicio').validate( {
		expression: 	"if(VAL.match(/^([01]?[0-9]|2[0-3]):[0-5][0-9]\\b/) && VAL) return true; else return false;",
		message: 	"Formato inv\u00E1lido de hora."
	});
	
	$('#horaFin').validate( {
		expression: 	"if(VAL.match(/^([01]?[0-9]|2[0-3]):[0-5][0-9]\\b/) && VAL) return true; else return false;",
		message: 	"Formato inv\u00E1lido de hora."
	});
});

var botonImp = $('span#impr');

botonImp.on('click', function(){
	var navbar = document.getElementById("nav");
	var wrap = document.getElementById("wrap");
	wrap.removeChild(navbar);
	var bod = document.getElementsByTagName("body")[0];
	var foot = document.getElementsByTagName("footer")[0];
	bod.removeChild(foot);

	botonImp.hide();
	$('a#agregarBoton').hide();
	$('form#forma2').hide();
	$('table#tablaAct').hide();
	$('#banner').hide();
	back.show();
});

$('span#back').on('click', function() {
	location.reload();
});