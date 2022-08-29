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
<title>Reviews</title>
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

	<h1 class="display-4 text-center mt-2">Reviews</h1>
	<c:choose>
		<c:when test="${logged != null }">
			<a href="/review/add" class="btn btn-secondary">Add a Review</a>
		</c:when>
		<c:otherwise>
			<h5 class="text-center display-6">To add a review, please log in!</h5>
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${reviewList.size() == 0 }">
			<h5 class="text-center">There are no current reviews</h5>
		</c:when>
		<c:otherwise>
		<div class="mt-5">
			<c:forEach var="eachReview" items="${reviewList }">
				<div class="d-flex justify-content-around shadow-lg p-3 mb-5 bg-white rounded">
					<div>
					
						<h1><c:out value="${eachReview.reviewer.firstName }"/></h1>
						<h6>Project completed on <fmt:formatDate type="date" pattern="MMMM dd, yyyy" value="${eachReview.completionDate}"/></h6>
						<h5>Comments:</h5>
						<h6 class="m-3"><c:out value="${eachReview.comment }"/></h6>
						<c:if test="${logged.id == eachReview.reviewer.id || logged.id == 1}">
							<div class="d-flex m-5">
								<a href="/review/edit/${eachReview.id }" class="btn btn-secondary me-2">Edit Review</a>
								<form method="post" action="/review/delete/${eachReview.id }">
									<input type="hidden" name="_method" value="delete"/>
									<button type="submit" class="btn btn-secondary">Delete</button>
								</form>
							</div>
						</c:if>
					</div>
					<div>
						<h4>Rating given (1-5):  <c:out value="${eachReview.rating }"/></h4>
						<img src="<c:out value="${eachReview.imgURL }"/>" alt="img couldnt load" width="250px" class="m-2"/>
					</div>
				</div>
			</c:forEach>
		</div>
		</c:otherwise>
	</c:choose>
	</div>
</div>
</body>
</html>