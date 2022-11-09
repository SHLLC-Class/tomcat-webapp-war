<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<style>
			#div1 {
			  font-size:48px;
			}
			#div2 {
			  font-size:48px;
			}
		</style>
		<title> SHLLC - Tomcat WebApp </title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	</head>
<body>

	<div id="div1" class="fa"></div>
	<br>
	<h1><h3> Server Side IP Address </h3>
		<br>
		<% 
		String ip = "";
		InetAddress inetAddress = InetAddress.getLocalHost();
		ip = inetAddress.getHostAddress();
		out.println("Server Host Name :: "+inetAddress.getHostName()); 
		%>
		<br>
		<%out.println("Server IP Address :: "+ip);%>	
	</h1>
	
	<hr>

	<h2>
		Welcome to SHLLC - Congrats on deploying your first Web App 
	</h2>
	<br>
	<div id="div2" class="fa"></div>
<script>
	function chargebattery() {
	  var a;
	  a = document.getElementById("div1");
	  a.innerHTML = "&#xf244;";
	  setTimeout(function () {
		  a.innerHTML = "&#xf243;";
		}, 1000);
	  setTimeout(function () {
		  a.innerHTML = "&#xf242;";
		}, 2000);
	  setTimeout(function () {
		  a.innerHTML = "&#xf241;";
		}, 3000);
	  setTimeout(function () {
		  a.innerHTML = "&#xf240;";
		}, 4000);
	}
	chargebattery();
	setInterval(chargebattery, 5000);

	function ratestar() {
		var a;
		a = document.getElementById("div2");
		a.innerHTML = "&#xf006;";
		setTimeout(function () {
			a.innerHTML = "&#xf123;";
			}, 1000);
		setTimeout(function () {
			a.innerHTML = "&#xf005;";
			}, 2000);
	}
	ratestar();
	setInterval(ratestar, 3000);

</script>

</body>
</html>
