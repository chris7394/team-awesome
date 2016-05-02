var userName = 'Owner';

function toggleOwner() { 

	//var userNameElement=document.getElementById("userName");
	//userName=userNameElement.innerHTML;
	
    var mainElement = document.getElementById('main');
	var errorElement = document.getElementById('error');
				
    //if (session.getAttribute("is_owner") == true) {
	if(userName == 'Owner'){
		//display main, hide error
		mainElement.style.display = 'block';
		errorElement.style.display = 'none';

    }
    else { 
		//display error, hide main
		mainElement.style.display = 'none';
		errorElement.style.display = 'block';
    }
}  