<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>


</style>

<script>

$(document).ready(function(){
	  $('#newButton').click(function(){
	           sendData();
	    });
	   });
	function sendData(){
	   var mge = $('#newText').val();
	    alert(mge);
	    $.ajax({
	        type: "POST",
	        url: "AjaxServlet",
	        data: { message : mge  }
	      }).done(function( msg ) {
	        alert( "Data Saved: " + msg );
	      });
	}

	
</script>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<div>
<input type="text" id="newText">
<input type="button" id="newButton" value="sendData"> 
</div>




</body>
</html>