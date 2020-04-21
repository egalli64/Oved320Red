<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../css/style1.css" />
<link rel="stylesheet" type="text/css" href="../css/index.css" />
<title>404</title>
</head>
<body>
<div id="top">
	<a href='../index.html'><img id='logo' src='../img/logo.png'></a>
</div>

<h3 class="m-5 error"> Something went wrong ... <br> we can't find the page you're looking for :( </h3>
<div> <p class="m-5 error"> Go back to <a href="../index.html"> Home</a>.</p> </div>
<h4 class="m-5 error"><br> here's what happened:</h4>   
												
<h5 class="m-5 error"> <b>Exception:</b>  ${pageContext.exception["class"]} 
<br>  <b>Message:</b> ${pageContext.exception["message"]}</h5>



</body>
</html>