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

	<c:if test="${errorUn == null}">
		<div class='container' id='userName1'>
			<div class="container-fluid">
				<div class="row">
					<div class="col-3 align-middle">Username:</div>
					<div class="col-auto align-middle">${myUser.userName}</div>
					<div class='col-auto align-middle'>
						<button type="button" onclick="showHide('userName1', 'userName2')"
							class="btn btn-outline-danger">Modify Username</button>
					</div>
				</div>
			</div>
		</div>
		<div class='container'>
			<div id='userName2' style="display: none">
				<br>
				<form action='UpdateUser?control=un' method='post'>
					<div class="form-group row">
						<label for="userName" class="col-3 col-form-label">Username:</label>
						<div class="col">
							<input id='userName' value='${myUser.getUserName()}'
								name='userName' required class="form-control">
						</div>
						<div class='col-auto'>
							<button type="submit" class="btn btn-outline-danger">Submit</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</c:if>

	<c:if test='${errorUn != null}'>
		<div class='container'>
			<br>
			<p>${errorUn}</p>
			<form action='UpdateUser?control=un' method='post'>
				<div class="form-group row">
					<label for="userName" class="col-3 col-form-label">Username:</label>
					<div class="col">
						<input id='userName' value='${myUser.getUserName()}'
							name='userName' required class="form-control">
					</div>
					<div class='col-auto'>
						<button type="submit" class="btn btn-outline-danger">Submit</button>
					</div>
				</div>
			</form>
		</div>
			</c:if>
</body>
</html>