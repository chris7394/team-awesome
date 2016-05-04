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
	int num_of_items = ((Integer)session.getAttribute("sc_num_items")).intValue();

	int total = 0;
		
	for(int i = 0; i < num_of_items; i++){
		total = total + (Integer)session.getAttribute("item_" + Integer.toString(i) + "_price") * (Integer)session.getAttribute("item_" + i + "_qnty");
	}
%>

<div class="main">
		<div class="content">
			<div class="content_bottom">
				<div class="wrap">
					<div class="content-bottom-right">	
						
						<table id="category-table" class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>Product Name</th>
									<th>Number</th>
									<th>Price</th>
								</tr>
							</thead>
							<tfoot>
							<tr>
									<th> </th>
									<th> </th>
									<th>Total : $<%=total%></th>
							</tfoot>
							<tbody>
							<% for (int i = 0; i < num_of_items; i++){  %>
								<tr>
									<td>
										<%= session.getAttribute("item_" + Integer.toString(i) + "_name") %>
									</td>
									<td>
										<%= session.getAttribute("item_" + Integer.toString(i) + "_qnty") %>
									</td>
									<td>
										<%= session.getAttribute("item_" + Integer.toString(i) + "_price") %>
									</td>
								</tr>
							<% } %>
							</tbody>
						</table>
						
						<h3>Purchase Successful</h3>
						
					</div>
					<div class="clear"></div>
				</div>
			</div>
      </div>
    </div>
    
    <h3><a href="productsBrowsing.jsp">Back to browse..</a></h3>
	
	<% session.setAttribute("sc_num_items", 0); %>
</body>
</html>