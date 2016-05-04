<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    	<%@ page import="java.sql.*" %>
        <%
	        String name=request.getParameter("username");
        	String role=request.getParameter("role");
	        
        	if(request.getParameter("age") != null && request.getParameter("age").isEmpty()){
	        	response.sendRedirect("bad_signup.jsp");
	        }
        	else if(request.getParameter("username") != null && request.getParameter("username").isEmpty()){
	        	response.sendRedirect("bad_signup.jsp");
	        }
        	else{
        		session.setAttribute("username",name);
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
	    			Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/team-awesome");
	    			
	    			String sqlstr = "INSERT INTO users (name, role, age, state) VALUES ('" + name + "','" + role + "','" + age + "','" + state + "');";
	    			
	    			Statement st = con.createStatement();
	    			st.executeUpdate(sqlstr);

	    			response.sendRedirect("good_signup.jsp");
	    		} 
	    		catch(SQLException ex) 
	    		{
	    			System.err.println("SQLException: " + ex.getMessage());
	    			response.sendRedirect("bad_signup.jsp");
	    		}
        	}    
        %>
    </body>
</html>
