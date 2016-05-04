<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>

<%
	String sku = request.getParameter("sku");
	String attr = request.getParameter("attr");
	String new_val = request.getParameter("new_val");

	try {
		Class.forName("org.postgresql.Driver");
	} catch (java.lang.ClassNotFoundException e) {
		System.err.print("ClassNotFoundException: ");
		System.err.println(e.getMessage());
	}

	try{
		Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/team-awesome");
		
		String sqlstr = "UPDATE products SET " + attr + " = '" + new_val + "' WHERE sku = " + sku + ";";
		
		Statement st = con.createStatement();
		st.executeUpdate(sqlstr);
		
		response.sendRedirect("operation_result.jsp?op=Update Product&res=successful&ret=products.jsp");
	} 
	catch(SQLException ex) 
	{
		System.err.println("SQLException: " + ex.getMessage());
		response.sendRedirect("operation_result.jsp?op=Update Product&res=unsuccessful&ret=products.jsp");
	}
%>
</body>
</html>