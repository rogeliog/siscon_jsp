function errorMsg()	{
			var msg="La subida fue exitosa"
			document.getElementById("errorFile").innerHTML=""+msg;
			muestraLectura();
		}
		function muestraLectura(){
			var lectura = document.getElementById("lectura");
			lectura.style.display = "block";
			}
		function errorLectura()	{
			var msg="La lectura fue exitosa"
			document.getElementById("errorLectura").innerHTML=""+msg;
			muestraResultado();
		}
		function muestraResultado(){
			var currentTime = new Date()
			var mes = currentTime.getMonth() + 1;
			var dia = currentTime.getDate();
			var anio = currentTime.getFullYear();
			var fecha =dia + "/" + mes + "/" + anio +" ";
			var hora = currentTime.getHours() + ":" + currentTime.getMinutes() ;
			document.getElementById("fecha").innerHTML=fecha + " a las " + hora;
			var resultado= document.getElementById("resultadolectura");
			var dept = document.getElementById("departamento").value;
			document.getElementById("dept").innerHTML=""+dept;
			resultado.style.display = "block";
			addRow(hora, fecha, dept);
			}
		function addRow(hora, fecha, departamento){
			var tbody = document.getElementById("tabla1")
			var row = document.createElement("tr")
			var data1 = document.createElement("td")
			data1.appendChild(document.createTextNode(""+fecha))
			var data2 = document.createElement("td")
			data2.appendChild (document.createTextNode(""+hora))
			var data3 = document.createElement("td")
			data3.appendChild (document.createTextNode(""+departamento))
			var data4 = document.createElement("td")
			data4.appendChild (document.createTextNode("Excel"))
			row.appendChild(data1);
			row.appendChild(data2);
			row.appendChild(data3);
			row.appendChild(data4);
			tbody.appendChild(row);
		}	