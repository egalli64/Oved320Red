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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<%--JavaScript --%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
<a href='/red/index.jsp'><img id='logo' data-toggle="tooltip" title="&nbsp; &nbsp; &nbsp; &nbsp; FitNett &NewLine; Don't Sit, Get Fit!" src='/red/img/logo.png'></a>
	<c:if test = '${myUser.userName == null}'>	
		<a href='/red/access/Login.jsp'><button data-toggle="tooltip" title="Login" class='btn logbt' type='button'>LOGIN</button></a>
	</c:if>
	<c:if test = '${myUser.userName != null}'>
		<div class="topright">
			<div class="row">
				<a class='link1' href='/red/access/userpage.jsp'>Welcome, ${myUser.userName}!</a>
				</div>
				<div class="row">
				<a href='/red/access/Logout'><button class='btn logaccbtn m-1' type='button'>
						<span class="m-2">LOGOUT</span>
					</button></a>
			</div>
		</div>
	</c:if>
</div>



<div class="icon-bar">
  <a href="#" data-toggle="tooltip" title="Login with Facebook" class="facebook"><i class="fa fa-facebook"></i></a>
  <a href="#" data-toggle="tooltip" title="Click 100 times to Win a...strong finger!" class="twitter"><i class="fa fa-twitter"></i></a>
</div>
<hr>
	<div class='container'>
		<div class="row menu">
			<div class="col-sm">
				<a class='menu1' data-toggle="tooltip" title="Courses"
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

	<div class='script text-center'>
		<h2 class="text-center text-danger text-bold">Explore</h2>
		<hr class='hr1'>
		<br>
		<p>Scegli la categoria per scegliere i corsi ai quali iscriverti:</p>

		<div class="row">
			<div class="col-sm-4"></div>
			<div class="col-sm-4 dropdown show text-center">
				<a class="btn btn-secondary btn-lg btn-block"
					onclick="allCategories();" role="button" aria-haspopup="true"
					aria-expanded="false">Categories</a> <br>
			</div>
			<div class="col-sm-4"></div>

		</div>

		<div class="row">
			<div class="col-sm-4"></div>
			<div class="col-sm-4 dropdown show text-center">
				<div id="categories"></div>
			</div>
			<div class="col-sm-4"></div>

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

    <script>
    function allCourses(){
        $.getJSON("/red/menu/AllCoursesMenu", function(coursesList){
            var ul = $("<ul>").appendTo($("#courses"));
            $.each(coursesList, function(index, item) {
                $("<li>").text(item.courseName).appendTo(ul);
            })
        });
    }
    </script>	
    
    
    <script>
    function allCategories(){
        $.getJSON("/red/menu/AllCategoriesMenu", function(categoriesList){
            console.log(categoriesList);
            var ul = $("<div>").appendTo($("#categories"));
            $.each(categoriesList, function(index, item) {
            $("<button type='button' onclick = 'allCourses();' name = 'choice' value = " + item.categoryName + " class='btn btn-danger btn-lg btn-block'>").text(item.categoryName).appendTo(ul);
            })
        });
    }
    </script>

</body>