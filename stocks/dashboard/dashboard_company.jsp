<!DOCTYPE html>
<html>
<head>
	<title>Meridia | Company Dashboard</title>
	<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
</head>
<body style="background-color: black;">
	<nav class="navbar navbar-expand-sm fixed-top bg-light navbar-light">
		<a class="navbar-brand" href=".\index.jsp" style="padding: 0; margin: 0; margin-right: 10px;">
			<img src=".\res\meridia_logo.png" alt="Logo" style="max-height: 40px;">
		</a>
		<ul class="navbar-nav ml-auto">
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" id="navbardrop" data-toggle="dropdown" style="cursor: pointer;">Username</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">Profile</a>
					<a class="dropdown-item" href="#">Logout</a>
				</div>
			</li>
		</ul>
	</nav>
	<div class="card ml-auto mr-auto" style="max-height: 90vh; max-width: 80vw; height: 90vh; width: 80vw; margin-top: 60px; padding: 40px; color: rgb(249,89,42);">
		<div>
			<div style="max-width: 40vw; float: left; margin-left: 20px;">
				<font style="font-size: 50px;">Company Name</font>
				<br>
				<font style="font-size: 20px;">License ID</font>
			</div>

			<div style="height: 100px; width: 120px; text-align: center; border: none; float: right;">
				Price<br>
				<font style="font-size: 40px;">500</font>
			</div>
		</div>

		<center><hr width="1000px" size="3px"></center>

		<div>
			<div class="container" style="max-width: 120px; float: left; text-align: center; padding: 0; margin-top: 60px;">

				<h4>Shares<br><br></h4>

				<div style="height: 100px; width: 120px; margin-top: 10px; text-align: center; border: none;">
					Issued<br>
					<font style="font-size: 40px;">500</font>
				</div>

				<div style="height: 100px; width: 120px; border: none; text-align: center;">
					Sold<br>
					<font style="font-size: 40px;">500</font>
				</div>
			</div>

			<div style=" float:right; text-align: right; padding-right: 30px;">
				<h4>Trend</h4>
				<div class="container" style="border: 1px solid black; width: 60vw; height: 50vh;">
				</div>
			</div>
		</div>

	</div>
</body>

<script src="../js/jquery-3.2.1.js"></script>
<script src="../js/bootstrap.js"></script>

</html>
