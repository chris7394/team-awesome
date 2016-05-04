<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
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
	<script type="text/javascript" src="js/main.js"></script>
</head>
<body>

	<%@ page import="java.sql.*"%>
	<%@ page import="java.util.ArrayList"%>

	<%
		ArrayList<String> product_names = new ArrayList<String>();
		ArrayList<String> product_skus = new ArrayList<String>();
		ArrayList<String> product_prices = new ArrayList<String>();
		
		ArrayList<String> category_names = new ArrayList<String>();

		try {
			Class.forName("org.postgresql.Driver");
		} catch (java.lang.ClassNotFoundException e) {
			System.err.print("ClassNotFoundException: ");
			System.err.println(e.getMessage());
		}

		try {
			Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/team-awesome");

			String category = request.getParameter("category");
			
			String  = "SELECT * FROM product_categories WHERE name=" + category + ";"";
			
			String sqlstr = "SELECT * FROM product WHERE category=" + category + ";";

			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sqlstr);
			
			while (rs.next()) {
				product_names.add(rs.getString("name"));
				product_skus.add(rs.getString("sku"));
				product_prices.add(rs.getString("price"));
			}
			
			String sqlstr2 = "SELECT * FROM product_categories";

			Statement st2 = con.createStatement();
			ResultSet rs2 = st2.executeQuery(sqlstr2);
			
			while (rs2.next()) {
				category_names.add(rs.getString("name"));
			}
				
		} catch (SQLException ex) {
			System.err.println("SQLException: " + ex.getMessage());
		}
	%>
	
	<div class="header">
		<div class="wrap">
			<div class="header_top">
				<div class="logo">CSE 135 E-Commerce Website</div>

				<div class="header_top_name">
					Hello <span id="userName">Owner</span>!
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
					<li><a href="buyShoppingCart.html">Buy Shopping Cart</a></li>
				</ul>
				<span class="left-ribbon"> </span> <span class="right-ribbon">
				</span>
			</div>
		</div>
	</div>
	<!------------End Header ------------>
	
	<div id="main" class="main">
		<div class="content">
			<div class="content_bottom">
				<div class="wrap">
					<div class="content-bottom-left">
						<div class="categories">
							<ul>
								<h3>Browse All Categories</h3>
								<% 
									category_names.add("Pants");
									category_names.add("Shirt");
								for (int i = 0; i < category_names.size(); i++) {%>
								<li><a href="productsBrowsing.jsp?category=<%=category_names.get(i)%>"><%=category_names.get(i)%></a></li>
								<% } %>
							</ul>
						</div>		
					</div>
					
					<div class="content-bottom-right">						
						<div class="product-articles">
							
							<h3>Browse products by category (<%=request.getParameter("category")%>)</h3>
							
							<div class="search_box">
								<span>Search by product name</span> </br>
								<form>
									<input type="text" value=""><input type="submit" value="">
								</form>
								</br> </br>
								<div class="clear"></div>
							</div>

							<table id="category-table" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>Product Name</th>
										<th>SKU</th>
										<th>Price</th>
										<th>Add</th>	
									</tr>
								</thead>
									<%
										product_names.add("Pants");
										product_names.add("Shirt");
										product_skus.add("00001");
										product_skus.add("00002");
										product_prices.add("99.99");
										product_prices.add("49.99");
										for (int i = 0; i < product_names.size(); i++) {
									%>
									<tr>
										<td><%=product_names.get(i)%></td>
										<td><%=product_skus.get(i)%></td>
										<td><%=product_prices.get(i)%></td>
										<td><button class="btn btn-sm btn-success" onclick="location.href='productOrder.jsp?sku=<%=product_skus.get(i)%>'" type="submit">Add</button></td>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>
		
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