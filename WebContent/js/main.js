var userName = 'Owner';

function toggleOwner() { 

	var userNameElement=document.getElementById("userName");
	userName=userNameElement.innerHTML;
	
    var mainElement = document.getElementById('main');
	var errorElement = document.getElementById('error');
				
    //if (session.getAttribute("is_owner") == false) {
	//if(userName != 'Owner'){
	if(userName == 'Owner'){
		mainElement.style.display = 'none';
		errorElement.style.display = 'block';
    }
    else { 
		mainElement.style.display = 'block';
		errorElement.style.display = 'none';
    }
}  