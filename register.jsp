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
</head>

<body>
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
							<label class="control-label col-3" for="COMPANY_NAME">Company Name</label>
							<div class="col-9">
								<input class="form-control" type="text" id="COMPANY_NAME" name="COMPANY_NAME" placeholder="Company Name"></input>
							</div>
						</div>
						<hr>
						<div class="row">
							<label class="control-label col-3" for="SHARES_REGISTERED">Shares to Register</label>
							<div class="col-3">
								<input class="form-control" type="number" id="SHARES_REGISTERED" name="SHARES_REGISTERED" value="0"></input>
							</div>

							<label class="control-label col-3" for="MARKET_LICENCE">Market Licence No.</label>
							<div class="col-3">
								<input class="form-control" type="text" id="MARKET_LICENCE" name="MARKET_LICENCE"placeholder="Licence Number"></input>
							</div>
						</div>
						<br>
						<div class="row">
							<label class="control-label col-3" for="SHARES_ISSUED">Shares to Issue</label>
							<div class="col-3">
								<input class="form-control" type="number" id="SHARES_ISSUED" name="SHARES_ISSUED" value="0" ></input>
							</div>

							<label class="control-label col-3" for="SHARE_PRICE">Share Price</label>
							<div class="col-3">
								<input class="form-control" type="text" id="SHARE_PRICE" name="SHARE_PRICE" placeholder="Price in Rupees"></input>
							</div>
						</div>
						<hr>
						<div class="row">
							<label class="control-label col-3" for="PHONE">Phone No.</label>
							<div class="col-3">
								<input class="form-control" type="text" id="PHONE" name="PHONE" placeholder="Phone Number"></input>
							</div>

							<label class="control-label col-3" for="EMAIL">Email ID</label>
							<div class="col-3">
								<input class="form-control" type="text" id="EMAIL" name="EMAIL" placeholder="Email ID"></input>
							</div>							
						</div>
						<br>
						<div class="row">
							<label class="control-label col-3" for="ADDRESS">HQ Address</label>

							<div class="col-9">
								<textarea class="form-control" form="signup_form" id="ADDRESS" name="ADDRESS" placeholder="Headquarters Address"></textarea>
							</div>
						</div>
						<hr>
						<div class="row">
							<label class="control-label col-3" for="USER_ID">User ID</label>
							<div class="col-9">
								<input class="form-control" type="text" id="USER_ID" name="USER_ID" placeholder="User ID"></input>
							</div>
						</div>
						<br>
						<div class="row">

							<label class="control-label col-3" for="PASS">Password</label>
							<div class="col-9">
								<input class="form-control" type="password" id="PASS" name="PASS" placeholder="Password"></input>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-6">
								<input class="form-control btn-outline-success" type="submit" value="Register"></input>
							</div>
							<div class="col-6">
								<input class="form-control btn-outline-secondary" type="reset" value="Clear"></input>
							</div>
						</div>
						<hr>
					</form>
				</div>		
			<%
				}else if(userType.equals("trader")){
			%>
				<div class="col-8" style="border-radius: 5px; padding: 30px; border: 1px solid; border-color: rgb(200, 200, 200);">
					<form class="form-horizontal" id="signup_form" name="signup_form" action="signup.jsp" method="post">
						<div class="row">
							<label class="control-label col-1" for="NAME">Name</label>
							<div class="col-11">
								<input class="form-control" type="text" id="NAME" name="NAME" placeholder="Trader's Name"></input>
							</div>
						</div>
						<hr>
						<div class="row">
							<label class="control-label col-6" style="text-align: center;" for="PHONE">Phone No.</label>
							<label class="control-label col-6" style="text-align: center;" for="EMAIL">Email ID</label>	
						
							<div class="col-6">
								<input class="form-control" type="text" id="PHONE" name="PHONE" placeholder="Phone No."></input>
							</div>
							<div class="col-6">
								<input class="form-control" type="text" id="EMAIL" name="EMAIL" placeholder="Email ID"></input>
							</div>
						</div>
						<div class="row">
							<label class="control-label col-6" style="text-align: center;" for="ADDRESS">Address</label>
							<label class="control-label col-6" style="text-align: center;" for="IDNO">Government Issued Photo ID No.</label>
							<div class="col-6">
								<textarea class="form-control" form="signup_form" id="ADDRESS" name="ADDRESS" placeholder="Address"></textarea>
							</div>
							<div class="col-6">
								<input class="form-control" type="text" id="IDNO" name="IDNO" placeholder="Government Issued Photo ID No."></input>
							</div>
						</div>
						<hr>
						<div class="row">
							<label class="control-label col-6" style="text-align: center;" for="USER_ID">User ID</label>
							<label class="control-label col-6" style="text-align: center;" for="PASS">Password</label>
							<div class="col-6">
								<input class="form-control" type="text" id="USER_ID" name="USER_ID" placeholder="User ID"></input>
							</div>
							<div class="col-6">
								<input class="form-control" type="password" id="PASS" name="PASS" placeholder="Password"></input>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-6">
								<input class="form-control btn-outline-success" type="submit" value="Register"></input>
							</div>
							<div class="col-6">
								<input class="form-control btn-outline-secondary" type="reset" value="Clear"></input>
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