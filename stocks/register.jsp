<%
	String userType = "";

	if(null == request.getParameter("USER_TYPE")){
		response.sendRedirect("./index.jsp");
	}else{
		userType = request.getParameter("USER_TYPE");
		session.setAttribute("USER_TYPE", userType);
	}

%>

<!DOCTYPE html>
<html>
<head>
	<title>Stockmarket | Register</title>

	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/home.css">
</head>

<body>
	<nav class="navbar sticky-top navbar-dark bg-info" style="padding-right: 0px !important;">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="./index.jsp">Meridia</a>
			</div>
		</div>
	</nav>
	<div class="container" style="padding-top: 50px;">
		<div class="row">
			<div class="col-2">

			</div>
			<%
				if(userType.equals("company")){
			%>
				<div class="col-8" style="border-radius: 5px; padding: 30px; border: 1px solid; border-color: rgb(200, 200, 200);">
					<form class="form-horizontal" id="signup_form" name="signup_form" action="signup.jsp" method="post">
						<div class="row">
							<label class="control-label col-6" for="NAME">Company Name</label>
							<label class="control-label col-6" for="LICENCE">Licenced ID</label>
						</div>
						<div class="row">
							<div class="col-6">
								<input type="text" class="form-control" id="NAME" name="NAME"></input>
							</div>
							<div class="col-6">
								<input type="text" class="form-control" id="LICENCE" name="LICENCE"></input>
							</div>
						</div>
						<hr>
						<div class="row">
							<label class="control-label col-6" for="PHONE">Phone Number</label>
							<label class="control-label col-6" for="EMAIL">Email ID</label>
						</div>
						<div class="row">
							<div class="col-6">
								<input type="text" class="form-control" id="PHONE" name="PHONE"></input>
							</div>
							<div class="col-6">
								<input type="text" class="form-control" id="EMAIL" name="EMAIL"></input>
							</div>
						</div>
						<br>
						<div class="row">
							<label class="control-label col-12" for="ADDRESS">Address</label>
							<div class="col-12">
								<textarea class="form-control" form="signup_form" id="ADDRESS" name="ADDRESS"></textarea>
							</div>
						</div>
						<hr>
						<div class="row">
							<label class="control-label col-6" for="REGISTERED">Shares Registered</label>
							<label class="control-label col-6" for="ISSUED">Shares Issued</label>
						</div>
						<div class="row">
							<div class="col-6">
								<input type="number" class="form-control" id="REGISTERED" name="REGISTERED"></input>
							</div>
							<div class="col-6">
								<input type="number" class="form-control" id="ISSUED" name="ISSUED"></input>
							</div>
						</div>
						<br>
						<div class="row">
							<label class="control-label col-6" for="PRICE">Price per Share</label>
							<label class="control-label col-6" for="TYPE">Type of Share</label>
						</div>
						<div class="row">
							<div class="col-6">
								<input type="number" class="form-control" id="PRICE" name="PRICE"></input>
							</div>
							<div class="col-6">
								<select class="custom-select" id="TYPE" name="TYPE">
									<option selected>Choose a type</option>
									<option value="eshr">Equity Shares</option>
									<option value="pshr">Preference Shares</option>
								</select>
							</div>
						</div>
						<hr>
						<div class="row">
							<label class="control-label col-6" for="USERNAME">Username</label>
							<label class="control-label col-6" for="PASSWORD">Password</label>
						</div>
						<div class="row">
							<div class="col-6">
								<input type="text" class="form-control" id="USERNAME" name="USERNAME"></input>
							</div>
							<div class="col-6">
								<input type="password" class="form-control" id="PASSWORD" name="PASSWORD"></input>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-6">
								<input class="btn btn-outline-success form-control" type="submit" value="Register"></input>
							</div>
							<div class="col-6">
								<input class="btn btn-outline-primary form-control" type="reset" value="Clear"></input>
							</div>
						</div>
						<hr>
					</form>
				</div>
			<%
				}else if(userType.equals("trader")){
			%>
				<div class="col-8" style="border-radius: 5px; padding: 30px; border: 1px solid; border-color: rgb(200, 200, 200);">
					<form id="signup_form" name="signup_form" action="signup.jsp" method="post">
						<div class="row">
							<label class="control-label col-4" for="TITLE">Title</label>
							<label class="control-label col-8" for="FNAME">First Name</label>
						</div>
						<div class="row">
							<div class="col-4">
								<select class="form-control" id="TITLE" name="TITLE">
									<option selected>Choose...</option>
									<option value="Mr.">Mr.</option>
									<option value="Ms.">Ms.</option>
								</select>
							</div>
							<div class="col-8">
								<input type="text" class="form-control" id="FNAME" name="FNAME"></input>
							</div>
						</div>
						<br>
						<div class="row">
							<label class="control-label col-6" for="MNAME">Middle Name</label>
							<label class="control-label col-6" for="LNAME">Last Name</label>
						</div>
						<div class="row">
							<div class="col-6">
								<input type="text" class="form-control" id="MNAME" name="MNAME"></input>
							</div>
							<div class="col-6">
								<input type="text" class="form-control" id="LNAME" name="LNAME"></input>
							</div>
						</div>
						<hr>
						<div class="row">
							<label class="control-label col-12" for="IDPROOF">ID Proof</label>
							<div class="col-12">
								<input type="text" class="form-control" id="IDPROOF" name="IDPROOF"></input>
							</div>
						</div>
						<hr>
						<div class="row">
							<label class="control-label col-6" for="GENDER">Gender</label>
							<label class="control-label col-6" for="DOB">Date of Birth</label>
						</div>
						<div class="row">
							<div class="col-6">
								<select class="form-control" id="GENDER" name="GENDER">
									<option selected>Choose...</option>
									<option value="M">Male</option>
									<option value="F">Female</option>
								</select>
							</div>
							<div class="col-6">
								<input type="date" class="form-control" id="DOB" name="DOB"></input>
							</div>
						</div>
						<hr>
						<div class="row">
							<label class="control-label col-6" for="PHONE">Phone Number</label>
							<label class="control-label col-6" for="EMAIL">Email ID</label>
						</div>
						<div class="row">
							<div class="col-6">
								<input type="text" class="form-control" id="PHONE" name="PHONE"></input>
							</div>
							<div class="col-6">
								<input type="text" class="form-control" id="EMAIL" name="EMAIL"></input>
							</div>
						</div>
						<br>
						<div class="row">
							<label class="control-label col-12" for="ADDRESS">Address</label>
							<div class="col-12">
								<textarea class="form-control" form="signup_form" id="ADDRESS" name="ADDRESS"></textarea>
							</div>
						</div>
						<hr>
						<div class="row">
							<label class="control-label col-12" for="BALANCE">Starting Funds</label>
							<div class="col-12">
								<input type="number" class="form-control" id="BALANCE" name="BALANCE"></input>
							</div>
						</div>
						<hr>
						<div class="row">
							<label class="control-label col-6" for="USERNAME">Username</label>
							<label class="control-label col-6" for="PASSWORD">Password</label>
						</div>
						<div class="row">
							<div class="col-6">
								<input type="text" class="form-control" id="USERNAME" name="USERNAME"></input>
							</div>
							<div class="col-6">
								<input type="password" class="form-control" id="PASSWORD" name="PASSWORD"></input>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-6">
								<input class="btn btn-outline-success form-control" type="submit" value="Register"></input>
							</div>
							<div class="col-6">
								<input class="btn btn-outline-primary form-control" type="reset" value="Clear"></input>
							</div>
						</div>
						<hr>
					</form>
				</div>
			<%
				}
			%>

			<div class="col-2">

			</div>
		</div>
	</div>
</body>

</html>
