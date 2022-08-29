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
<title>All Surveys</title>
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
	<h1 class="display-4 text-center mt-2">All Surveys</h1>
	<c:choose>
		<c:when test="${surveyList.size() == 0 }">
			<h5 class="text-center display-6">There are no surveys posted</h5>
		</c:when>
		<c:otherwise>
			<div>
				<form method="post" action="/survey/deleteAll">
					<input type="hidden" name="_method" value="delete"/>
					<button type="submit" class="btn btn-secondary mb-3">Clear Survey List</button>
				</form>
				<c:forEach var="eachSurvey" items="${surveyList }">
					<div class="d-flex justify-content-around shadow-lg p-3 mb-5 bg-white rounded">
						<div>
							<h3 class="border-dark border-bottom">Project Number: <c:out value="${eachSurvey.projectNum }"/></h3>
							<br/>
							<ul class="list-group">
								<li class="list-group-item">How did you find us? <c:out value="${eachSurvey.findUs }"/></li>

								<li class="list-group-item">Was the project completed on time? 
								<c:choose>
									<c:when test="${eachSurvey.completedOnTime == true}">
											<h6>Yes</h6>
									</c:when>
									<c:otherwise>
										<h6>No</h6>
									</c:otherwise>
								</c:choose>
								</li>
								<li class="list-group-item">Satisfaction Rating (1-5): <c:out value="${eachSurvey.satisfied }"/></li>
								<li class="list-group-item">Feedback: <c:out value="${eachSurvey.feedback }"/></li>
							</ul>
							
						</div>	
						<div>
							<div class="m-5">
								<div>
									<h5>Date posted: <fmt:formatDate type="date" pattern="MMMM dd, yyyy" value="${eachSurvey.createdAt}"/></h5>
								</div>
								<form method="post" action="/survey/deleteOne/${eachSurvey.id }" >
									<input type="hidden" name="_method" value="delete"/>
									<button type="submit" class="btn btn-secondary mt-5">Delete</button>
								</form>
								
							</div>	
						</div>
					</div>
				</c:forEach>
			</div>
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>