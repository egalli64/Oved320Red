<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../css/style1.css" />

<meta charset="UTF-8">
<title>Login NOT successful!</title>
</head>

<body>
<div id="top">
	<a href='../index.html'><img id='logo' src='../img/logo.png'></a>'>
</div>

<div class="warning">
<hr class="hr1">
<p>Login NOT successful! <br> Wrong Username or Password</p>
<hr class="hr1">
</div>

<div class="container m-5">
		<div class="row">

			<div class="col-3"></div>

			<div
				class="col-6 rounded shadow p-3 mb-5 bg-white border border-dark">

				<h5 class='m-3 text-center'>Try again!</h5>
				<div class="row m-3">

					<div class="col-2"></div>
					<div class="col-8">
						<form action='Login' method='post'>
							<div class="form-group">
								<label for='usrn'> Username </label> <input id='usrn'
									value='${userName}' name='usrn' class="form-control">
							</div>
							<div class="form-group">
								<label for='pswd'>Password</label> <input type="password"
									id='pswd' name='pswd' class="form-control">
							</div>
							<div class='text-center m-3'>
								<button type="submit" class="btn btn-danger">Login</button>
							</div>
						</form>
						<p>
							<i>Don't have an account? <a class='reglink'
								href="./Register.html">Register here.</a></i>
						</p>
						<div>
							<a class="reglink" href="../index.html"><i>Back to Home</i></a>
						</div>

						<!-- Back to homepage -->

					</div>
					<div class="col-2"></div>
				</div>

			</div>

			<div class="col-3"></div>
		</div>
	</div>
</body>
</html>