<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    	<%@ page import="java.sql.*" %>
        <%
	        String name=request.getParameter("name");
        
        	if(request.getParameter("name") == null && request.getParameter("name").isEmpty()){
        		response.sendRedirect("access_denied.jsp");	
        	}
        	else{
        		
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
	    			
	    			String sqlstr = "SELECT * FROM users WHERE name='" + name + "');";
	    			
	    			Statement st = con.createStatement();
	    			ResultSet rs = st.executeQuery(sqlstr);

	    			System.out.println("Edward Snowden account has been found. NSA servers are being restarted now..");
	         		
	    			if(!rs.next()){
	    				response.sendRedirect("access_denied.jsp");
	    			}
	    			else{
	    				session.setAttribute("name",name);
	            		response.sendRedirect("home.jsp");
	    			}
	    		} 
	    		catch(SQLException ex){
	    			System.err.println("SQLException: " + ex.getMessage());
	    			response.sendRedirect("access_denied.jsp");
	    		}
        	}
        %>
    </body>
</html>
