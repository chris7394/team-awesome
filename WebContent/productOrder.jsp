<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<title>CSE 135 website</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link href='http://fonts.googleapis.com/css?family=Ubuntu+Condensed' rel='stylesheet' type='text/css'>
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<script type="text/javascript" src="js/jquery-1.9.0.min.js"></script> 
	<script src="js/jquery.openCarousel.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/easing.js"></script>
	<script type="text/javascript" src="js/move-top.js"></script>
</head>
<body>
	<%@ page import="java.sql.*"%>

	<% 
		String sku_sku = "00000";
		String name = "Sorry, Product Deleted";
		String price = "0";
		String category = "None";
	
		try{
			Class.forName("org.postgresql.Driver");
		} 
		catch(java.lang.ClassNotFoundException e){
			session.setAttribute("error_msg","ClassNotFoundException: " + e.getMessage());
			response.sendRedirect("error.jsp");
		}
				
      	try{
			Connection con = DriverManager.getConnection("jdbc:postgresql://localhost/team-awesome");
	   
			if(request.getParameter("sku") == null){
				session.setAttribute("error_msg","You stumbled here by accident. This isn't the page you are looking for.");
				response.sendRedirect("error.jsp");
			}
			
			int sku_sku = request.getParameter("sku");
			
			String sqlstr = "SELECT * FROM products WHERE sku=" + sku_sku.toString() + ";";

 			Statement st = con.createStatement();
	    	
			ResultSet rs = st.executeQuery(sqlstr);
			
			while (rs.next()){
				name = rs.getString("name");
				price = rs.getString("price");
				category = rs.getString ("category");
			}
	    }
	    catch(SQLException ex){
			System.err.println("SQLException: " + ex.getMessage());
  		}						
	%>
	<div class="header">
		<div class="wrap">
			<div class="header_top">
				<div class="header_top_name">
					<%
            			if(session.getAttribute("username") != null){
            				String username = session.getAttribute("username").toString();
            				out.println("Hello  "+username);
            			}
            			else{
            				out.println("<a class='header_top_name' href='index.jsp'>Login / Signup</a>");
            			}
            		%>
				</div> 
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
						<div class="product-articles">
							<h2>
								<%= name %>
							</h2>
							<div class="price">
								<p>Price: <span><%= price %></span></p>
								<p>SKU: <span><%= sku_sku %></span></p>
								<p>Category: <span><%= category %></span></p>
							</div>
							
							<form action="_add_sku_to_cart_.jsp" method="post">

								<div class="share-desc">
								
									<div class="share">
										<p>Number of units :</p><input name="sku_quantity" type="number" class="text_box" value="1" min="1" />				
									</div>
								</div>
								</br></br>
								
								<div style="display:none;">
									<input type="text" name="SKU" value="<%= sku_sku %>">
									<input type="text" name="SKU_name" value="<%= name %>">
									<input type="text" name="SKU_price" value="<%= price %>">
								</div>
								
								<button class="btn btn-sm btn-success" type="submit">Add to cart</button>
							</form>	
										
							<div class="clear"></div>

						</div>
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

