<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Service</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
<div class="m-5">
	<div class="d-flex justify-content-between align-items-center">
		<div class="d-flex align-items-center">
			<img src="http://providerhealthcare.com/wp-content/uploads/2020/06/Permanent-Placement.png" alt="icon" width="80px"/>
			<h1 class="display-1 me-5">Qaisi Construction</h1>
		</div>
		<div class="text-secondary">
			<h5>Hours:</h5>
			<h6>Mon-Fri, 8:00AM - 7:00PM</h6>
		</div>
		
	</div>
	<div class="d-flex border-bottom">
		<a href="/" class="text-decoration-none m-2 text-secondary">Home</a>
		<a href="/about" class="text-decoration-none m-2 text-secondary">About</a>
		<a href="/service" class="text-decoration-none m-2 text-secondary">Service</a>
		<a href="/review" class="text-decoration-none m-2 text-secondary">Review</a>
		<a href="/survey/add" class="text-decoration-none m-2 text-secondary">Survey</a>
		<c:if test="${logged.id == 1 }">
			<a href="/surveys" class="text-decoration-none m-2 text-secondary">View Surveys</a>
		</c:if>
		<c:choose> 
			<c:when test="${logged == null }">
				<a href="/register" class="text-decoration-none m-2 text-secondary">Register</a>
				<a href="/login" class="text-decoration-none m-2 text-secondary">Login</a>
			</c:when>
			<c:otherwise>
				<a href="/logout" class="text-decoration-none m-2 text-secondary">Logout</a>
			</c:otherwise>
		</c:choose>
	</div>
	<h1 class="display-3 text-center mt-2">Services</h1>
	<div class="bg-image p-5 text-center shadow-1-strong rounded mb-5 text-white" 
	style="background-image: url('https://thumbs.dreamstime.com/b/wide-banner-illustration-buildings-under-construction-process-63922393.jpg'); min-height: 600px;" >
		<h1 class="display-4 text-center mt-2 bg-light rounded text-dark">Interior OR Exterior</h1>
		<div class="d-flex justify-content-center align-items-center m-5 p-5">
			<ul class="list-group list-group-flush me-3">
				<li class="list-group-item display-6 rounded">Painting</li>
				<li class="list-group-item display-6 rounded">Plumbing</li>
				<li class="list-group-item display-6 rounded">Kitchen</li>
				<li class="list-group-item display-6 rounded">Bathroom</li>
			</ul>
			<ul class="list-group list-group-flush">
				<li class="list-group-item display-6 rounded">Siding</li>
				<li class="list-group-item display-6 rounded">Windows</li>
				<li class="list-group-item display-6 rounded">Roofing</li>
				<li class="list-group-item display-6 rounded">Landscaping</li>
			</ul>
		</div>
	</div>
	
	
	
</div>
</body>
</html>