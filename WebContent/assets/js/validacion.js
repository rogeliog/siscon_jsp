$(function() {
  
  //pagina de login
  $('#usuario').validate( {
    expression: "if(VAL) return true; else return false;",
    message: "No puede estar vacio"
  });

  $('#pwd').validate( {
    expression: "if(VAL) return true; else return false;",
    message: "No puede estar vacio"
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
    message: "No puede estar vacio"
  });

  $('#contraseniaC').validate( {
    expression: "if(VAL == $('#contrasenia').val() && VAL) return true; else return false;",
    message: "Las contrase\u00F1as deben ser iguales"
    //message: "Las contraseñas deben ser iguales" no funciona en jsp debe usarse el caracter en unicode
  });

  $('#nombre').validate( {
    expression: "if (VAL) return true; else return false;",
    message: "No puede estar vacio"
  });

  $('#apellidoP').validate( {
    expression: "if (VAL) return true; else return false;",
    message: "No puede estar vacio"
  });

  $('#apellidoM').validate( {
    expression: "if (VAL) return true; else return false;",
    message: "No puede estar vacio"
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

});