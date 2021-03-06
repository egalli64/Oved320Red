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
	<div>
			<div id='personal1'>
				<div class='text-right'>
					<button type="button" onclick="showHide('personal1', 'personal2')"
						class="btn btn-outline-danger">Modify personal
						informations</button>
				</div>
				<div class='container-fluid'>
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

			<div id='personal2' style="display: none">

				<br>
				<form action='UpdateUser?control=psn' method='post'>
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
							<input id='birthdate' type="date"
								value='${myUser.getBirthDate()}' name='birthDate' required
								class="form-control">
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
					</div>
				</form>
			</div>
		</div>

</body>
</html>