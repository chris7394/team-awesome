<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<head>
	<title>CSE 135 website</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link href='http://fonts.googleapis.com/css?family=Ubuntu+Condensed' rel='stylesheet' type='text/css'>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
	<script type="text/javascript" src="js/jquery-1.9.0.min.js"></script> 
	<script src="js/jquery.openCarousel.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/easing.js"></script>
	<script type="text/javascript" src="js/move-top.js"></script>
</head>
<body>

	<% 
		int num_of_items = ((Integer)session.getAttribute("sc_num_items")).intValue();
	
		int total = 0;
			
		for(int i = 0; i < num_of_items; i++){
			total = total + (Integer)session.getAttribute("item_" + Integer.toString(i) + "_price") * (Integer)session.getAttribute("item_" + i + "_qnty");
		}
	%>

	<div class="header">
  	  	<div class="wrap">
			<div class="header_top">
				<div class="logo">
					CSE 135 E-Commerce Website
				</div>

				<div class="header_top_name">
					<%
            			if(session.getAttribute("name") != null){
            				String name = session.getAttribute("name").toString();
            				out.println("Hello  " + name);
            			}
            			else{
            				out.println("<a class='header_top_name' href='index.jsp'>Login / Signup</a>");
            			}
            		%>
				</div>
				<div class="clear"></div>
			</div>   
			
			<div class="navigation">
				<ul class="nav">
					<li><a href="home.jsp">Home</a></li>
					<li><a href="categories.jsp">Categories</a></li>
					<li><a href="products.jsp">Products</a></li>
					<li><a href="productsBrowsing.jsp">Products Browsing</a></li>
					<li><a href="productOrder.jsp">Product Order</a></li>
					<li><a href="buyShoppingCart.jsp">Buy Shopping Cart</a></li>
				</ul>
				<span class="left-ribbon"> </span> <span class="right-ribbon">
				</span>
			</div>
		</div>
	</div>
   <!------------End Header ------------>
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

						<form class="form-signin" action="order_confirmation.jsp" method="post">
							<h2 class="form-signin-heading">Insert Credit Information</h2> </br>
							<label for="inputCredit" class="sr-only">Category</label>
							<input type="text" class="form-control" id="inputCredit" name="credit" placeholder="Credit number (ex. 1234-1234-1234)" autofocus>
							<br>
							<button class="btn btn-lg btn-success" type="submit">Purchase!</button>
							<br><br>
						</form>
						
					</div>
					<div class="clear"></div>
				</div>
			</div>
      </div>
    </div>
	<div class="footer">
		<div class="wrap">	
			<div class="copy_right">
				<p>Why do we have a footer again? Maybe to demonstrate the cool scroll to top arrow?</p>
			</div>		
        </div>
    </div>
    <script type="text/javascript">
		$(document).ready(function() {			
			$().UItoTop({ easingType: 'easeOutQuart' });
		});
	</script>
    <a href="#" id="toTop"> </a>
    <script type="text/javascript" src="js/navigation.js"></script>
</body>
</html>

