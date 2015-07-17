<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import='modelo.dao.*,
    modelo.pojos.*,
    javax.servlet.http.HttpServletResponse,
	javax.servlet.http.HttpServletRequest'
	%>
	<%!String pueblos;
	String urls;
	CoordenadaBean cb;
	PuebloDao pdao=new PuebloDao();
	ConexionBD cbd;
	%>
	<%
	HttpSession s = request.getSession();
	cbd=(ConexionBD)s.getAttribute("conexionBD");
	pueblos= (String)s.getAttribute("markers");
	urls= (String)s.getAttribute("urls");
	
	cb=(CoordenadaBean)s.getAttribute("coord");	
	pdao.setConDao(cbd.getCon());
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mapa</title>
<script src="http://maps.google.com/maps/api/js?sensor=false" 
          type="text/javascript"></script>
</head> 
<script src="js/js/jquery-1.9.1.js"></script>

</head>


<body>
<div class="container" style="width: 100%;height: 100%;position: absolute;clear: both;">
	<div id="map" style="width: 60%;height: 100%;position: absolute;float: left;display: block;"></div>
	<div id="infoPueblo" style="width: 40%;height: 100%;position: absolute;display: block;float: right; left: 60%"></div>
</div>

<script type="text/javascript">
		var str = "<%=pueblos%>";
		var str2="<%=urls%>"
		//console.log(str);
		var urls= str2.split("|");
		var locationArray = str.split("|");
		var locations= new Array(locationArray.length-1);
		var j;
		for(j = 0; j < locationArray.length-1; j++) {
			locations[j]= locationArray[j].split("/");
				
		}
		
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom : 8,
			center : new google.maps.LatLng(<%=cb.getLatitude()%>,<%=cb.getLongitude()%>),
			mapTypeId: google.maps.MapTypeId.ROADMAP
	    });

	    var infowindow = new google.maps.InfoWindow();

	    var marker, i;
	    var pinColor = "3366FF";
	    var pinImage = new google.maps.MarkerImage("http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|" + pinColor,
	        new google.maps.Size(21, 34),
	        new google.maps.Point(0,0),
	        new google.maps.Point(10, 34));
	    var pinShadow = new google.maps.MarkerImage("http://chart.apis.google.com/chart?chst=d_map_pin_shadow",
	        new google.maps.Size(40, 37),
	        new google.maps.Point(0, 0),
	        new google.maps.Point(12, 35));
	    marker = new google.maps.Marker({
	        position: new google.maps.LatLng(<%=cb.getLatitude()%>, <%=cb.getLongitude()%>),
	        map: map,
	 	    icon: pinImage,
        	shadow: pinShadow
	      });
	    for (i = 0; i < locations.length; i++) { 
		    marker = new google.maps.Marker({
	        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
	        map: map
	      });

	      google.maps.event.addListener(marker, 'click', (function(marker, i) {
	        return function() {
	          infowindow.setContent(locations[i][0]);
	          infowindow.open(map, marker);
	          $("#infoPueblo").html("<object style='width:100%;height:100%' data='"+urls[i]+"'/>");
	        }
	      })(marker, i));
	    }
</script>

</body>
</html>