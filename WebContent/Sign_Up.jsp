<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    
	    <title>Sign Up</title>
	
	    <link href="css/bootstrap.min.css" rel="stylesheet">
	    <link href="css/signup.css" rel="stylesheet">
	</head>

	<body>
    	<div class="container">
      		<form class="form-signup" action="_sign_up_.jsp" method="post">

        		<h2 class="form-signup-heading">Please sign up</h2>
        		
        		<label for="inputName" class="sr-only">Name</label>
       			<input type="text" class="form-control" id="inputName" name="username" placeholder="Name (ex. Rob_rhyne)" autofocus>
        		<br>
        		
        		<label for="inputAge" class="sr-only">Age</label>
       			<input type="text" class="form-control" id="inputAge" name="age" placeholder="Age (ex. 27)" autofocus>
        		<br>
        		
        		<select name="role">
				  <option value="customer">Customer</option>
				  <option value="owner">Owner</option>
				</select>
				<br><br>
        		
        		<select name="state">
				 	<option value="Alabama">Alabama</option>
					<option value="Alaska">Alaska</option>
					<option value="Arizona">Arizona</option>
					<option value="Arkansas">Arkansas</option>
					<option value="California">California</option>
					<option value="Colorado">Colorado</option>
					<option value="Connecticut">Connecticut</option>
					<option value="Delaware">Delaware</option>
					<option value="Florida">Florida</option>
					<option value="Georgia">Georgia</option>
					<option value="Hawaii">Hawaii</option>
					<option value="Idaho">Idaho</option>
					<option value="Illinois">Illinois</option>
					<option value="Indiana">Indiana</option>
					<option value="Iowa">Iowa</option>
					<option value="Kansas">Kansas</option>
					<option value="Kentucky">Kentucky</option>
					<option value="Louisiana">Louisiana</option>
					<option value="Maine">Maine</option>
					<option value="Maryland">Maryland</option>
					<option value="Massachusetts">Massachusetts</option>
					<option value="Michigan">Michigan</option>
					<option value="Minnesota">Minnesota</option>
					<option value="Mississippi">Mississippi</option>
					<option value="Missouri">Missouri</option>
					<option value="Montana">Montana</option>
					<option value="Nebraska">Nebraska</option>
					<option value="Nevada">Nevada</option>
					<option value="New Hampshire">New Hampshire</option>
					<option value="New Jersey">New Jersey</option>
					<option value="New Mexico">New Mexico</option>
					<option value="New York">New York</option>
					<option value="North Carolina">North Carolina</option>
					<option value="North Dakota">North Dakota</option>
					<option value="Ohio">Ohio</option>
					<option value="Oklahoma">Oklahoma</option>
					<option value="Oregon">Oregon</option>
					<option value="Pennsylvania">Pennsylvania</option>
					<option value="Rhode Island">Rhode Island</option>
					<option value="South Carolina">South Carolina</option>
					<option value="South Dakota">South Dakota</option>
					<option value="Tennessee">Tennessee</option>
					<option value="Texas">Texas</option>
					<option value="Utah">Utah</option>
					<option value="Vermont">Vermont</option>
					<option value="Virginia">Virginia</option>
					<option value="Washington">Washington</option>
					<option value="West Virginia">West Virginia</option>
					<option value="Wisconsin">Wisconsin</option>
					<option value="Wyoming">Wyoming</option>
				</select>
				
				<br><br>
        		<button class="btn btn-lg btn-primary btn-block" type="submit">Sign Up</button>
      		</form>
    	</div>
	</body>
</html>
