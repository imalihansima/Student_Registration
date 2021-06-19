package Service;

import java.io.IOException;
import java.security.Provider.Service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class LoginStudent
 */
@WebServlet("/LoginStudent")
public class LoginStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginStudent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String errorMsg ;
	     Connection con=DBConnector.createDBConnection();
	     
	     String uname=request.getParameter("uname");
	     String password=request.getParameter("password");
	    String status ="1";
	     if(uname.equals(null)||password.equals(null)) {
	    	 RequestDispatcher rd2=request.getRequestDispatcher("Login.jsp");
             rd2.include(request,response);
	     }else {
	    	
	    	 try {
	    		 PreparedStatement pre= con.prepareStatement("select * from student where username=? and password=? and status=? ");

	    			 pre.setString(1, uname);
	    			 pre.setString(2, password);
	    			 pre.setString(3, status);

	             ResultSet rs = pre.executeQuery(); 
	             
	             if(rs.next()) {
						
						response.sendRedirect("Home.jsp");
					}else {
						
						 errorMsg=("Username or Password incorrect");
				    	request.setAttribute("error_messege",errorMsg);
						RequestDispatcher rd2=request.getRequestDispatcher("Login.jsp");
	                    rd2.include(request,response);
					}
			} catch (Exception ex) {
				ex.printStackTrace();
               errorMsg = "exist";
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
