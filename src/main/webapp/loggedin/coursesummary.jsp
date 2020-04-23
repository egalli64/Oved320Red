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
	<hr>

	<div class="script">
		<h2 class="text-center text-danger text-bold ">My " ${courseName}
			" Lessons</h2>
		<hr class='hr1'>
		<br>
		<table class="table align-center" id="tableofcourses">
			<thead class="thead-light">
				<tr>
					<th scope="col">Lesson Name</th>
					<th scope="col">Instructor</th>
					<th scope="col">Link to video</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="i" begin="1" end="${courseLessons.size()}">
					<tr>
						<td class="align-middle">Lesson ${i}</td>
						<td class="align-middle" >${instructors.get(i-1).firstName}
							${instructors.get(i-1).lastName} <br> <i>Email: </i><a
							href="mailto:${instructors.get(i-1).email}">${instructors.get(i-1).email}</a>
							<br> <i>Role: </i> ${instructors.get(i-1).jobID}
						</td>
						<c:url value="../loggedin/singlelesson.jsp" var="lessonpage">
							<c:param name="courseName" value="${courseName}" />
							<c:param name="id" value="${i}" />
							<c:param name="url" value="${courseLessons.get(i-1).URL}" />
							<c:param name="instructorName"
								value="${instructors.get(i-1).firstName}" />
							<c:param name="instructorLast"
								value="${instructors.get(i-1).lastName}" />
							<c:param name="instructorEmail"
								value="${instructors.get(i-1).email}" />
							<c:param name="instructorJobID"
								value="${instructors.get(i-1).jobID}" />
						</c:url>
						<td class="align-middle"><a href="${lessonpage}"> <%-- 							href="../loggedin/singlelesson.jsp?id=${i}?url=${courseLessons.get(i-1).URL}?instructorName=${instructors.get(i-1).firstName}?instructorLast=${instructors.get(i-1).lastName}"> --%>
								<button type="button" class="btn btn-outline-danger">Start
									Lesson Now!</button>
						</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
			<br>
	<a href='/red/access/userpage.jsp'><button type="button"
			class="btn btn-outline-danger text-center">Back to my page</button></a>
			
			
	</div>

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