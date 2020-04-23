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


		<div  id="top">
			<a href='/red/index.jsp'><img id='logo' data-toggle="tooltip"
				title="&nbsp; &nbsp; &nbsp; &nbsp; FitNett &NewLine; Don't Sit, Get Fit!"
				src='/red/img/logo.png'></a>
			<c:if test='${myUser.userName == null}'>
				<a href='/red/access/Login.jsp'><button data-toggle="tooltip"
						title="Login" class='btn logbt' type='button'>LOGIN</button></a>
			</c:if>
			<c:if test='${myUser.userName != null}'>
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
			</c:if>
		</div>

	<div class="icon-bar">
		<a href="" data-toggle="tooltip" title="Login with Facebook"
			class="facebook"><i class="fa fa-facebook"></i></a> <a href=""
			data-toggle="tooltip" title="Login with Twitter" class="twitter"><i
			class="fa fa-twitter"></i></a>
	</div>
	<!-- <div class="fixed-bottom"> -->
	<!-- 	<a href="'./access/Login.jsp'" data-toggle="tooltip" title="Login with Facebook" class="fa fa-facebook"></a> -->
	<!--   	<a href="#" data-toggle="tooltip" title="Click 100 times to ... fit your finger!" class="fa fa-twitter"></a>	 -->


	<!-- </div> -->

	<hr>
	<div class='container'>
		<div class="row menu">
			<div class="col-sm">
				<a class='menu' data-toggle="tooltip" title="Courses"
					href="/red/menu/courses.jsp">Courses</a>
			</div>
			<div class="col-sm">
				<a class='menu' data-toggle="tooltip" title="Instructors"
					href="/red/menu/instructors.jsp">Instructors</a>
			</div>
			<div class="col-sm">
				<a class='menu' data-toggle="tooltip" title="How to Join"
					href="/red/menu/howTo.jsp">How to join</a>
			</div>
			<div class="col-sm">
				<a class='menu' data-toggle="tooltip" title="Contacts"
					href="#contact">Contacts</a>
			</div>
		</div>
	</div>
	<hr>

	<br>
	<br>


	<div id="demo" class="carousel slide" data-ride="carousel">
		<ul class="carousel-indicators">
			<li data-target="#demo" data-slide-to="0" class="active"></li>
			<li data-target="#demo" data-slide-to="1"></li>
			<li data-target="#demo" data-slide-to="2"></li>
			<li data-target="#demo" data-slide-to="3"></li>
			<li data-target="#demo" data-slide-to="4"></li>
			<li data-target="#demo" data-slide-to="5"></li>
			<li data-target="#demo" data-slide-to="6"></li>
		</ul>

		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="/red/img/classic-dance-2079980_1920.jpg"
					data-toggle="tooltip" title="Ballet" alt="Danza" width="500"
					height="500">
				<div class="carousel-caption">
					<h3>Ballet</h3>
				</div>
			</div>
			<div class="carousel-item">
				<img src="/red/img/sport-2250970_1920.jpg" data-toggle="tooltip"
					title="Gag" alt="un bella gnocca" width="500" height="500">
				<div class="carousel-caption">
					<h3>Gag</h3>
				</div>
			</div>
			<div class="carousel-item">
				<img src="/red/img/young-woman-2699780_1920.jpg"
					data-toggle="tooltip" title="Yoga" alt="Yoga" width="500"
					height="500">
				<div class="carousel-caption">
					<h3>Yoga</h3>
				</div>
			</div>
			<div class="carousel-item">
				<img src="/red/img/box-1514845_1920.jpg" data-toggle="tooltip"
					title="Boxe" alt="Boxe" width="500" height="500">
				<div class="carousel-caption">
					<h3>Boxe</h3>
				</div>
			</div>
			<div class="carousel-item">
				<img src="/red/img/karate-1665747_1920.jpg" data-toggle="tooltip"
					title="Martial Arts" alt="Arti Marziali" width="500" height="500">
				<div class="carousel-caption">
					<h3>Martial Arts</h3>
				</div>
			</div>
			<div class="carousel-item">
				<img src="/red/img/crossfit-534615_1920.jpg" data-toggle="tooltip"
					title="Crossfit" alt="da sposare" width="500" height="500">
				<div class="carousel-caption">
					<h3>Crossfit</h3>
				</div>
			</div>
			<div class="carousel-item">
				<img src="/red/img/shoes-5015809_1920.jpg" data-toggle="tooltip"
					title="Aerobic"
					alt="fa sport con le nike che si illumina e i risvoltini..."
					width="500" height="500">
				<div class="carousel-caption">
					<h3>Aerobic</h3>
				</div>
			</div>


		</div>
		<a class="carousel-control-prev" href="#demo" data-slide="prev"> <span
			class="carousel-control-prev-icon"></span>
		</a> <a class="carousel-control-next" href="#demo" data-slide="next">
			<span class="carousel-control-next-icon"></span>
		</a>
	</div>
	<br>
	<br>

	<div class="script">
		<h2 class="text-center text-danger text-bold">Who we are</h2>
		<hr class='hr1'>
		<br>
		<p>Welcome FitNett World</p>

	</div>

	<br>
	<br>
	<hr>
	<br>

	<div id="contact" class='text-white text-center'>
		<h5>Contacts</h5>
		<p>
			tel:<a class='link1' href="tel:+39/3492464512">+39/3492464512</a>&emsp;
			&mdash; &emsp;E-mail address: <a class='link1'
				href="mailto:info@fitnett.com">info@fitnett.com</a>
		</p>
	</div>


</body>
</html>