<!DOCTYPE html>
<html>
<head>
	<title>Stockmarket</title>
</head>
<body>

	<button onclick="sendData('company')">Company</button>
	<button onclick="sendData('trader')">Trader</button>
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