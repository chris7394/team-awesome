<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    	<%@ page import="java.sql.*" %>
        <%
	        if(request.getParameter("age") != null && request.getParameter("age").isEmpty()){
        		session.setAttribute("error_msg", "age was null");
        		response.sendRedirect("bad_signup.jsp");
	        }
        	else if(request.getParameter("username") != null && request.getParameter("username").isEmpty()){
        		session.setAttribute("error_msg", "name was null");
        		response.sendRedirect("bad_signup.jsp");
	        }
        	else{
        		String username=request.getParameter("username");
        		String role=request.getParameter("role");
        		int age = Integer.parseInt(request.getParameter("age"));	
        		String state=request.getParameter("state");
        		
	        	try{
					Class.forName("org.postgresql.Driver");
				} 
				catch(java.lang.ClassNotFoundException e){
					System.err.print("ClassNotFoundException: ");
					System.err.println(e.getMessage());
					session.setAttribute("error_msg", "SQL class was not found");
					response.sendRedirect("bad_signup.jsp");
				}
				
	        	try{
	    			Connection con = DriverManager.getConnection("jdbc:postgresql://localhost/team-awesome");
	    			
	    			if (con == null) {
	    				response.sendRedirect("db_conn_error.jsp");
	                }
	    			
	    			System.out.println("Connected to database... scraping NSA servers now");
	    			
	    			String sqlstr = "INSERT INTO users (username, role, age, state) VALUES ('" + username + "','" + role + "','" + age + "','" + state + "');";
	    			Statement st = con.createStatement();
	    			ResultSet rs = st.executeQuery(sqlstr);

	    			System.out.println("Edward Snowden account has been created. NSA servers ar ebeing restarted now..");
	    			
	    			response.sendRedirect("good_signup.jsp");
	    		} 
	    		catch(SQLException ex){
	    			session.setAttribute("error_msg", "SQL Exception:" + ex.getMessage());
	    			response.sendRedirect("bad_signup.jsp");
	    		}
        	}    
        %>
    </body>
</html>
