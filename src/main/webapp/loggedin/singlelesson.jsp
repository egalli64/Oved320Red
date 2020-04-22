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
<link rel="stylesheet" type="text/css" href="../css/style1.css" />
<link rel="stylesheet" type="text/css" href="../css/index.css" />
<%--JavaScript --%>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<%--Rest --%>
<meta charset="UTF-8">
<title>Personal Page</title>
</head>
<body>
	<div id="top">
		<a href='../index.html'><img id='logo' src='../img/logo.png'></a>
		<div class="topright">
			<div class="row">
				<a href='.....'><button class='btn logaccbtn m-1' type='button'>My
						Account</button></a>
			</div>
			<div class="row">
				<a href='.....'><button class='btn logaccbtn m-1' type='button'>
						<span class="m-2">LOG OUT</span>
					</button></a>
			</div>
		</div>
	</div>

<hr>
<div class="row menu">
	<div class="col-sm">
		<a class='menu' data-toggle="tooltip" title="Courses" href="../access/userpage.jsp#MyCourses">My Courses</a>
	</div>
	<div class="col-sm">
		<a class='menu' data-toggle="tooltip" title="Instructors" href="../access/userpage.jsp#explore">Explore</a>
	</div>
	<div class="col-sm">
		<a class='menu' data-toggle="tooltip" title="Contacts" href="#contact">Contacts</a>
	</div>
</div>
<hr>

<!-- non salva informazioni, si usa la session? -->

	<div class="script">
		<h2 class="text-center text-danger text-bold ">${param.courseName} </h2>
		<h2 class="text-center text-danger text-bold ">Lesson ${param.id} </h2>
		<hr class='hr1'>
		
		<br>
		<%-- 		<a href="${param.pippo}"> Click here!! </a> --%>
		<div class="embed-responsive embed-responsive-16by9">
			<iframe width="560" height="315"
				src="${param.url}" frameborder="0"
				allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
				allowfullscreen></iframe>
		</div>
		<br>
		<hr class='hr1'>
		
		<div class='text-center'>
		<h5>
			<i>Instructor:</i> ${param.instructorName} ${param.instructorLast}
		</h5>
		<br>
		<p><i>Email: </i><a href="mailto:${param.instructorEmail}">${param.instructorEmail}</a></p>
		<p><i>Role: </i>${param.instructorJobID} </p>
		</div>

	</div>

<br>
<br>

<div id="contact" class='text-white text-center'>
	<h5>Contacts</h5>
	<p >
		tel:<a href="tel:+39/3492464512">+39/3492464512</a>&emsp; &mdash; &emsp;E-mail
		address: <a href="mailto:info@fitnett.com">info@fitnett.com</a>
	</p>
</div>

</body>
</html>