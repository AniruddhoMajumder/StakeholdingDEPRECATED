<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="project.*"%>
<%@ page import="dao.*"%>
<%@ page import="defaults.DefaultValues"%>
<%
	String user = request.getParameter("USERNAME");
   String pass = request.getParameter("PASSWORD");

   LoginDAO ldao = new LoginDAO(DefaultValues.DBURL, DefaultValues.DBUSER, DefaultValues.DBPASS);

   List<Object> values = ldao.login(user, pass);

   if(((String) values.get(0)).equals("company")){

      session.setAttribute("USER_TYPE", values.get(0));
      session.setAttribute("ID", values.get(1));
      session.setAttribute("NAME", values.get(2));
      session.setAttribute("LICENCE", values.get(3));
      session.setAttribute("PHONE", values.get(4));
      session.setAttribute("EMAIL", values.get(5));
      session.setAttribute("ADDRESS", values.get(6));

      response.sendRedirect("./dashboard");
   }else if(((String) values.get(0)).equals("trader")){

      session.setAttribute("USER_TYPE", values.get(0));
      session.setAttribute("ID", values.get(1));
      session.setAttribute("TITLE", values.get(2));
      session.setAttribute("F_NAME", values.get(3));
      session.setAttribute("M_NAME", values.get(4));
      session.setAttribute("L_NAME", values.get(5));
      session.setAttribute("GENDER", values.get(6));
      session.setAttribute("ID_PROOF", values.get(7));
      session.setAttribute("DOB", values.get(8));
      session.setAttribute("PHONE", values.get(9));
      session.setAttribute("EMAIL", values.get(10));
      session.setAttribute("ADDRESS", values.get(11));

      response.sendRedirect("./dashboard/TraderPage.html");
   }else{
      response.sendRedirect("./index.jsp");
   }
%>
