<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    
	    <title>Sign In</title>
	
	    <link href="css/bootstrap.min.css" rel="stylesheet">
	    <link href="css/login.css" rel="stylesheet">
	</head>

	<body>
    	<div class="container">
      		<form class="form-signin" action="_login_.jsp" method="post">
        		<h2 class="form-signin-heading">Please sign in</h2>
        		<label for="inputName" class="sr-only">Name</label>
       			<input type="text" class="form-control" id="inputEmail" name="name" placeholder="Your Name (ex. Rob_Rhyne)" autofocus>
        		<br>
        		<br>
        		<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
        		
        		<br><br><br><br><br><br><br><br>
        		
        		<a href="Sign_Up.jsp" class="btn btn-lg btn-danger btn-block">Need to signup?</a>
      		</form>
    	</div>
	</body>
</html>
