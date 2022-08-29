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
<title>About</title>
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
	<h1 class="display-3 text-center mt-2">WHO WE ARE</h1>
	<div class="d-flex justify-content-center">
		<div class="bg-image p-5 m-5 mt-2 text-center shadow-1-strong rounded mb-5 text-white" 
		style="background-image: url('https://www.constructionexec.com/assets/site_18/images/article/081219110833.jpg?width=1280'); min-height: 600px; max-width: 1200px;" >
			
			<div class="m-5 mb-3 mt-0 d-flex align-items-center justify-content-around">
				<div >
					<h3 class="text-light font-weight-bold display-6">Qaisi Construction is a family owned business that was founded in 2001 in New Jersey.</h3>
					<h3 class="text-light font-weight-bold display-6">The company started as a local company with a few workers, and quickly grew into a General Contracting & Repair Business. </h3>
					<h3 class="text-light font-weight-bold display-6">Our focus is providing solutions to your problems in the most efficient way possible at an affordable price. </h3>
					<h3 class="text-light font-weight-bold display-6">We have all the tools needed in order to provide the highest level of service with exceptional results.</h3>
					<h3 class="text-light font-weight-bold display-6">Contact Us Today!</h3>
					<h5 class="display-6 mt-5"><a href="">qcontractors@gmail.com</a> | 123-456-7890</h5>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>