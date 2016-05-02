<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%@ page import="java.sql.*" %>

<%
	String category_name = request.getParameter("category_name");

	try {
		Class.forName("org.postgresql.Driver");
	} catch (java.lang.ClassNotFoundException e) {
		System.err.print("ClassNotFoundException: ");
		System.err.println(e.getMessage());
	}

	try{
		Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/team-awesome");
		
		String sqlstr = "DELETE FROM product_categories WHERE name = '" + category_name + "';";
		
		Statement st = con.createStatement();
		st.executeUpdate(sqlstr);
		
		response.sendRedirect("category_delete_success.jsp");
	} 
	catch(SQLException ex) 
	{
		System.err.println("SQLException: " + ex.getMessage());
		response.sendRedirect("category_delete_failure.jsp");
	}
%>
</body>
</html>