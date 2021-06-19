package Service;

import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public Login() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String errorMsg;
		
	     Connection con=DBConnector.createDBConnection();
	    
	     String uname=request.getParameter("uname");
	     String password=request.getParameter("password");
	     
	     if(uname.equals(null)||password.equals(null)) {
	  
	    	 RequestDispatcher rd2=request.getRequestDispatcher("Login.jsp");
             rd2.include(request,response);
	    	 
	     }else {
	    	 
	    	 try {
	    		 PreparedStatement ps= con.prepareStatement("select * from user where uname=? and password=?");
	    			 
	    			 ps.setString(1, uname);
	    			 ps.setString(2, password);

	             ResultSet rs = ps.executeQuery();
				
	             if(rs.next()) {
					
					response.sendRedirect("Registration.jsp");
				}else {
					 errorMsg=("Username or Password incorrect");
			    	 request.setAttribute("error_messege",errorMsg);
					RequestDispatcher rd2=request.getRequestDispatcher("Login.jsp");
                    rd2.include(request,response);
				}
			} catch (Exception ex) {
				ex.printStackTrace();
                request.setAttribute("exit", ex);
			}
	     }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
