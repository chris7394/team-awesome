<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

	<% 
		try{
			Class.forName("org.postgresql.Driver");
		} catch(java.lang.ClassNotFoundException e){
			System.err.print("ClassNotFoundException: ");
			System.err.println(e.getMessage());
		}
				
      	try{
			Connection con = DriverManager.getConnection("jdbc:postgresql://localhost/team-awesome");
	   
			int sku_sku = request.getParameter("SKU");
			
			String sqlstr = "SELECT * FROM products WHERE SKU =" + product_sku + ";";

 			Statement st = con.createStatement();
	    	
			ResultSet rs = st.executeQuery(sqlstr);

			String sku_name = rs.next().getString("name");
			int sku_price = rs.next().getInt("price");
			String sku_category = rs.next().getString ("category");

			System.out.println("Edward Snowden's invention has been found. NSA servers can be restarted now..");
	    }
	    catch(SQLException ex){
			System.err.println("SQLException: " + ex.getMessage());
   			response.sendRedirect("access_denied.jsp");
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
								<% print(sku_name); %>
							</h2>
							<div class="price">
								<p>Price: <span><% print(sku_price); %></span></p>
								<p>SKU: <span><% print(sku_sku); %></span></p>
								<p>Category: <span><% print(sku_category); %></span></p>
								
							</div>
							
							<form action="_add_sku_to_cart_.jsp" method="post">

								<div class="share-desc">
								
									<div class="share">
										<p>Number of units :</p><input name="sku_quantity" type="number" class="text_box" value="1" min="1" />				
									</div>
								</div>
								</br></br>
								
								<input type="number" name="SKU" value="<%= print(sku_sku); %>">
								<input type="number" name="SKU_name" value="<%= print(sku_name); %>">
								<input type="number" name="SKU_price" value="<%= print(sku_price); %>">
							
								<button class="btn btn-sm btn-success" type="submit">Add to cart</button>
							</form>	
										
							<div class="clear"></div>
							<h3>Page Info</h3>
							<ul>
								<li>
									<div class="article">
										<p><span>The âProduct Orderâ page displays the current contents of the shopping cart. It also shows the product that was just chosen (by clicking on it in the âProducts Browsingâ) and asks the quantity of it that should be placed in the shopping cart . Upon a quantity being submitted, the shopping cart obtains one or more item. The application transfers the user to the âProducts Browsingâ page. Notes: 12. We do not require any delete/update functionality for the items of the shopping cart. 13. The shopping cart may be either session-scoped (i.e., dismissed when the session expires) or persistent (i.e., it is remembered across multiple visits). You may choose either session-scoped or persistent and state your assumption. 14. You may assume that the same user does not engage in concurrent actions from two browsers. 15. You may assume that there is an infinite supply of all products. So, when a user orders n units of product x, assume that there are nunits available.</span></p>
									</div>
								</li>
							</ul>
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

