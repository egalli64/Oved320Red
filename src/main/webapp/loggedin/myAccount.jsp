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
<script type="text/javascript" src="/red/js/showHide.js" defer></script>
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
			<a class='menu1' data-toggle="tooltip" title="Personal account"
				href="/red/loggedin/myAccount.jsp">My account</a>
		</div>
		<div class="col-sm">
			<a class='menu' data-toggle="tooltip" title="Contacts"
				href="#contact">Contacts</a>
		</div>
	</div>

	<hr>

	<div class="script">
		<h2 class="text-center text-danger text-bold ">-
			${myUser.firstName} ${myUser.lastName} -</h2>
		<hr class='hr1'>
		<br>


		<div class="container">
			<div class="row">
				<div class="col-3">Username:</div>
				<div class="col">${myUser.userName}</div>
			</div>
			<div class="row">
				<div class="col-3">Password:</div>
				<div class="col">****</div>
			</div>
		</div>

		<br>
		<hr class='hr1'>
		<br>

		<div id='hide1'>
			<div class='text-right'>
				<button type="button" onclick="showHide()"
					class="btn btn-outline-danger">Modify personal
					informations</button>
			</div>
			<div class='container'>
				<div class="row">
					<div class="col-3">First Name:</div>
					<div class="col">${myUser.firstName}</div>
				</div>
				<div class="row">
					<div class="col-3">Last Name:</div>
					<div class="col">${myUser.lastName}</div>
				</div>
				<div class="row">
					<div class="col-3">Birth Date:</div>
					<div class="col">${myUser.birthDate}</div>
				</div>
				<div class="row">
					<div class="col-3">E-mail:</div>
					<div class="col">${myUser.email}</div>
				</div>
				<div class="row">
					<div class="col-3">Phone number:</div>
					<div class="col">${myUser.phoneNumber}</div>
				</div>
				<div class="row">
					<div class="col-3">Address:</div>
					<div class="col">${myUser.streetAddress}</div>
				</div>
				<div class="row">
					<div class="col-3">Subscription date:</div>
					<div class="col">${myUser.subscrDate}</div>
				</div>
			</div>
		</div>

		<div id='show1' style="display: none">

			<br>
			<form action='UpdateUser' method='post'>
				<div class="form-group row">
					<label for="firstName" class="col-3 col-form-label">First
						Name:</label>
					<div class="col-9">
						<input id='firstName' value='${myUser.getFirstName()}'
							name='firstName' required class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<label for="lastName" class="col-3 col-form-label">Last
						Name:</label>
					<div class="col-9">
						<input id='lastName' value='${myUser.getLastName()}'
							name='lastName' required class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<label for="birthDate" class="col-3 col-form-label">Birth
						Date:</label>
					<div class="col-9">
						<input id='birthdate' type="date" value='${myUser.getBirthDate()}'
							name='birthDate' required class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<label for="email" class="col-3 col-form-label">E-mail:</label>
					<div class="col-9">
						<input type="email" id='email' value='${myUser.getEmail()}'
							name='email' required class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<label for="phoneNumber" class="col-3 col-form-label">Phone
						number:</label>
					<div class="col-9">
						<input id='phoneNumber' value='${myUser.getPhoneNumber()}'
							name='phoneNumber' required class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<label for="streetAddress" class="col-3 col-form-label">Address:</label>
					<div class="col-9">
						<input id='streetAddress' value='${myUser.getStreetAddress()}'
							name='streetAddress' required class="form-control">
					</div>
				</div>

				<div class="form-group row">
					<div class='col-aauto text-center m-3'>
						<button type="submit" class="btn btn-outline-danger">Submit</button>
					</div>
<!-- 					<div class='col-auto text-center m-3'> -->
<!-- 						<button type="button" onclick="showHide()" -->
<!-- 							class="btn btn-outline-danger">Close</button> -->
<!-- 					</div> -->
				</div>
			</form>
		</div>



	</div>

	<br>
	<br>
	<hr>
	<div id="contact" class='text-white text-center'>
		<h5>Contacts</h5>
		<p>
			tel:<a class='link1' href="tel:+39/3492464512">+39/3492464512</a>&emsp;
			&mdash; &emsp;E-mail address: <a class='link1'
				href="mailto:info@fitnett.com">info@fitnett.com</a>
		</p>
	</div>
	<hr>
	<div class='text-center'>
		<a class='link1' href="/red/index.jsp">Back to homepage</a>
	</div>


</body>
</html>