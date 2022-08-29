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
<title>Edit Review</title>
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
	<h1>Edit Review</h1>
	<div>
		<form:form action="/review/edit/${review.id }" method="post" modelAttribute="review">
			<input type="hidden" name="_method" value="put"/>
			<div>
				<form:label path="imgURL">Img Url</form:label>
				<form:input type="text" path="imgURL"/>
				<form:errors path="imgURL"/>
			</div>
			<div>
				<form:label path="completionDate">Project Completed On: </form:label>
				<form:input type="date" path="completionDate"/>
				<form:errors path="completionDate"/>
			</div>
			<div>
				<form:label path="rating">Rating (1-5): </form:label>
				<form:input type="number" min="1" max="5" path="rating"/>
				<form:errors path="rating"/>
			</div>
			<div>
				<form:label path="comment">Comments: </form:label>
				<form:input type="textbox" path="comment"/>
				<form:errors path="comment"/>
			</div>
			<form:hidden path="reviewer" value="${userId }"/>
			<button type="submit" class="btn btn-secondary">Submit</button>
		</form:form>
	</div>
</div>
</body>
</html>