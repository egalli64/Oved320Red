<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../css/style1.css" />
<link rel="stylesheet" type="text/css" href="../css/index.css" />


<title>Personal Page</title>


</head>
<body>


	<div id="top">
		<img id='logo' src='../img/logo.png'>
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
			<a class='menu' href="#MyCourses">My Courses</a>
		</div>
		<div class="col-sm">
			<a class='menu' href="#MyINstructor">My Instructors</a>
		</div>
		<div class="col-sm">
			<a class='menu' href="#contact">Contacts</a>
		</div>
	</div>
	<hr>

	<br>
	<br>
	<div class="script">
		<h2 class="text-center text-danger text-bold">Explore</h2>
		<hr class='hr1'>
		<br>
		<p>Scegli la categoria per scegliere i corsi ai quali iscriverti:</p>
		<div class="dropdown">
			<button class="btn btn-danger dropdown-toggle" type="button"
				id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false">Course Category</button>
			<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
				<a class="dropdown-item" href="#">Danza Classica </a> 
				<a class="dropdown-item" href="#">Danza Contemporanea</a> 
				<a class="dropdown-item" href="#">Boxe</a>
				<a class="dropdown-item" href="#">Funzionale</a>
				<a class="dropdown-item" href="#">GAG</a>
			</div>
		</div>
		
	</div>

	<br>
	<div class="script">
		<h2 class="text-center text-danger text-bold">My Courses</h2>
		<hr class='hr1'>
		<br>
		<p>cosa hai pagato</p>

	</div>
	<br>
	<div class="script">
		<h2 class="text-center text-danger text-bold">My Instructors</h2>
		<hr class='hr1'>
		<br>
		<p>call me if you have a problem</p>

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

</body>
</html>