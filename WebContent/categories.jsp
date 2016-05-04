<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
	<title>Categories</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport"
		content="width=device-width, initial-scale=1, maximum-scale=1">
	<link href='http://fonts.googleapis.com/css?family=Ubuntu+Condensed'
		rel='stylesheet' type='text/css'>
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>
	<script src="js/jquery.openCarousel.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/easing.js"></script>
	<script type="text/javascript" src="js/move-top.js"></script>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.util.ArrayList"%>

	<%
		ArrayList<String> category_names = new ArrayList<String>();

		try {
			Class.forName("org.postgresql.Driver");
		} catch (java.lang.ClassNotFoundException e) {
			System.err.print("ClassNotFoundException: ");
			System.err.println(e.getMessage());
		}

		try {
			Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/team-awesome");

			String sqlstr = "SELECT * FROM product_categories";

			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sqlstr);

			while (rs.next()){
				category_names.add(rs.getString("name"));
			}
		} catch (SQLException ex) {
			System.err.println("SQLException: " + ex.getMessage());
		}
		session.setAttribute("role","owner");
		if(session.getAttribute("role") != "owner"){
			response.sendRedirect("owner_error.html");
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

	<div id="main" class="main">
		<div class="content">
			<div class="content_bottom">
				<div class="wrap">
					<form class="form-signin" action="_add_category.jsp"
						method="post">
						<h2 class="form-signin-heading">Insert New category</h2>
						<label for="inputcategory" class="sr-only">category</label> <input
							type="text" class="form-control" id="inputcategory"
							name="category_name" placeholder="A new category (ex. Pants)"
							autofocus> <label for="inputDescription" class="sr-only">Description</label>
						<input type="text" class="form-control" id="inputDescription"
							name="description" placeholder="Description (ex. Denim only)"
							autofocus> <br>
						<button class="btn btn-lg btn-primary" type="submit">Create!</button>
						<br>
						<br>
					</form>

					<table id="category-table"
						class="table table-striped table-bordered table-hover">
						<tbody>

							<%
								for (int i = 0; i < category_names.size(); i++) {
							%>
							<tr>
								<td><%=category_names.get(i)%></td>
								<form action="_rename_category.jsp" method="post">
									<td><input
										type="text" class="form-control" id="inputcategory"
										name="new_name" placeholder="New name.." autofocus style="max-width: 300px"></td> 
									<td><button name="old_name" value="<%=category_names.get(i)%>" class="btn btn-sm btn-success" type="submit">Rename</button></td>
								</form>
								<td><form action="_delete_category.jsp" method="post">
									<button name="category_name" value="<%=category_names.get(i)%>" class="btn btn-sm btn-danger" type="submit">Delete</button>
								</form></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
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

