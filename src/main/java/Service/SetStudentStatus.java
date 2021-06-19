package Service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SetStudentStatus
 */
@WebServlet("/SetStudentStatus")
public class SetStudentStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SetStudentStatus() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String errorMsg;
		Connection conn = DBConnector.createDBConnection();
		
        if(conn!=null)
        {
            try {
                String sid = request.getParameter("StudentId");
                String status = request.getParameter("status");
                System.out.println("This is id :"+sid);
                System.out.println("This is status :"+status);
                int resultSet = conn.createStatement().executeUpdate("UPDATE student SET status='"+status+"' WHERE sid='"+sid+"';");
                if (resultSet >0) {

                    errorMsg = "Successfully Edited";
                    response.sendRedirect("StudentDetails.jsp");
                } else {
                    errorMsg = "Failed";
                }

            } catch (SQLException ex) {
                //errorMsg = "SQL Error";
                ex.printStackTrace();
                errorMsg = "exist";
            }
        }else {
            errorMsg = "Database connectivity error";
        }
        System.out.println(errorMsg);
    }

}
