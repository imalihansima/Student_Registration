package Service;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnector {
	static Connection connection;

    public static Connection createDBConnection()
    {
        try {
            Class.forName("com.mysql.jdbc.Driver");

            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentregistration", "root", "");

            return connection;
        } catch (Exception e) {
             e.printStackTrace();
            return null;
        }
    }
}
