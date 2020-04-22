<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../css/style1.css" />
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<meta charset="UTF-8">
<title>Login</title>
</head>

<body>
	<div id="top">
		<a href='/red/index.jsp'><img id='logo' src='/red/img/logo.png'></a>
	</div>
	
	<c:if test='${returnError != null}'>
		<div class="warning">
			<hr class="hr1">
			<p>${returnError}</p>
			<hr class="hr1">
		</div>
	</c:if>

	<div class="container m-5">
		<div class="row">

			<div class="col-3"></div>

			<div
				class="col-6 rounded shadow p-3 mb-5 bg-white border border-dark">

				<h5 class='m-3 text-center'>Welcome Back!</h5>
				<div class="row m-3">

					<div class="col-2"></div>
					<div class="col-8">
						<form action='./Login' method='post'>
							<div class="form-group">
								<label for='usrn'> Username </label> <input id='usrn'
									placeholder="Enter Username" name='usrn' required
									class="form-control" value='${userName}'>

							</div>
							<div class="form-group">
								<label for='pswd'>Password</label> <input type="password"
									id='pswd' placeholder="Password" name='pswd' required
									class="form-control"> <input type="checkbox"
									onclick="toggle()"> <i>Show</i>
							</div>
							<div class='text-center m-3'>
								<button type="submit" class="btn btn-danger">Login</button>
							</div>
						</form>
						<p>
							<i>Don't have an account? <a class='reglink'
								href="/red/access/Register.jsp">Register here</a></i>
						</p>
						<div>
							<a class="reglink" href="/red/index.jsp"><i>Back to Home</i></a>
							<a class="reglink" href="/red/space.jsp"><i>Back to Space</i></a>
						</div>

						<!-- Back to homepage -->

					</div>
					<div class="col-2"></div>
				</div>

			</div>

			<div class="col-3"></div>
		</div>
	</div>


	<!-- 	va spostato in un documento javascript -->
	<script>
		function toggle() {
			var temp = document.getElementById("pswd");
			if (temp.type === "password") {
				temp.type = "text";
			} else {
				temp.type = "password";
			}
		}
	</script>
</body>
</html>