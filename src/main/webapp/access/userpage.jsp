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
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script type="text/javascript" src="../js/coursehover.js" defer></script>
<%--Rest --%>
<meta charset="UTF-8">
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
			<a class='menu' href="#contact">Explore</a>
		</div>
		<div class="col-sm">
			<a class='menu' href="#contact">Contacts</a>
		</div>
	</div>
	<hr>

	<br>
	
	<div class="script">
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
			<c:forEach var="course" items="${userCourses}">
				<tr id='courserow' class="" >
					<td><a href="UserCourses?courseName=${course.courseName}">${course.courseName}</a></td> 
				</tr>
			</c:forEach>
		</tbody>
	</table>

	</div>
	<br>
	<div class="script">
		<h2 class="text-center text-danger text-bold">My Instructors</h2>
		<hr class='hr1'>
		<br>
		<p>call me if you have a problem</p>

	</div>
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
				<a class="dropdown-item" href="#">Aerobica</a> 
				<a class="dropdown-item" href="#">Danza</a> 
				<a class="dropdown-item" href="#">Arti Marziali</a>
				<a class="dropdown-item" href="#">Powerlifting</a>
			</div>
		</div>
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