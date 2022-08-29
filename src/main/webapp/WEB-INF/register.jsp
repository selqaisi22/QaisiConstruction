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
<title>Register</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
<div>
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
	<div class="m-5 shadow-lg p-5 mb-5 bg-white rounded">
		<h1 class="display-4 text-center">Register</h1>
		<form:form action="/register" method="post" modelAttribute="newUser">
			<div class="form-group">
				<label>First Name</label>
				<form:input path="firstName" class="form-control" />
				<form:errors path="firstName" class="text-danger" />
			</div>
			<div class="form-group">
				<label>Last Name</label>
				<form:input path="lastName" class="form-control" />
				<form:errors path="lastName" class="text-danger" />
			</div>
			<div class="form-group">
				<label>Email:</label>
				<form:input path="email" class="form-control" />
				<form:errors path="email" class="text-danger" />
			</div>
			<div class="form-group">
				<label>Password:</label>
				<form:password path="password" class="form-control" />
				<form:errors path="password" class="text-danger" />
			</div>
			<div class="form-group">
				<label>Confirm Password:</label>
				<form:password path="confirm" class="form-control" />
				<form:errors path="confirm" class="text-danger" />
			</div>
			<div class="m-4 d-flex justify-content-around">
				<input type="submit" value="Register" class="btn btn-secondary" />
				<a href="/" class="btn btn-secondary">Skip</a>
			</div>
		</form:form>
		</div>
		<h2 class="d-flex justify-content-center display-6 mt-5">Already have an account with us? <a href="/login">Login Here</a></h2>
	</div>
</div>

</body>
</html>