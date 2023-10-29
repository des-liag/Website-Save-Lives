package save_lives_2021_2022;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DB {
    
    private final String dbServer = "195.251.249.131";
	private final String dbServerPort = "3306";
	private final String dbName = "ismgroup48";
	private final String dbusername = "ismgroup48";
	private final String dbpassword = "j4t3d3";

	private Connection con = null;

    /**
	 * Establishes a connection with the database, initializes and returns
	 * the Connection object.
	 * 
	 * @return Connection, the Connection object
	 * @throws Exception
	 */
	public Connection getConnection() throws Exception {

		try {

			Class.forName("com.mysql.jdbc.Driver").newInstance();

		} catch (Exception e) {

			throw new Exception("MySQL Driver σφάλμα: " + e.getMessage());
		}

		try {

			con = DriverManager.getConnection("jdbc:mysql://" 
				+ dbServer + ":" + dbServerPort + "/" + dbName, dbusername, dbpassword);

			return con;

		} catch (Exception e) {
			
			throw new Exception("Δεν ήταν δυνατή η σύνδεση με τη Βάση Δεδομένων: " + e.getMessage());
		}

	} // End of getConnection

	/**
	 * Close database connection. It is
	 * very important to close the database connection after it is used.
	 * 
	 * @throws SQLException
	 */
	public void close() throws SQLException {

		try {

			// if connection is (still) open
			if (con != null)
				con.close(); // close the connection to the database to end database session

		} catch (SQLException e) {

			throw new SQLException("Δεν ήταν δυνατή η διακοπή της σύνδεσης με τη Βάση Δεδομένων: " 
				+ e.getMessage());
		}

	}// end of close
    
}