<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/red/css/style1.css" />
<link rel="stylesheet" type="text/css" href="/red/css/index.css" />
<title>500</title>
</head>
<body>

<div id="top">
	<a href='/red/index.jsp'><img id='logo' src='/red/img/logo.png'></a>
</div>

<h3 class="m-5 error"> There was an internal error... <br> something went wrong in your code :( </h3>
<div> <p class="m-5 error"> Back to <a href="/red/index.jsp"> Home</a>.</p> </div>
<h4 class="m-5 error"><br> here's what happened:</h4>   
												
<h5 class="m-5 error"> <b>Exception:</b>  ${pageContext.exception["class"]} 
<br>  <b>Message:</b> ${pageContext.exception["message"]}</h5>


<div> <p class="m-5 error">For more details, ask ${initParam.admin}.</p></div>




</body>
</html>