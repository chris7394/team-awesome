<!-- The âCategoriesâ page
At the âCategoriesâ page the owners view and create product categories.
If the accessing user is not an owner, the page should only display that
âthis page is available to owners onlyâ.
The page looks like the âstudentsâ page of the class example,
in the sense that it displays the name and description of each 
category in text box and text area respectively, and offers âInsertâ
, âDeleteâ and âUpdateâ buttons. Each category has a required unique name
(collected by a text box) and a required description
(collected by a small text area). The owners can insert, 
delete and update categories.
The Categories page also offers the links that the Home page offers.
Notes:
5.
Any of the data modifications (insert/delete/update) 
enabled by this page may lead to a violation of a constraint
on category data. For example, one may attempt to update the name of 
a category by placing a null or an empty string in it. Any data 
modification leading to a constraint violation should be prevented, 
the âCategoriesâ page should be redisplayed stating at the top 
that the requested data modification failure 
(referred to as âdata modification failureâ).
It is optional but welcome to explain the reason of the failure. 
(Again, more user-friendly form interaction and verification 
techniques are not necessary at Project 1. We will deploy such later 
with Javascript/Ajax.)
6.
A product category cannot be deleted if there are already products 
belonging to it. In particular, there should be no âDeleteâ button 
next to a product category if this category already has at least one
product.
8.
Be careful of concurrency related bugs where a condition/button
that was applicable when the Categories page was displayed is 
no more applicable at the time the button is clicked. For example, 
it is possible that the owner A sees a âDeleteâ button next to 
product category c, because no product refers to c. While the owner 
A still stares at the page, the owner B creates a product p that 
refers to c. Then A clicks to delete c, since he still sees 
the âDeleteâ button. However, the category c is not deletable 
any more, since products refer to it. You will see that this kind of issue ca
n occur in many more cases. Generally, the pattern is as 
follows: The page allows the user to perform some database 
modification statement (insert/delete/update) x but by the time the user 
clicks to perform x, the situation has changed 
(due to an action of another user) and performing x should not be allowed
any more. Issues of this kind are solved in one of the following two methods. Y
ou may choose either of the twobut the second will cost you a point
:
ï·
[Preferred method] 
Just before issuing the database modification statement x 
the application code checks whether x is still applicable. 
If the action is not applicable any more, the page will report 
data modification failure.
o
Notice the needed use of transactions, which was discussed in lecture: Without 
transactions it is possible that the application code first finds that 
x is still applicable but in the milliseconds between checking and 
performing the modification, another owner has inserted a product 
and the category is not deletable any more.
ï·
[Lesser Method] 
The application code issues the database modification statement x.
When x violates the relevant database constraint, the statement will throw an 
exception. (You should have came up with the database constraint when you 
designed the schema.) The preferred method is better because it 
escalates easier to code that reports the failure reasons -->

<%@ page contentType="text/html" pageEncoding="UTF-8"%>

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

			while (rs.next()) {
				category_names.add(rs.getString("name"));
			}
		} catch (SQLException ex) {
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

	<div id="error" class="main">
		<div class="content">
			<div class="content_top">
				<div class="wrap">This page is available to owners only</div>
			</div>
		</div>
	</div>

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
								<td><form action="_rename_category.jsp" method="post">
									<input
										type="text" class="form-control" id="inputcategory"
										name="new_name" placeholder="New name.." autofocus style="max-width: 300px"> 
									<button name="old_name" value="<%=category_names.get(i)%>" class="btn btn-sm btn-success" type="submit">Rename</button>
								</form></td>
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

