<!DOCTYPE html>
<html>
<head>
	<title>Meridia</title>
	<style>
		.logo {
			max-width: 60%;
			max-height: 40%;
			margin: auto;
			margin-top: 5%;
		}
		.logo img {
			height: 100%;
			width: 100%;
			margin-left: auto;
			margin-right: auto;
		}
		.but {
			margin: auto;
			max-width: 40%;
			text-align: center;
			font-weight: bold;
			font-size: 20px;
			letter-spacing: 1px;
			color: rgb(249,89,42);
		}
		.but button {
			display: inline-block;
			width: 40%;
			height: 50px;
			border-radius: 5px;
			background-color: rgb(249,89,42);
			color: white;
			border: none;
			margin: 20px;
			font-weight: bold;
			font-size: 15px;
			letter-spacing: 1px;
		}
		.but button:hover {
			border: 2px solid rgb(249,89,42);
			color: rgb(249,89,42);
			background-color: white;
		}
		.but fieldset {
			border: 2px solid rgba(249,89,42,0.5);
		}
	</style>
</head>
<body>
	<div class="logo">
		<img src="meridia_logo.png">
	</div>

	<div class="but">
		<fieldset>
			<legend align="bottom">Sign Up</legend>
			<button onclick="sendData('company')">Company</button>
			<button onclick="sendData('trader')">Trader</button>
		</fieldset>
	</div>
</body>

<script type="text/javascript">
	function sendData(user_type){
		document.getElementById("USER_TYPE").value = user_type;
		document.getElementById("register_type").submit();
	}
</script>

<form id="register_type" name="register_type" action="register.jsp" method="post">
	<input type="hidden" id="USER_TYPE" name="USER_TYPE"></input>
</form>	

</html>