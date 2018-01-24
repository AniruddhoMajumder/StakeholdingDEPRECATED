<html><head></head><body>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="project.Company"%>
<%@ page import="dao.CompanyDAO"%>
<%@ page import="defaults.DefaultValues"%>
<%
	String type = (String) session.getAttribute("USER_TYPE");
	
	if(type.equals("company")){
		
		List<Object> formValues = new ArrayList<Object>();

		formValues.add(request.getParameter("COMPANY_NAME"));
		formValues.add(request.getParameter("MARKET_LICENCE"));
		formValues.add(request.getParameter("PHONE"));
		formValues.add(request.getParameter("EMAIL"));
		formValues.add(request.getParameter("ADDRESS"));
		formValues.add(Integer.parseInt(request.getParameter("SHARES_REGISTERED")));
		formValues.add(Integer.parseInt(request.getParameter("SHARES_ISSUED")));
		formValues.add(Double.parseDouble(request.getParameter("SHARE_PRICE")));
		formValues.add(true);

		Company newCompany = new Company(formValues);

		String userId = request.getParameter("USER_ID");
		String pass = request.getParameter("PASS");

		CompanyDAO cdao = new CompanyDAO(DefaultValues.DBURL, DefaultValues.DBUSER, DefaultValues.DBPASS);
		out.println(cdao.insertCompany(newCompany, userId, pass));
		
	}else{
		out.println(request.getParameter("NAME") + "<br>");
		out.println(request.getParameter("PHONE") + "<br>");
		out.println(request.getParameter("EMAIL") + "<br>");
		out.println(request.getParameter("ADDRESS") + "<br>");
		out.println(request.getParameter("IDNO") + "<br>");
		out.println(request.getParameter("USER_ID") + "<br>");
		out.println(request.getParameter("PASS") + "<br>");
	}
%>
</body></html>