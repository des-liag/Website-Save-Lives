package save_lives_2021_2022;

import java.sql.*;


public class UserDAO {


    /**
     * Register/ create new user.
     * 
     * @param user, User
     * @throws Exception
     */

    public void register(User user) throws Exception {

        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        String sqlCheck = "SELECT * FROM user WHERE username=? OR email=?;";

        String sql = "INSERT INTO user (name, surname, email, username, password)"
        + "VALUES (?, ?, ?, ?, ?)";

        try {
            
            con = db.getConnection();

            stmt = con.prepareStatement(sqlCheck);
            
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getEmail());

            rs = stmt.executeQuery();

            if ( rs.next() ) {
                rs.close();
                stmt.close();
                throw new Exception("Το όνομα χρήστη ή το email υπάρχουν ήδη.");

            }

            stmt = con.prepareStatement(sql);

            // setting parameters
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getSurname());
            stmt.setString(3, user.getEmail());
            stmt.setString(4, user.getUsername());
            stmt.setString(5, user.getPassword());

            stmt.executeUpdate();

            stmt.close();
            db.close();

        } catch (Exception e) {

            throw new Exception (e.getMessage());

        } finally {

            try {
                db.close();
				
            } catch (Exception e) {
				throw new Exception("Δεν ήταν δυνατή η διακοπή της σύνδεσης με τη Βάση Δεδομένων");
                
            }

        }
		
	}//end of register


    /**
     * Finds the unique user_id that is created automatically 
     * in the database once a user is registered
     * 
     * @param username
     * @return user_id 
      * @throws Exception if username isn't valid 
     */
    public int getUser_id(String username) throws Exception {

        DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
        String sql = "SELECT user_id FROM user WHERE username=?;";

        try {
            con = db.getConnection();
            stmt = con.prepareStatement(sql);

            stmt.setString(1, username);

            rs = stmt.executeQuery();

            if ( !rs.next() ) {

                rs.close(); 
                stmt.close();
                throw new Exception("Το όνομα χρήστη: " + username + "δεν βρέθηκε");

            }

            int user_id = rs.getInt("user_id");

            rs.close();
			stmt.close();
			db.close();

            return user_id;
        } catch (Exception e) {

            throw new Exception ("ΚΑΤΙ ΠΗΓΕ ΣΤΡΑΒΑ. " + e.getMessage());

        } finally {

            try {
                db.close();
            } catch (Exception e) {
                throw new Exception("Δεν ήταν δυνατή η διακοπή της σύνδεσης με τη Βάση Δεδομένων");
            }

        }

    } //End of getUser_id

    /**
     * Deletes user from DB
     * @param user
     * @throws Exception
     */

    public void delete(User user) throws Exception {

        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        String sqlCheck = "SELECT * FROM user WHERE username=?;";

        String sql = "DELETE FROM user WHERE username=?; ";

        try {
            
            con = db.getConnection();

            stmt = con.prepareStatement(sqlCheck);
            
            stmt.setString(1, user.getUsername());

            rs = stmt.executeQuery();

            if ( rs.next() ) {
                rs.close();
                stmt.close();
                throw new Exception("Αυτό το όνομα χρήστη δεν υπάρχει");

            }

            stmt = con.prepareStatement(sql);

            stmt.setString(1, user.getUsername());

            stmt.executeUpdate();

            stmt.close();
            db.close();

        } catch (Exception e) {

            throw new Exception (e.getMessage());

        } finally {

            try {
                db.close();
				
            } catch (Exception e) {
				throw new Exception("Δεν ήταν δυνατή η διακοπή της σύνδεσης με τη Βάση Δεδομένων");
                
            }

        }
		
	} //end of delete



    /**
     * Checks if the username and password are correct
     * @param username
     * @param password
     * @return
     * @throws Exception, if credentials are wrong
     */
    public User checkLoginParam(String username, String password) throws Exception {

        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM user WHERE username=? AND password=?;";

        try {
            con = db.getConnection();
            stmt = con.prepareStatement(sql);

            stmt.setString(1, username);
            stmt.setString(2, password);

            rs = stmt.executeQuery();

            if ( !rs.next() ) {

                throw new Exception("ΛΑΘΟΣ ΟΝΟΜΑ ΧΡΗΣΤΗ Ή ΚΩΔΙΚΟΣ ΠΡΟΣΒΑΣΗΣ");

            }

            User user = new User( rs.getString("name"),
                rs.getString("surname"), rs.getString("email"), rs.getString("username"),
                 rs.getString("password") );

            rs.close();
            stmt.close();
            db.close();
            
            return user;

        } catch (Exception e) {
            
            throw new Exception (e.getMessage());

        } finally {

            try {
                db.close();
            } catch (Exception e) {
                
            }

		}	
		
	} //End of checkLoginParam
	

    /**
     * Updates the user's personal info
     * 
     * @param newUserinfo, all the information in the update form even if some is the same
     * @param currentusername the current username that is used to make the update 
     * @throws Exception  
     */
    public void editProfile(User newUserinfo, String currentusername) throws Exception {

        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;

        String sql = "UPDATE user SET `name` =? , `surname` =?, `email` =?, `username` =?, `password` =? WHERE `username` =? ;";

        try {
            
            con = db.getConnection();
            stmt = con.prepareStatement(sql);

            stmt.setString(1, newUserinfo.getName());
            stmt.setString(2, newUserinfo.getSurname());
            stmt.setString(3, newUserinfo.getEmail());
            stmt.setString(4, newUserinfo.getUsername());
            stmt.setString(5, newUserinfo.getPassword());
            stmt.setString(6, currentusername);

            stmt.executeQuery();

            stmt.close();
            db.close();

        } catch (Exception e) {

            throw new Exception ("ΚΑΤΙ ΠΗΓΕ ΣΤΡΑΒΑ. " + e.getMessage());
 
        }  finally {

            try {
                db.close();
            } catch (Exception e) {
                throw new Exception ("Δεν ήταν δυνατή η διακοπή της σύνδεσης με τη Βάση Δεδομένων");
            }
        }
    }   // end of editProfile 

    

    







}