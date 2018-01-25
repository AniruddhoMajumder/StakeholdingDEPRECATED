<html><head></head><body>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="project.*"%>
<%@ page import="dao.*"%>
<%@ page import="defaults.DefaultValues"%>
<%
	if(null == session.getAttribute("USER_TYPE")){
		response.sendRedirect("./index.jsp");
	}else{
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
			try{
				if(cdao.insertCompany(newCompany, userId, pass)){
					session.setAttribute("SIGNUP_STATUS", "SUCCESS");
					response.sendRedirect("./signupstatus.jsp");
				}else{
					session.setAttribute("SIGNUP_STATUS", "FAILURE");
					response.sendRedirect("./signupstatus.jsp");
				}

			}catch(SQLIntegrityConstraintViolationException e){
				e.printStackTrace();
			}catch(Exception e){
				e.printStackTrace();
			}
			
			
		}else{
			List<Object> formValues = new ArrayList<Object>();

			formValues.add(request.getParameter("NAME"));
			formValues.add(request.getParameter("PHONE"));
			formValues.add(request.getParameter("EMAIL"));
			formValues.add(request.getParameter("ADDRESS"));
			formValues.add(request.getParameter("IDNO"));
			formValues.add(true);

			Trader newTrader = new Trader(formValues);

			String userId = request.getParameter("USER_ID");
			String pass = request.getParameter("PASS");

			TraderDAO tdao = new TraderDAO(DefaultValues.DBURL, DefaultValues.DBUSER, DefaultValues.DBPASS);
			try{
				if(tdao.insertTrader(newTrader, userId, pass)){
					session.setAttribute("SIGNUP_STATUS", "SUCCESS");
					response.sendRedirect("./signupstatus.jsp");
				}else{
					session.setAttribute("SIGNUP_STATUS", "FAILURE");
					response.sendRedirect("./signupstatus.jsp");
				}

			}catch(SQLIntegrityConstraintViolationException e){
				e.printStackTrace();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
%>
</body></html>