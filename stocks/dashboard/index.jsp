<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="project.*"%>
<%@ page import="dao.*"%>
<%@ page import="defaults.DefaultValues"%>
<%if(session.getAttribute("USER_TYPE") == null || session.getAttribute("USER_TYPE").equals("")){
	response.sendRedirect("../");
}else if (session.getAttribute("USER_TYPE").equals("company")){

SecurityDAO sdao = new SecurityDAO(DefaultValues.DBURL, DefaultValues.DBUSER, DefaultValues.DBPASS);

session.setAttribute("SHARE_PRICE", Double.toString(sdao.getEquitySharePrice(( (String) session.getAttribute("ID")))));
session.setAttribute("SHARES_ISSUED", Double.toString(sdao.getEquitySharesIssued(( (String) session.getAttribute("ID")))));
session.setAttribute("SHARES_SOLD", Double.toString(sdao.getEquitySharesSold(( (String) session.getAttribute("ID")))));

	%>
<!DOCTYPE html>
<html>
<head>
	<title>Dashboard</title>

	<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
</head>

<body>

<nav class="navbar sticky-top navbar-dark bg-info" style="padding-right: 0px !important;">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="./index.jsp">Meridia</a>
		</div>
		<div class="form-inline">
			<button id="LOGOUT" type="button" class="btn btn-primary" style="margin: 0px 15px 0px 0px;">Log Out</button>
		</div>
	</div>
</nav>
<div class="card ml-auto mr-auto" style="max-height: 90vh; max-width: 80vw; height: 90vh; width: 80vw; margin-top: 60px; padding: 40px; color: rgb(249,89,42);">
	<div>
		<div style="max-width: 40vw; float: left; margin-left: 20px;">
			<font style="font-size: 50px;"><% out.println(session.getAttribute("NAME")); %></font>
			<br>
			<font style="font-size: 20px;"><% out.println(session.getAttribute("LICENCE")); %></font>
		</div>

		<div style="height: 100px; width: 120px; text-align: center; border: none; float: right;">
			Price<br>
			<font style="font-size: 40px;"><% out.println(session.getAttribute("SHARE_PRICE")); %></font>
		</div>
	</div>

	<center><hr width="1000px" size="3px"></center>

	<div>
		<div class="container" style="max-width: 120px; float: left; text-align: center; padding: 0; margin-top: 60px;">

			<h4>Shares<br><br></h4>

			<div style="height: 100px; width: 120px; margin-top: 10px; text-align: center; border: none;">
				Issued<br>
				<font style="font-size: 40px;"><% out.println(session.getAttribute("SHARES_ISSUED")); %></font>
			</div>

			<div style="height: 100px; width: 120px; border: none; text-align: center;">
				Sold<br>
				<font style="font-size: 40px;"><% out.println(session.getAttribute("SHARES_SOLD")); %></font>
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

</html>

<script src="../js/jquery-3.2.1.js"></script>
<script src="../js/popper.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script type="text/javascript">
    document.getElementById("LOGOUT").onclick = function () {
        location.href = "../logout.jsp";
    };
</script>
<%}else if(session.getAttribute("USER_TYPE").equals("trader")){

		TraderDAO tdao = new TraderDAO(DefaultValues.DBURL, DefaultValues.DBUSER, DefaultValues.DBPASS);
		CompanyDAO cdao = new CompanyDAO(DefaultValues.DBURL, DefaultValues.DBUSER, DefaultValues.DBPASS);
		SecurityDAO sdao = new SecurityDAO(DefaultValues.DBURL, DefaultValues.DBUSER, DefaultValues.DBPASS);
%>
<!DOCTYPE html>
<html>
<head>
	<title>Dashboard</title>

	<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
</head>

<body>
<nav class="navbar sticky-top navbar-dark bg-info" style="padding-right: 0px !important;">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="./index.jsp">Meridia</a>
		</div>
		<div class="form-inline">
			<button id="LOGOUT" type="button" class="btn btn-primary" style="margin: 0px 15px 0px 0px;">Log Out</button>
		</div>
	</div>
</nav>

<div class="container-fluid">
	<div class="row">
		<%
			
		%>
		<div class="col-3">
			<div class="card w-100 p-2 text-left">
				<div class="card-block row">
					<div class="col-6">
						<h3 class="card-title" style="padding-left: 21px;">ABC</h3>
					</div>
					<div class="col-6">
						<h6 class="card-title" style="padding-right: 21px; text-align: center;">40.56</h6>
					</div>
				</div>
				<div class="card-header">
					<ul class=" nav nav-pills card-header-pills">
						<li class="nav-item">
							<a class="nav-link" href="https://christuniversity.in/">Buy</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="https://christuniversity.in/">Sell</a>
						</li>
					</ul>
				</div>
			</div>
		</div>


<!-- TRADER'S DASHBOARD -->
<div class="col-md-9">
 <div class="card h-100" style="background: rgba(255, 105, 51,0.8);">
  <div class="dropdown">
					<button type="button" class="btn btn-dark float-right dropdown-toggle" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Profile</button>

					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<h5 class="dropdown-header"><%
						String name = "";
						name += session.getAttribute("TITLE");
						name += " ";
						name += session.getAttribute("F_NAME");
						if(((String) session.getAttribute("M_NAME")).length()>0){
							name += session.getAttribute("M_NAME") + " ";
						}else{
							name += " ";
						}
						name += session.getAttribute("L_NAME");
						out.print(name);
						%></h5>
						<h5 class="dropdown-header"><% out.print(session.getAttribute("ID_PROOF")); %></h5>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="../">Home</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="../logout.jsp">Log Out</a>

					</div>
   </div> <!-- dropdown -->
  <hr class="my-4">

  <div class="container">
   <div class="row">

		<div class="col-8">
		<!-- CARD1 -->
			<div class="card" style="padding: 10px; background: rgba(128, 0, 0,0.2);">
				<%
					List<String> investedCompanies = tdao.getInvestments( ( (String) session.getAttribute("ID")) );
					for(int i=0; i<investedCompanies.size(); i++){
						if(i%2==0){
				%>

					<div class="row">

				<%
						}

				%>
						<div class="col-6">
							<div class="card bg-light card-outline-dark" style="margin-bottom: 10px;">
							<h3 class="card-header"><% out.print(cdao.getCompanyName(investedCompanies.get(i))); %></h3>
								<div class="card-block">
									<table class="table table-hover table-dark">
										<tbody>
											<tr>
												<td>Shares</td>
												<td><% out.print(tdao.getInvestedNo( ( (String) session.getAttribute("ID") ) , ( investedCompanies.get(i) ) )); %></td>
											</tr>
											<tr>
												<td>Price</td>
												<td>Rs. <% out.print( sdao.getEquitySharePrice( investedCompanies.get(i) ) ); %></td>
											</tr>
											<tr>
												<td>Total price</td>
												<td>Rs. <%out.print( (tdao.getInvestedNo( ( (String) session.getAttribute("ID") ) , ( investedCompanies.get(i) ) )) * ( sdao.getEquitySharePrice( investedCompanies.get(i) ) ) ); %></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
				<%
						if(i%2!=0){
				%>
						</div>
				<%
						}
					}
				%>
				<!--div class="row">
					<div class="col-6">
						<div class="card bg-light card-outline-dark" style="margin-bottom: 10px;">
						<h3 class="card-header">ABC</h3>
							<div class="card-block">
								<table class="table table-hover table-dark">
									<tbody>
										<tr>
											<td> Shares</td>
											<td>90</td>
										</tr>
										<tr>
											<td> Price</td>
											<td>50.45</td>
										</tr>
										<tr>
											<td>Total price</td>
											<td>4500.67</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div-->
			</div>
		</div> <!-- END OF COL8 -->


   	<div class="col-4">
   	 <div class="row">
   	  <div class="col-12">
   	  <div class="card text-center" style="margin-bottom: 10px; padding: 5px;" >
   	   <div class="card-block">
   	   	<h4 class="card-title">Amount Invested</h4>
   	   	<hr class="my-4">
   	   	<p class="card-text">Rs. <% out.print(tdao.getTotalInvestment( ( (String) session.getAttribute("ID") ) )); %></p>
   	   </div>
   	  </div>
   	  </div>
   	 </div> <!-- END OF FIRST ROW -->

   	 <div class="row">
   	  <div class="col-12">
   	  <div class="card text-center" style="margin-bottom: 10px; padding: 5px;">
   	   <div class="card-block">
   	   	<h4 class="card-title">Amount Remaining</h4>
   	   	<hr class="my-4">
   	   	<p class="card-text">Rs. <% out.print(tdao.getRemainingBalance(( (String) session.getAttribute("ID")))); %></p>
   	   </div>
   	  </div>
   	 </div>
   	</div>

   </div> <!-- END OF COL9 -->

   </div>
  </div>

 </div>
</div>
</body>

</html>

<script src="../js/jquery-3.2.1.js"></script>
<script src="../js/popper.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script type="text/javascript">
    document.getElementById("LOGOUT").onclick = function () {
        location.href = "../logout.jsp";
    };
</script>
<%}%>
