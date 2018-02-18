<!DOCTYPE html>
<html>
<head>
	<title>Stockmarket | Registration Successfull</title>

	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
</head>
<body>
<div class="container">
	<div class="row">

		<div class="col-xs-3">

		</div>

		<%
			if(null == session.getAttribute("SIGNUP_STATUS") || null == session.getAttribute("USER_TYPE")){
				response.sendRedirect("./index.jsp");
			}else{
				if(session.getAttribute("SIGNUP_STATUS") == "SUCCESS"){
					session.removeAttribute("SIGNUP_STATUS");
					session.removeAttribute("USER_TYPE");
		%>
					<div class="col-6 bg-success" style="text-align:center; min-height: 100px;">Registration Successful</div>
		<%
				}else if(session.getAttribute("SIGNUP_STATUS") == "FAILURE"){
					session.removeAttribute("SIGNUP_STATUS");
					session.removeAttribute("USER_TYPE");
		%>
					<div class="col-6 bg-danger">Registration Unsuccessful</div>
		<%
				}else{
					response.sendRedirect("./index.jsp");
				}
			}
		%>

		<div class="col-xs-3">

		</div>

		<div class="col-xs-12">
			<a href="./index.jsp">Go Back to Home</a>
		</div>

	</div>
</div>
</body>
</html>
