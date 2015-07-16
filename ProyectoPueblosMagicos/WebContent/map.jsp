<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import='modelo.dao.*,
    modelo.pojos.*,
    javax.servlet.http.HttpServletResponse,
	javax.servlet.http.HttpServletRequest'
	%>
	<%!String pueblos;
	CoordenadaBean cb;
	%>
	<%
	HttpSession s = request.getSession();
	pueblos= (String)s.getAttribute("markers");
	cb=(CoordenadaBean)s.getAttribute("coord");	
	
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


<body >

<div id="map" style="width: 80%;height: 80%;position: absolute;"></div>
<script type="text/javascript">
		var str = "<%=pueblos%>";
		console.log(str);
		var locationArray = str.split("|");
		var locations= new Array(locationArray.length-1);
		var j;
		for(j = 0; j < locationArray.length-1; j++) {
			locations[j]= locationArray[j].split("/");
				
		}
		
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom : 10,
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
			console.log(locations[i][1]);
//			console.log(locations[i][2]);
	//		console.log(locations[i][0]);
		      marker = new google.maps.Marker({
	        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
	        map: map
	      });

	      google.maps.event.addListener(marker, 'click', (function(marker, i) {
	        return function() {
	          infowindow.setContent(locations[i][0]);
	          infowindow.open(map, marker);
	        }
	      })(marker, i));
	    }
</script>

</body>
</html>