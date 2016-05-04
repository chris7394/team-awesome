<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		int num_of_items = Integer.parseInt(session.getAttribute("sc_num_items").toString());
	
		int total = 0;
			
		for(int i =1; i <= num_of_items; i++){
			total = total + (Integer.parseInt(session.getAttribute("item_" + i.toString() + "_name")) * Integer.parseInt(session.getAttribute("item_" + i.toString() + "_name")));
		}
	%>
	
	<table>
		<% for (int i = 0; i < num_of_items; i++){  %>
		
			<tr>
				<td>
					<%= print(session.getAttribute("item_" + i.toString() + "_name")); %>
				</td>
				<td>
					<%= print(session.getAttribute("item_" + i.toString() + "_qnty")); %>
				</td>
				<td>
					<%= print(session.getAttribute("item_" + i.toString() + "_price")); %>
				</td>
				<td>
					<%= print(Integer.parseInt(session.getAttribute("item_" + i.toString() + "_name")) * Integer.parseInt(session.getAttribute("item_" + i.toString() + "_name"))); %>
				</td>
			</tr>
			
		<% } %>
		<tr>
			<%= print(total); %>
		</tr>
	</table>
	
	<form class="form-signup" action="_sign_up_.jsp" method="post">
		
		<input type="number" placeholder="CC # for transferring the moniez" id="cc_info" autofocus>
		
		<button class="btn btn-lg btn-primary btn-block" type="submit">Buy</button>
		
	</form>
</body>
</html>