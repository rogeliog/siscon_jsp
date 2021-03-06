$(function() {
  
  //pagina de login
  $('#usuario').validate( {
    expression: "if(VAL) return true; else return false;",
    message: "No puede estar vac&iacute;o"
  });

  $('#pwd').validate( {
    expression: "if(VAL) return true; else return false;",
    message: "No puede estar vac&iacute;o"
  });
  //termina pagina de login

  //empieza pagina de registrar
  $('#matricula').validate( {
    expression: "if (VAL.match(/\\b^[A-Z][\\d]{8}\\b/)) return true; else return false;",
    message: "Formato inv\u00E1lido"
    //message: "Formato inválido"
  });

  $('#contrasenia').validate( {
    expression: "if (VAL) return true; else return false;",
    message: "No puede estar vac&iacute;o"
  });

  $('#contraseniaC').validate( {
    expression: "if(VAL == $('#contrasenia').val() && VAL) return true; else return false;",
    message: "Las contrase\u00F1as deben ser iguales"
    //message: "Las contraseñas deben ser iguales" no funciona en jsp debe usarse el caracter en unicode
  });

  $('#nombre').validate( {
    expression: "if (VAL) return true; else return false;",
    message: "No puede estar vac&iacute;o"
  });

  $('#apellidoP').validate( {
    expression: "if (VAL) return true; else return false;",
    message: "No puede estar vac&iacute;o"
  });

  $('#apellidoM').validate( {
    expression: "if (VAL) return true; else return false;",
    message: "No puede estar vac&iacute;o"
  });

  $('#directorDept').validate( {
    expression: "if (isChecked(SelfID)) return true; else return false;",
    message: "Seleccione un radio boton"
  });

  $('#departamento').validate( {
    expression: "if (VAL != '0') return true; else return false;",
    message: "Seleccione un departamento"
  });

  jQuery("#email").validate({
    expression: "if (VAL.match(/^[^\\W][a-zA-Z0-9\\_\\-\\.]+([a-zA-Z0-9\\_\\-\\.]+)*\\@[a-zA-Z0-9_]+(\\.[a-zA-Z0-9_]+)*\\.[a-zA-Z]{2,4}$/)) return true; else return false;",
    message: "Formato de email no v\u00E1lido"
    //message: "Formato de email no válido"
  });
  
  
  //validacion en cambio de contrasenia
  $('#pswd').validate( {
	  expression: "if (VAL) return true; else return false",
	  message: 	"No puede estar vac&iacuteo"
  });
  
  $('#pswdC').validate( {
	  expression: "if(VAL == $('#pswd').val() && VAL) return true; else return false;",
	  message: "Las contrase\u00F1as deben ser iguales"
  });

});