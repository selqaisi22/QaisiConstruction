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
<title>New Survey</title>
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
	<h1 class="display-4 text-center mt-2">Survey</h1>
	<div class="m-5 shadow-lg p-3 mb-5 bg-white rounded">
		<form:form action="/survey/add" method="post" modelAttribute="survey">
			<div class="mb-2">
				<form:label path="projectNum" class="col-form-label"> Project Number </form:label>
				<form:input type="number" path="projectNum" class="form-control"/>
				<form:errors path="projectNum" />
			</div>
			<div class="mb-2">
				<form:label path="findUs" class="col-form-label"> How did you find us? </form:label>
				<form:input type="text" path="findUs" class="form-control"/>
				<form:errors path="findUs" />
			</div>
			<div class="mb-2">
				<form:label path="completedOnTime" class="col-form-label"> Was the project completed on time? </form:label>
				<form:checkbox path="completedOnTime" />
				<form:errors path="completedOnTime" />
			</div>
			<div class="mb-2">
				<form:label path="satisfied" class="col-form-label"> How satisfied are you on a scale of 1-5?</form:label>
				<form:input type="number" min="1" max="5" path="satisfied" class="form-control"/>
				<form:errors path="satisfied" />
			</div>
			<div class="mb-2">
				<form:label path="feedback" class="col-form-label"> Feedback</form:label>
				<form:input type="textbox" path="feedback" class="form-control"/>
				<form:errors path="feedback" />
			</div>
			<form:hidden path="surveyor" value="${userId }"/>
			<button type="submit" class="btn btn-secondary mt-3">Submit Survey</button>
		</form:form>
	</div>
	
	
	
	
</div>
</body>
</html>