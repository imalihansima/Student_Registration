package Service;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class StudentRegistration
 */
@WebServlet("/StudentRegistration")
public class StudentRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public StudentRegistration() {
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String errorMsg ;
        Connection con=DBConnector.createDBConnection();
        
        if(con!=null){
            try{

              String sid=request.getParameter("sid");
          	  String fname=request.getParameter("fname");
          	  String address=request.getParameter("address");
          	  String dob=request.getParameter("dob");
          	  String nic=request.getParameter("nic");
          	  String email=request.getParameter("email");
          	  String tel=request.getParameter("tel");
          	  String uname=request.getParameter("uname");
          	  String password=request.getParameter("password");

                int ResultSet  = con.createStatement().executeUpdate("INSERT INTO student (sid, name, address, dob, nic, email, tel, username, password) VALUES ('"+sid+"', '"+fname+"', '"+address+"','"+dob+"','"+nic+"','"+email+"','"+tel+"','"+uname+"','"+password+"');");
                if (ResultSet>0) {

                  errorMsg = "Successfully inserted";
                  response.sendRedirect("Registration.jsp");
                } else {
                    errorMsg = "Failed";
                }

            }catch (Exception ex){
                ex.printStackTrace();
                errorMsg = "exist";
            }
        }else{
            errorMsg = "Database connectivity error";
        }
	}
}
