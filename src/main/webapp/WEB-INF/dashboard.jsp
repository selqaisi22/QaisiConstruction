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
<title>Dashboard</title>
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
		<a href="/service" class="text-decoration-none m-2 text-secondary">Services</a>
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
	<h2 class="display-6 text-center mt-5 border-bottom border-top">Your home is one of your biggest investments, be confident in the decisions you make with the help of Qaisi Construction.</h2>
	<div style="display: flex; justify-content: center; ">
		<div class="m-5 mt-0 p-5" style="">
			<div>
				<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
				  <ol class="carousel-indicators">
				    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
				    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				  </ol>
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <img class="border border-dark rounded" style="max-height: 400px" src="https://www.build-review.com/wp-content/uploads/2019/12/construction-2.jpg" alt="First slide">
				    </div>
				    <div class="carousel-item">
				      <img class="border border-dark rounded" style="max-height: 400px" src="https://semperfiexteriors.net/wp-content/uploads/2019/10/Window-Installation.jpg" alt="Second slide">
				    </div>
				    <div class="carousel-item">
				      <img class="border border-dark rounded" style="max-height: 400px" src="https://www.thespruce.com/thmb/NHTawRMHjmB0PsyqnnsA9_mb1wM=/1821x1366/smart/filters:no_upscale()/staircase-design-decor-ideas-5215373-hero-19aed52054f843bda6679a9fb34047a8.jpg" alt="Third slide">
				    </div>
				    <div class="carousel-item">
				      <img class="border border-dark rounded" style="max-height: 400px" src="https://hgtvhome.sndimg.com/content/dam/images/hgtv/fullset/2013/4/29/0/CI-Wilsonart_kitchen-countertop-Florence-Gold.jpg.rend.hgtvcom.1280.960.suffix/1400978253326.jpeg" alt="Third slide">
				    </div>
				    <div class="carousel-item">
				      <img class="border border-dark rounded" style="max-height: 400px" src="https://reaproconstruction.com/wp-content/uploads/2021/06/bathroom-glass-shower-large-mirror-1.jpg" alt="Third slide">
				    </div>
				    <div class="carousel-item">
				      <img class="border border-dark rounded" style="max-height: 400px" src="https://www.fritsjurgens.com/img/asset/YXNzZXRzL3NpdGVzLzEvMjAyMC8wOS8yODIxLWNhc3RsZXdvb2QtZG9vcnMtZXh0ZXJpb3ItcGl2b3QtZG9vci1paS13aXRoLWZyaXRzanVyZ2Vucy1waXZvdC1oaW5nZS1zeXN0ZW0tMS5qcGc=?h=700&s=b39aaaec2630c35e2815493574171b3a" alt="Third slide">
				    </div>
				    <div class="carousel-item">
				      <img class="border border-dark rounded" style="max-height: 400px" src="http://www.globalgardenfriends.com/wp-content/uploads/2015/04/Five-of-the-Worst-Landscaping-Jobs-Made-Easy.png" alt="Third slide">
				    </div>
				    <div class="carousel-item">
				      <img class="border border-dark rounded" style="max-height: 400px" src="https://provenroofing.com/wp-content/uploads/manchester-nj-roofer.jpg" alt="Third slide">
				    </div>
				  </div>
				  <div class="">
					  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
					    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					    <span class="sr-only">Previous</span>
					  </a>
					  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
					    <span class="carousel-control-next-icon" aria-hidden="true"></span>
					    <span class="sr-only">Next</span>
					  </a>
				  </div>  
				</div>
			</div>
		</div>
	</div>
	<div>
		<h3 class="display-6 text-center m-5 mt-0"> If you would like to schedule a consultation or have any questions, please contact us at <a href="">qcontractors@gmail.com</a> or call us at 123-456-7890.</h3>
		
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>



</body>
</html>