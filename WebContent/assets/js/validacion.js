$(function() {
  
  //pagina de login
  $('#usuario').validate( {
    expression: "if(VAL) return true; else return false;",
    message: "No puede estar vac\u00EDo"
  });

  $('#pwd').validate( {
    expression: "if(VAL) return true; else return false;",
    message: "No puede estar vac\u00EDo"
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
    message: "No puede estar va\u00EDo"
  });

  $('#contraseniaC').validate( {
    expression: "if(VAL == $('#contrasenia').val() && VAL) return true; else return false;",
    message: "Las contrase\u00F1as deben ser iguales"
    //message: "Las contraseñas deben ser iguales" no funciona en jsp debe usarse el caracter en unicode
  });

  $('#nombre').validate( {
    expression: "if (VAL) return true; else return false;",
    message: "No puede estar va\u00EDo"
  });

  $('#apellidoP').validate( {
    expression: "if (VAL) return true; else return false;",
    message: "No puede estar vac\u00EDo"
  });

  $('#apellidoM').validate( {
    expression: "if (VAL) return true; else return false;",
    message: "No puede estar vac\u00EDo"
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
	  message: 	"No puede estar vac\u00EDo"
  });
  
  $('#pswdC').validate( {
	  expression: "if(VAL == $('#pswd').val() && VAL) return true; else return false;",
	  message: "Las contrase\u00F1as deben ser iguales"
  });

//  validacion salon
  
//  $('#nombreSalon').validate( {
//	  expression: "if(VAL.match(/\\b[A]\\d\\-\\d{3}\\b/) && VAL) return true; else return false;",
//	  message: "Formato inv\u00E1lido"
//  });

});