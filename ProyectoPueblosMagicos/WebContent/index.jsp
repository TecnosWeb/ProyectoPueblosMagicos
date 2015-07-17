<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import='modelo.dao.*,
    modelo.pojos.*,
    javax.servlet.http.HttpServletResponse,
	javax.servlet.http.HttpServletRequest'
	%>
<%!PuebloDao pDao = new PuebloDao();
	ConexionBD cbd = new ConexionBD();
%>
<%
	PropiedadesConexion pbd = new CargarPropiedades().getPropiedades("C:/Users/Didier/git/ProyectoPueblosMagicos/WebContent/conf/config.properties");
	pbd.print();
	String a = cbd.conectar(pbd.getUrl(), pbd.getUser(), pbd.getPass());
	System.out.println(a);
	pDao.setConDao(cbd.getCon());
	HttpSession sesion = request.getSession();
	sesion.setAttribute("conexionBD", cbd);
	sesion.setAttribute("pDao", pDao);
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="http://maps.google.com/maps/api/js?sensor=false"  type="text/javascript"></script>
<script src="js/js/jquery-1.9.1.js"></script>
<script>
var x = $("#latitude");
console.log(x);
var y = $("#longitude");
console.log(y);

	function  cargarLista2(){ // http://www.w3schools.com/jquery/ajax_ajax.asp
		var mge = $("#lista option:selected").val();
	    $.ajax({
	        type: "post",
	        url: "AjaxCargarLista", 
	        data: { message : mge  },
		    success : function(data){
	            limpiaL2();
	            $("#lista2").append(data);
	        }
	      });
	  //FIN DE FUNCION AJAX-JQUERY
	}  
	function llenaLista(){
		$("#lista option").remove();
		var opciones= "<%=pDao.cargarEstados()%>";
		console.log("opciones: " + opciones);
		$("#lista").append(opciones);
		getLocation();
	}
	function limpiaL2() {
		$("#lista2 option").remove();
	};
	function obtenerPueblo(){
		var selected=$("#lista2 option:selected").text();
		var lat=$("#latitude").val();
		var lng=$("#longitude").val();
		
	       
		$.ajax({
	        type: "get",
	        url: "DatosServlet", 
	        data: { message : selected, latitude:lat, longitude:lng  },
		    success : function(data){
	            //limpiaL2();
	            console.log("ajax correcto en obtenerPueblo");
	            location.href = "map.jsp";
	            //$("#lista2").append(data);
	        }
	      });
       
		
	}
	function getLocation() {
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(showPosition);
		} else {
			alert("Geolocation is not supported by this browser.");
		}
	}

	function showPosition(position) {
		//x.innerHTML = position.coords.latitude;
		//y.innerHTML = position.coords.longitude;
		$("#latitude").attr("value",position.coords.latitude);
		$("#longitude").attr("value",position.coords.longitude);
		}

</script>


</head>
<body onload="llenaLista()" style="height: 100%; position: absolute;">
	<div id="datos" style="height: 50%">
		<div id="datosUsuario"
			style="height: 30%; padding: 20px; vertical-align: middle;">
			<form action="DatosServlet" method="POST">
				<label>Introduce un radio de búsqueda (km) <br /> Se
					sugiere un intervalo [100-1000]
				</label> <input id="radio" name="radio">
				<input type="submit"  value="Buscar pueblos en radio">
			<label><br/>Latitud</label>
			<input id="latitude" name="latitude" value="0">
			<label><br/>Longitud</label>
			<input id="longitude" name="longitude" value="0">
			</form>
		</div>
		<div id="infoPueblos" style="padding: 20px; width: 80%;; margin: 0%">
			<p>Un Pueblo Mágico es una localidad que tiene atributos
				simbólicos, leyendas, historia, hechos trascendentes, cotidianidad,
				en fin magia que te emanan en cada una de sus manifestaciones
				socio-culturales, y que significan hoy día una gran oportunidad para
				el aprovechamiento turístico. El Programa Pueblos Mágicos contribuye
				a revalorar a un conjunto de poblaciones del país que siempre han
				estado en el imaginario colectivo de la nación en su conjunto y que
				representan alternativas frescas y diferentes para los visitantes
				nacionales y extranjeros.</p>
		</div>
		<div id="combosDinamicos">
			<label for="conSelect"> O busca pueblos por estado</label>
			<div id="conSelect" class="redondos">
				<form onsubmit='return false;' id="formMultiSelects">
					<select id="lista" name="lista" onchange="cargarLista2()"></select> 
					<select id="lista2" name="lista2" onchange="obtenerPueblo()"></select>
					</form>
				</div>
				<form action="index.jsp" method = "post">
				<input type="submit" id="btnSubmit" name="btnSubmit" value="Enviar"/>				
				</form>
			</div>
		</div>
	</body>
</html>
