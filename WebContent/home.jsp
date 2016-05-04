<!DOCTYPE HTML>
<html>
<head>
	<title>CSE 135 website</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link href='http://fonts.googleapis.com/css?family=Ubuntu+Condensed' rel='stylesheet' type='text/css'>
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
	<script type="text/javascript" src="js/jquery-1.9.0.min.js"></script> 
	<script src="js/jquery.openCarousel.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/easing.js"></script>
	<script type="text/javascript" src="js/move-top.js"></script>
</head>
<body>
	<div class="header">
		<div class="wrap">
			<div class="header_top">
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
					<div class="content-bottom-left">
					</div>
						Why is there no content on the home page? I don't know, ask the person who wrote this crazy spec.
					<div class="clear"></div>
				</div>
			</div>
      </div>
    </div>
	<div class="footer">
		<div class="wrap">	
			<div class="copy_right">
				<p>Why do we have a footer again?</p>
			</div>	
			<div class="footer-nav">
				<ul>
					<li><a href="#">Terms of Use</a> : </li>
					<li><a href="#">Privacy Policy</a> : </li>
					<li><a href="contact.html">Contact Us</a> : </li>
					<li><a href="#">Sitemap</a></li>
				</ul>
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

