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
	String category_id = request.getParameter("category");
	String name = request.getParameter("name");
	String sku = request.getParameter("sku");
	String price = request.getParameter("price");

	try {
		Class.forName("org.postgresql.Driver");
	} catch (java.lang.ClassNotFoundException e) {
		System.err.print("ClassNotFoundException: ");
		System.err.println(e.getMessage());
	}

	try{
		Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/team-awesome");
		
		String sqlstr = "INSERT INTO products (sku, name, category, price) VALUES (" + sku + "," + name + "," + category_id + "," + price + ");";
				
		Statement st = con.createStatement();
		st.executeUpdate(sqlstr);
		
		response.sendRedirect("operation_result.jsp?op=Add Product&res=successful&ret=products.jsp");
	} 
	catch(SQLException ex) 
	{
		System.err.println("SQLException: " + ex.getMessage());
		response.sendRedirect("operation_result.jsp?op=Add Product&res=unsuccessful&ret=products.jsp");
	}
%>
</body>
</html>