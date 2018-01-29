<!DOCTYPE html>
<html>
<head>
	<title>Stockmarket</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<style type="text/css">
		.modal-open {
			padding-right: 0px !important;
			overflow: auto !important;
		}
	</style>
</head>
<body>

<nav class="navbar navbar-expand-sm navbar-dark bg-dark" style="padding-right: 0px !important;">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="./index.jsp">Meridia</a>
		</div>
		<form class="form-inline">
			<button type="button" class="btn btn-outline-success signup-close" style="margin: 0px 15px 0px 0px;" data-toggle="modal" data-target="#signup_modal">Sign Up</button>
			<button type="button" class="btn btn-outline-primary login-close" data-toggle="modal" data-target="#login_modal">Log In</button>
		</form>
	</div>
</nav>

</body>

</html>



<form id="register" name="register" action="register.jsp" method="post">
	<input type="hidden" id="USER_TYPE" name="USER_TYPE"></input>
</form>

<script type="text/javascript">
	function sendData(user_type, form_name){
		document.getElementById("USER_TYPE").value = user_type;
		document.getElementById(form_name).submit();
	}
</script>

<script>
	$(function () {
	    $(".login-close").on('click', function() {
	        $('#login_modal').modal('hide');
	    });
	});

	$(function () {
	    $(".signup-close").on('click', function() {
	        $('#signup_modal').modal('hide');
	    });
	});
</script>



<!--------------------------------------------SIGNUP MODAL------------------------------------------------------>
<div class="modal fade" id="signup_modal" tabindex="-1" role="dialog" aria-labelledby="signup_modalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="signup_modalLabel">Sign Up</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body row">
				<div class="col-1"></div>
				<button class="btn btn-outline-success col-4 signup-close" onclick="sendData('company', 'register')">Company</button>
				<div class="col-sm-2"></div>
				<button class="btn btn-outline-success col-4 signup-close" onclick="sendData('trader', 'register')">Trader</button>
				<div class="col-1"></div>
			</div>
		</div>
	</div>
</div>
<!--------------------------------------------MODAL END---------------------------------------------------------->

<!--------------------------------------------LOGIN MODAL------------------------------------------------------>
<div class="modal fade" id="login_modal" tabindex="-1" role="dialog" aria-labelledby="login_modalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="login_modalLabel">Log In</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="container" style="width: inherit;">
					<div class="row">
						<div class="col-sm-12">
							<form id="login" name="login" action="login.jsp" method="post">
								<div class="row">
									<label class="control-label col-4">Username:</label>
									<div class="col-8">
										<input class="form-control" type="text" id="USERNAME" name="USERNAME" placeholder="Username"></input>
									</div>
								</div>
								<br>
								<div class="row">
									<label class="control-label col-sm-4">Password:</label>
									<div class="col-8">
										<input class="form-control" type="password" id="PASSWORD" name="PASSWORD" placeholder="Password"></input>
									</div>
								</div>
							
						</div>	
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<input type="submit" class="btn btn-outline-success btn-md login-close" value="Log In"></button>
				<!--button type="button" class="btn btn-primary">Save changes</button-->
				</form>
			</div>
		</div>
	</div>
</div>
<!--------------------------------------------MODAL END---------------------------------------------------------->

<script src="js/jquery-3.2.1.js"></script>
<script src="js/bootstrap.min.js"></script>