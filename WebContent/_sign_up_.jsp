<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    	<%@ page import="java.sql.*" %>
        <%
	        String username=request.getParameter("username");
        	String role=request.getParameter("role");
	        
        	if(request.getParameter("age") != null && request.getParameter("age").isEmpty()){
	        	response.sendRedirect("bad_signup.jsp");
	        }
        	else if(request.getParameter("username") != null && request.getParameter("username").isEmpty()){
	        	response.sendRedirect("bad_signup.jsp");
	        }
        	else{
        		session.setAttribute("username",username);
        		session.setAttribute("role",role);
        		
        		int age = Integer.parseInt(request.getParameter("age"));
        		session.setAttribute("age",age);
	        	
        		String state=request.getParameter("state");
        		session.setAttribute("state",state);
	        	
	        	try{
					Class.forName("org.postgresql.Driver");
				} 
				catch(java.lang.ClassNotFoundException e){
					System.err.print("ClassNotFoundException: ");
					System.err.println(e.getMessage());
					response.sendRedirect("bad_signup.jsp");
				}
				
	        	try{
	    			Connection con = DriverManager.getConnection("jdbc:postgresql://localhost/team-awesome");
	    			
	    			if (con != null) {
	                    System.out.println("Connected to database... scraping NSA servers now");
	                }
	    			
	    			String sqlstr = "INSERT INTO films (username, role, age, state) VALUES ('" + username + "','" + role + "','" + age + "','" + state + "');";
	    			
	    			Statement st = con.createStatement();
	    			ResultSet rs = st.executeQuery(sqlstr);

	    			System.out.println("Edward Snowden account has been created. NSA servers ar ebeing restarted now..");
	    		} 
	    		catch(SQLException ex) 
	    		{
	    			System.err.println("SQLException: " + ex.getMessage());
	    			response.sendRedirect("bad_signup.jsp");
	    		}
	        	finally {
	        		response.sendRedirect("good_signup.jsp");
	        	}
        	}    
        %>
    </body>
</html>
