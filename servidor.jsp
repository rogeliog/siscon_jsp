<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-type" content="text/html;charset=UTF-8" />
<style type="text/css">
body {color:#663300; background-color:#FFFFCC}
table
{
border-collapse:collapse;
}
td {border:1px solid black; padding:10px}
</style>
<title>Servidor de prueba</title>
<script type="text/javascript">
function getArgs() {
   var resumen ="<h2>Resumen de los datos de la forma</h2><table>";
   resumen+="<tr><th>Variable</th><th>Valor</th></tr>";
   var query = location.search.substring(1);
   var pares= query.split("&");
   for(var i = 0; i < pares.length; i++) {
      var pos = pares[i].indexOf('=');
      if (pos == -1) continue;
      var name = pares[i].substring(0,pos);
      var value = pares[i].substring(pos+1);
      value=unescape(value);
      value=value.replace(/\+/g, ' ');
      resumen+="<tr><td>"  
      +name+"</td><td>"+value+"</td></tr>"; 
   }
resumen+="</table>";
document.write(resumen);
}
getArgs();
</script>
</head>

<body style="color:#663300; background-color:#FFFFCC">
</body>
</html>
