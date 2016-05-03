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
	
		int num_of_items = Integer.parseInt(session.getAttribute("sc_num_items").toString());
	
		for(int i =1; i <= num_of_items; i++){
			
		}
	%>
	<%
		for (int i = 0; i < num_of_items; i++){
	%>
	<tr>
		<td>
			sku
		</td>
		<td>
			name
		</td>
		<td>
			num
		</td>
		<td>
			price
		</td>
		<td>
			price total
		</td>
	
		</tr>
	<%
		}
	%>

</body>
</html>