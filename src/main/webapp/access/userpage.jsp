<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%--JSTL --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--CSS--%>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/red/css/style1.css" />
<link rel="stylesheet" type="text/css" href="/red/css/index.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<%--JavaScript --%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<script type="text/javascript" src="/red/js/coursehover.js" defer></script>
<%--Rest --%>
<meta charset="UTF-8">
<title>Personal Page</title>
</head>



<body>

	<div id="top">
		<a href='/red/index.jsp'><img id='logo' src='/red/img/logo.png'></a>
		<div class="topright">
			<div class="row">
				<!-- modificare stile -->
				<a href='/red/access/userpage.jsp'>Welcome, ${myUser.userName}
					&nbsp; </a>
			</div>
			<div class="row">
				<a href='/red/access/Logout'><button class='btn logaccbtn m-1'
						type='button'>
						<span class="m-2">LOG OUT</span>
					</button></a>
			</div>
		</div>
	</div>


	<hr>
	<div class="row menu">
		<div class="col-sm">
			<a class='menu' data-toggle="tooltip" title="Courses"
				href="#MyCourses">My Courses</a>
		</div>
		<div class="col-sm">
			<a class='menu' data-toggle="tooltip" title="Instructors"
				href="#explore">Explore</a>
		</div>
		<div class="col-sm">
			<a class='menu' data-toggle="tooltip" title="Contacts"
				href="#contact">Contacts</a>
		</div>
	</div>
	<hr>

	<br>

	<div id='MyCourses' class="script">
		<h2 class="text-center text-danger text-bold">My Courses</h2>
		<hr class='hr1'>
		<br>
		<table class="table" id="tableofcourses">
			<!-- 		 <thead class="thead-light"> -->
			<!-- 			<tr> -->
			<!-- 				<th scope="col">#</th> -->
			<!-- 			</tr> -->
			<!-- 		</thead> -->
			<tbody>
				<c:forEach var="course" items="${myCourses}">
					<tr id='courserow' class="">
						<td
							onclick="location='UserCourses?courseName=${course.courseName}'">
							${course.courseName}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
	<br>

	<div id="manageCourses" class="script">
		<h2 class="text-center text-danger text-bold">Manage Courses</h2>
		<hr class='hr1'>
		<br>
		<p>Scegli la categoria per scegliere i corsi ai quali iscriverti:</p>
<!-- 		<div class="dropdown show"> -->
<!-- 			<a class="btn btn-secondary dropdown-toggle" href="#" role="button" -->
<!-- 				id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" -->
<!-- 				aria-expanded="false"> Course Category </a>  -->
				
			<select name="category">
				<c:forEach var="catergory" items="${allCategories}">
					<option>${category.categoryName}</option>
				</c:forEach>
			</select>
			
<!-- 			<div class="dropdown-menu" aria-labelledby="dropdownMenuLink"> -->
<%-- 				<c:forEach var="catergory" items="${allCategories}"> --%>
<!-- 					<a class="dropdown-item" -->
<%-- 						href="CourseCategory?choice=${category.categoryName}"> --%>
<%-- 						${category.categoryName}</a> --%>
<%-- 				</c:forEach> --%>
<!-- 			</div> -->
		</div>

		<br>

		<c:if test="${param.choice != null}">
			<c:if test="${newCourses.size() != 0}">
				<table class="table" id="tableofcourses">
					<thead class="thead-light">
						<tr>
							<th scope="col">New Courses</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="course" items="${newCourses}">
							<tr id='courserow' class="">
								<td>${course.courseName}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>

			<c:if test="${oldCourses.size() != 0}">
				<table class="table" id="tableofcourses">
					<thead class="thead-light">
						<tr>
							<th scope="col">Old Courses</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="course" items="${oldCourses}">
							<tr id='courserow' class="">
								<td>${course.courseName}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>

		</c:if>

	</div>

	<br>


	<hr>
	<br>

	<div id="contact" class='text-white text-center'>
		<h5>Contacts</h5>
		<p>
			tel:<a href="tel:+39/3492464512">+39/3492464512</a>&emsp; &mdash;
			&emsp;E-mail address: <a href="mailto:info@fitnett.com">info@fitnett.com</a>
		</p>
	</div>
	<hr>
	<div class='text-center'>
		<a href="/red/index.jsp">Back to homepage</a>
	</div>

</body>
</html>