<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
	        String username=request.getParameter("username");
	        String password=request.getParameter("password");
	        
	        if((username.equals("garet") && password.equals("yoloswag"))){
	           	session.setAttribute("username",username);
	           	response.sendRedirect("home.jsp");
	        }
	        else{
	            response.sendRedirect("access_denied.jsp");
	        }
        %>
    </body>
</html>
