import java.sql.*;

public class Signup {
	public int signupProcess(User user) throws ClassNotFoundException {
		String INSERT_USER = "INSERT INTO Signup(Email, FName, LName, Password) VALUES ('%s','%s', '%s', '%s');";
		int result = 0;
		Class.forName("com.mysql.cj.jdbc.Driver");
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/fittmedb", "root", "root");
			PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER)){
				preparedStatement.setString(1, user.getEmail());
				preparedStatement.setString(2, user.getFName());
				preparedStatement.setString(3, user.getLName());
				preparedStatement.setString(4, user.getPassword());
			
			System.out.print(preparedStatement);
			result = preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
		
	}
}