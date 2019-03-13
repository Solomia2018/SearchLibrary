import java.sql.*;

import javax.swing.JOptionPane;
public class Driver {
	static Connection conn;
	Driver(String login,String pass ){
		try{
			conn=DriverManager.getConnection("jdbc:mysql://localhost/library?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",login,pass);
			
		}
		catch(Exception ex){
			JOptionPane.showMessageDialog(null, "Your data is wrong!");
			//ex.printStackTrace();
		}
	}
	public Statement creatStatment() throws SQLException{
		Statement statement=conn.createStatement();
		return statement;
	}
}
