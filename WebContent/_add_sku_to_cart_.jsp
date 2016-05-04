<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int sku = Integer.parseInt(request.getParameter("sku"));
	int quantity = Integer.parseInt(request.getParameter("quantity"));
	int price = Integer.parseInt(request.getParameter("price"));
	String name = request.getParameter("name");
	
	String item_ref_string = "item_" + ((Integer)session.getAttribute("sc_num_items")).toString();
	
	session.setAttribute(item_ref_string, sku);
	session.setAttribute(item_ref_string + "_qnty", quantity);
	session.setAttribute(item_ref_string + "_price", price);
	session.setAttribute(item_ref_string + "_name", name);
	
	session.setAttribute("sc_num_items", ((Integer)session.getAttribute("sc_num_items")).intValue() + 1);

	response.sendRedirect("buyShoppingCart.jsp");
%>
</body>
</html>