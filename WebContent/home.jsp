<!DOCTYPE HTML>
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
					<li><a href="buyShoppingCart.html">Buy Shopping Cart</a></li>
				</ul>
				<span class="left-ribbon"> </span> <span class="right-ribbon">
				</span>
			</div>
		</div>
	</div>
   <!------------End Header ------------>
	<div class="main">
		<div class="content">
			<!-- <div class="content_top">
    	        <div class="wrap">
					<h3>Latest Products</h3>
		        </div>
		        <div class="line"> </div>
					<div class="wrap">
				</div>    		
    	    </div> -->
			<div class="content_bottom">
				<div class="wrap">
					<div class="content-bottom-left">
						<div class="categories">
							<ul>
								<h3>Browse All Categories</h3>
								<li><a href="#">Appliances</a></li>
								<li><a href="#">Sports Equipments</a></li>
								<li><a href="#">Computers & Electronics</a></li>
								<li><a href="#">Office supplies</a></li>
								<li><a href="#">Health & Beauty</a></li>
								<li><a href="#">Home & Garden</a></li>
								<li><a href="#">Apparel</a></li>
								<li><a href="#">Toys & Games</a></li>
								<li><a href="#">Automotive</a></li>
							</ul>
						</div>		
					</div>
					<div class="content-bottom-right">
						<h3>Browse All Categories</h3>
						<div class="section group">
							<div class="grid_1_of_4 images_1_of_4">
								<h4><a href="preview.html">Whirlpool LTE5243D 3.4 CuFt.... </a></h4>
								<a href="preview.html"><img src="images/product-img1.jpg" alt="" /></a>
								<div class="price-details">
									<div class="price-number">
										<p><span class="rupees">$839.93 </span></p>
									</div>
									<div class="add-cart">								
										<h4><a href="preview.html">More Info</a></h4>
									</div>
									<div class="clear"></div>
								</div>					 
							</div>
							<div class="grid_1_of_4 images_1_of_4">
								<h4><a href="preview.html">Whirlpool LTE5243D 3.4 CuFt.... </a></h4>
								<a href="preview.html"><img src="images/product-img2.jpg" alt="" /></a>
								<div class="price-details">
								    <div class="price-number">
										<p><span class="rupees">$839.93 </span></p>
									</div>
										<div class="add-cart">								
											<h4><a href="preview.html">More Info</a></h4>
										</div>
									<div class="clear"></div>
								</div>
							</div>
							<div class="grid_1_of_4 images_1_of_4">
								<h4><a href="preview.html">Whirlpool LTE5243D 3.4 CuFt.... </a></h4>
								<a href="preview.html"><img src="images/product-img3.jpg" alt="" /></a>
								<div class="price-details">
								   <div class="price-number">
										<p><span class="rupees">$839.93 </span></p>
									</div>
										<div class="add-cart">								
											<h4><a href="preview.html">More Info</a></h4>
										</div>
									<div class="clear"></div>
								</div>
							</div>
							<div class="grid_1_of_4 images_1_of_4">
								<h4><a href="preview.html">Whirlpool LTE5243D 3.4 CuFt.... </a></h4>
								<a href="preview.html"><img src="images/product-img4.jpg" alt="" /></a>
								<div class="price-details">
								    <div class="price-number">
										<p><span class="rupees">$839.93 </span></p>
									</div>
									<div class="add-cart">								
										<h4><a href="preview.html">More Info</a></h4>
									</div>
									<div class="clear"></div>
								</div>
							 </div>
						</div>
						<div class="section group">
							<div class="grid_1_of_4 images_1_of_4">
								<h4><a href="preview.html">Whirlpool LTE5243D 3.4 CuFt.... </a></h4>
								<a href="preview.html"><img src="images/product-img1.jpg" alt="" /></a>
								<div class="price-details">
									<div class="price-number">
										<p><span class="rupees">$839.93 </span></p>
									</div>
									<div class="add-cart">								
										<h4><a href="preview.html">More Info</a></h4>
									</div>
									<div class="clear"></div>
								</div>					 
							</div>
							<div class="grid_1_of_4 images_1_of_4">
								<h4><a href="preview.html">Whirlpool LTE5243D 3.4 CuFt.... </a></h4>
								<a href="preview.html"><img src="images/product-img2.jpg" alt="" /></a>
								<div class="price-details">
									<div class="price-number">
										<p><span class="rupees">$839.93 </span></p>
									</div>
									<div class="add-cart">								
										<h4><a href="preview.html">More Info</a></h4>
									</div>
									<div class="clear"></div>
								</div>
							</div>
							<div class="grid_1_of_4 images_1_of_4">
								<h4><a href="preview.html">Whirlpool LTE5243D 3.4 CuFt.... </a></h4>
								<a href="preview.html"><img src="images/product-img3.jpg" alt="" /></a>
								<div class="price-details">
								   <div class="price-number">
										<p><span class="rupees">$839.93 </span></p>
									</div>
									<div class="add-cart">								
										<h4><a href="preview.html">More Info</a></h4>
									</div>
									<div class="clear"></div>
								</div>
							</div>
							<div class="grid_1_of_4 images_1_of_4">
								<h4><a href="preview.html">Whirlpool LTE5243D 3.4 CuFt.... </a></h4>
								<a href="preview.html"><img src="images/product-img4.jpg" alt="" /></a>
								<div class="price-details">
								    <div class="price-number">
										<p><span class="rupees">$839.93 </span></p>
									</div>
									<div class="add-cart">								
										<h4><a href="preview.html">More Info</a></h4>
									</div>
									<div class="clear"></div>
								</div>
							</div>
						</div>
						<div class="product-articles">
							<h3>Browse All Categories</h3>
							<ul>
								<li>
									<div class="article">
										<p><span>Aenean vitae massa dolor</span></p>
										<p>Phasellus in quam dui. Nunc ornare, tellus rutrum porttitor imperdiet, dui leo molestie nisl, sit amet dignissim nibh magna pharetra quam. Nunc ultrices pellentesque massa, ac adipiscing dui rutrum id. In cursus augue non erat faucibus eu condimentum dolor molestie.</p>
										<p><a href="#">+ Read Full article</a></p>
									</div>
								</li>
								<li>
									<div class="article">
										<p><span>Phasellus sollicitudin consectetur</span></p>
										<p>Cras aliquam, odio ac consectetur tincidunt, eros nunc fermentum augue, quis rutrum ante lectus ac lectus. Fusce sed tellus orci, et feugiat urna. Integer et dictum leo. Nulla consectetur tempus orci sed consequat. Mauris cursus est a sapien venenatis faucibus. Etiam sagittis convallis volutpat.</p>
										<p><a href="#">+ Read Full article</a></p>
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

