package save_lives_2021_2022;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TrainedUserDAO {


    /**
     *  Gets the list of skills a trained user has
     * 
     * @param user_id
     * @return
     * @throws Exception
     */
    public List<Skills> getTrainedUserSkills(int user_id) throws Exception {

        List<Skills> skills = new ArrayList<Skills>();
        DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

        String sql = "SELECT skill_id, skill_name FROM trainedskills, skill WHERE skill_id1 = skill_id AND user_id1 = ?;";
        
        try {

            con = db.getConnection();
			stmt = con.prepareStatement(sql);
			
            stmt.setInt(1, user_id);
            rs = stmt.executeQuery();

            while (rs.next()){
                skills.add(new Skills(rs.getInt("skill_id"), rs.getString("skill_name")));

            }

            rs.close();
			stmt.close();
			db.close();

			return skills;
		} catch (Exception e) {

			throw new Exception ("ΚΑΤΙ ΠΗΓΕ ΣΤΡΑΒΑ. " + e.getMessage());

		} finally {

			try {
				db.close();
			} catch (Exception e) {

                throw new Exception("Δεν ήταν δυνατή η διακοπή της σύνδεσης με τη Βάση Δεδομένων");

			}
		}
    } //End of getTrainedUserSkills
    

    /**
     * Registers an existing user as trained and updates database tables trained, users_zips and trainedskills
     * 
     * @param username
     * @param phone
     * @param region
     * @param areas
     * @param skills contains the skill_id of the skills this trained user has 
     */
    public void registerAsTrainedUser(TrainedUser newTrainedUser) throws Exception{

        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        
        
        String sql = "INSERT INTO traineduser (user_id, region, phone) VALUES (?, ?, ?);";

        String sql1 = "INSERT INTO trainedskills (user_id1, skill_id1) VALUES (?, ?);";

        String sql2 = "INSERT INTO users_zips (user_id2, trained_zip) VALUES (?, ?);";

        try {

            con = db.getConnection();

            //updates table traineduser
            stmt = con.prepareStatement(sql);

            stmt.setInt(1, newTrainedUser.getUserId(newTrainedUser.getUsername()));
            stmt.setString(2, newTrainedUser.getRegion());
            stmt.setString(3, newTrainedUser.getPhone());

            stmt.executeUpdate();


            //updates table trainedskills
            stmt = con.prepareStatement(sql1);

            stmt.setInt(1, newTrainedUser.getUserId(newTrainedUser.getUsername()));
            
            for (Skills i : newTrainedUser.getSkills()){

                stmt.setInt(2, i.getSkill_id()) ;

                stmt.executeUpdate();
            }

            //updates table users_zips

            stmt = con.prepareStatement(sql2);

            LocationDAO locdao = new LocationDAO();
            List<String> ziplist = new ArrayList<String>();
            ziplist = locdao.findZips(newTrainedUser.getRegion(), newTrainedUser.getAreas());

            stmt.setInt(1, newTrainedUser.getUserId(newTrainedUser.getUsername()));

            for (String zip : ziplist ){

                stmt.setString(2, zip);

                stmt.executeUpdate();
            }

			stmt.close();
			db.close();

        } catch (Exception e) {

			throw new Exception ("ΚΑΤΙ ΠΗΓΕ ΣΤΡΑΒΑ. " + e.getMessage());

		} finally {

			try {
				db.close();
			} catch (Exception e) {

                throw new Exception ("Δεν ήταν δυνατή η διακοπή της σύνδεσης με τη Βάση Δεδομένων");

			}
		}
    } //End of registerAsTrainedUser


    /**
     * Finds the Skill list of a traineduser
     * 
     * @param user_id
     * @return
     * @throws Exception
     */
    public List<Skills> getUserSkills(int user_id) throws Exception{

        List<Skills> skill_list = new ArrayList<Skills>();
        DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

        String sql = "SELECT skill_id, skill_name FROM trainedskills, skill WHERE user_id1=?; AND skill_id1 = skill_id;";

        try{
            con = db.getConnection();
			stmt = con.prepareStatement(sql);

            stmt.setInt(1, user_id);
			rs = stmt.executeQuery();

            while (rs.next()){
                skill_list.add(new Skills(rs.getInt("skill_id"), rs.getString("skill_name")));
            }
            rs.close();
			stmt.close();
			db.close();
            return skill_list;

        } catch (Exception e) {

			throw new Exception ("ΚΑΤΙ ΠΗΓΕ ΣΤΡΑΒΑ. " + e.getMessage());

		} finally {

			try {
				db.close();
			} catch (Exception e) {

                throw new Exception ("Δεν ήταν δυνατή η διακοπή της σύνδεσης με τη Βάση Δεδομένων");

			}
		}
    } //End of getUserSkills

   /**
     * Finds the if trained User exist by email
     * 
     * @param user_id
     * @return
     * @throws Exception
     */
    public List<String> ifExistsTrainedUser(String email) throws Exception{

        List<String> info = new ArrayList<String>();
        DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

        String sql = "select name, surname, phone from user, traineduser where email = ?;";

        try{
            con = db.getConnection();
			stmt = con.prepareStatement(sql);

            stmt.setString(1, email);
			rs = stmt.executeQuery();

            while (rs.next()){
                info.add("name");
                info.add("surname");
                info.add("phone");
            }
            rs.close();
			stmt.close();
			db.close();

            return info;

        } catch (Exception e) {

			throw new Exception ("ΚΑΤΙ ΠΗΓΕ ΣΤΡΑΒΑ. " + e.getMessage());

		} finally {

			try {
				db.close();
			} catch (Exception e) {

                throw new Exception ("Δεν ήταν δυνατή η διακοπή της σύνδεσης με τη Βάση Δεδομένων");

			}
		}
    } //End of ifExistsTrainedUser

    public boolean ifExistsTrainedUser(int user_id) throws Exception{

        DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

        String sql = "select * from traineduser where  user_id= ?;";

        try{
            con = db.getConnection();
			stmt = con.prepareStatement(sql);

            stmt.setInt(1, user_id);
			rs = stmt.executeQuery();

            if (rs.next()){
                throw new Exception("Είστε ήδη εγγεγραμμένος ως εκπαιδευμένος στις Α΄ βοήθειες");
            }
            rs.close();
			stmt.close();
			db.close();

        } catch (Exception e) {

			throw new Exception (e.getMessage());

		} finally {

			try {
				db.close();
			} catch (Exception e) {

                throw new Exception ("Δεν ήταν δυνατή η διακοπή της σύνδεσης με τη Βάση Δεδομένων");

			}
		}
        return false;
    }
      
    
}