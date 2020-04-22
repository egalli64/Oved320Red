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
		<!-- 		<div class="col-sm"> -->
		<!-- 			<a class='menu' href="#MyINstructor">My Instructors</a> -->
		<!-- 		</div> -->
		<div class="col-sm">
			<a class='menu' href="#contact">Explore</a>
		</div>
		<div class="col-sm">
			<a class='menu' href="#contact">Contacts</a>
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
						<td>Lesson ${i}</td>
						<td>${instructors.get(i-1).firstName}
							${instructors.get(i-1).lastName} <br> <i>email:</i>
							${instructors.get(i-1).email} <br> <i>Role:</i>
							${instructors.get(i-1).jobID}
						</td>
						<c:url value="../loggedin/singlelesson.jsp" var="lessonpage">
							<c:param name="id" value="${i}" />
							<c:param name="pippo" value="${courseLessons.get(i-1).URL}" />
							<c:param name="instructorName" value="${instructors.get(i-1).firstName}" />
							<c:param name="instructorLast" value="${instructors.get(i-1).lastName}" />
						</c:url>
						<td><a href="${lessonpage}">
<%-- 							href="../loggedin/singlelesson.jsp?id=${i}?url=${courseLessons.get(i-1).URL}?instructorName=${instructors.get(i-1).firstName}?instructorLast=${instructors.get(i-1).lastName}"> --%>
								<button type="button" class="btn btn-outline-danger">Start
									Lesson Now!</button>
						</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
</body>
</html>