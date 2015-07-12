<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<button onclick="getLocation()">Buscar</button>

<p id="latitude"></p>
<p id="longitude"></p>
<p>Un Pueblo Mágico es una localidad que tiene atributos simbólicos, leyendas, historia, hechos trascendentes, cotidianidad, en fin magia que te emanan en cada una de sus manifestaciones socio-culturales, y que significan hoy día una gran oportunidad para el aprovechamiento turístico. El Programa Pueblos Mágicos contribuye a revalorar a un conjunto de poblaciones del país que siempre han estado en el imaginario colectivo de la nación en su conjunto y que representan alternativas frescas y diferentes para los visitantes nacionales y extranjeros.</p>

<script>
var x = document.getElementById("latitude");
var y = document.getElementById("longitude");

function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else { 
    	alert("Geolocation is not supported by this browser.");
    }
}

function showPosition(position) {
    x.innerHTML = "Latitude: " + position.coords.latitude + 
    "<br>Longitude: " + position.coords.longitude;	
}
</script>
</body>
</html>
