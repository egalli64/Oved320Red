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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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
<script type="text/javascript" src="/red/js/coursehover.js" defer></script>
<%--Rest --%>
<meta charset="UTF-8">
<title>Personal Page</title>
</head>


<body>

	<div id="top">
		<a href='/red/index.jsp'><img id='logo' data-toggle="tooltip"
			title="&nbsp; &nbsp; &nbsp; &nbsp; FitNett &NewLine; Don't Sit, Get Fit!"
			src='/red/img/logo.png'></a>
		<div class="topright">
			<div class="row">
				<a class='link1' href='/red/access/userpage.jsp'>Welcome,
					${myUser.userName}!</a>
			</div>
			<div class="row">
				<a href='/red/access/Logout'><button class='btn logaccbtn m-1'
						type='button'>
						<span class="m-2">LOGOUT</span>
					</button></a>
			</div>
		</div>
	</div>

	<hr>
	<div class='container'>
	<div class="row menu">
		<div class="col-sm">
			<a class='menu' data-toggle="tooltip" title="Courses"
				href="/red/access/userpage.jsp#MyCourses">My Courses</a>
		</div>
		<div class="col-sm">
			<a class='menu' data-toggle="tooltip" title="Manage your courses"
				href="/red/access/userpage.jsp#manageCourses">Manage courses</a>
		</div>
		<div class="col-sm">
			<a class='menu' data-toggle="tooltip" title="Personal account"
				href="/red/loggedin/myAccount.jsp">My account</a>
		</div>
		<div class="col-sm">
			<a class='menu' data-toggle="tooltip" title="Contacts"
				href="#contact">Contacts</a>
		</div>
	</div>
	</div>
	<hr>


	<div class="script">
		<h2 class="text-center text-danger text-bold ">${param.courseName}
		</h2>
		<h2 class="text-center text-danger text-bold ">Lesson ${param.id}
		</h2>
		<hr class='hr1'>

		<br>
		<div class="embed-responsive embed-responsive-16by9">
			<iframe width="560" height="315" src="${param.url}" frameborder="0"
				allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
				allowfullscreen></iframe>
		</div>
		<br>
		<hr class='hr1'>

		<div class='text-center'>
			<p>
				<i>Instructor:</i> ${param.instructorName} ${param.instructorLast}
			<p>
			<p>
				<i>Email: </i><a href="mailto:${param.instructorEmail}">${param.instructorEmail}</a>
			</p>
			<p>
				<i>Role: </i>${param.instructorJobID}
			</p>
		</div>
		<hr class='hr1'>
		<br>

		<div class='text-center'>
			<a href="/red/access/UserCourses?courseName=${param.courseName}"><button
					type="button" class="btn btn-outline-danger text-center">Back
					to ${param.courseName}</button></a>
		</div>
	</div>
	<br>
    <hr>
	<div id="contact" class='text-white container-fluid text-center'>
		<h5>Contacts</h5>
		<div class="row">
			<div class="col-sm-5 text-right">
				tel: <a class='link1' href="tel:+39/3492464512"> +39/ 3492464512
				</a>
			</div>
			<div class="col-sm-2 text-center">&mdash;</div>
			<div class="col-sm-5 text-left">
				e-mail address: <a class='link1' href="mailto:info@fitnett.com">
					info@fitnett.com</a>
			</div>
		</div>
	</div>
	<hr>
	<div class='text-white container-fluid text-center'>
		<div class="row">
			<div class='col-sm-6 text-right'>
				<a class='link1' href="#top"><i>Back to Top</i></a>
			</div>
			<div class='col-sm-6 text-left'>
				<a class='link1' href="/red/index.jsp"><i>Back to Home</i></a>
			</div>
		</div>
	</div>
	<br>

</body>
</html>