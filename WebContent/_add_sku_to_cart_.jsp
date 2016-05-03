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
	int sku = Integer.parseInt(request.getParameter("SKU"));
	int sku_quantity = Integer.parseInt(request.getParameter("sku_quantity"));
	int sku_price = Integer.parseInt(request.getParameter("sku_price"));
	String sku_name = request.getParameter("sku_name");
	
	String item_ref_string = "item_" + (Integer.parseInt(session.getAttribute("sc_num_items").toString()) + "1").toString();
	
	session.setAttribute(item_ref_string,sku);
	session.setAttribute(item_ref_string + "_qnty",sku_quantity);
	session.setAttribute(item_ref_string + "_price",sku_price);
	session.setAttribute(item_ref_string + "_name",sku_name);
	
	session.setAttribute("sc_num_items", (Integer.parseInt(session.getAttribute("sc_num_items").toString()) + 1));

	response.sendRedirect("shopping_cart.jsp");
%>
</body>
</html>