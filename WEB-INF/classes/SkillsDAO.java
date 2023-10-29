package save_lives_2021_2022;

import java.util.List;
import java.sql.*;
import java.util.ArrayList;

public class SkillsDAO {

        /**
     * Find all Skills that exist in the DB
     * 
     * @return
     * @throws Exception
     */

    public List<Skills> getAllSkills() throws Exception {

        final List<Skills> allSkills = new ArrayList<Skills>();
        final DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
        final String sql = "SELECT * FROM skill;";

        try {

            con = db.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
            
            while (rs.next()) {
                
                allSkills.add( new Skills(rs.getInt("skill_id"), rs.getString("skill_name") ) );
            }

            con = db.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

            return allSkills;
        } catch (Exception e) {

            throw new Exception ("ΚΑΤΙ ΠΗΓΕ ΣΤΡΑΒΑ. " + e.getMessage());

        } finally {

            try {
                db.close();
            } catch (Exception e){
                throw new Exception("Δεν ήταν δυνατή η διακοπή της σύνδεσης με τη Βάση Δεδομένων");
            }
        }
    } // End of getAllSkills



    public String getSkillName(int id) throws Exception {

        final DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
        final String sql = "SELECT skill_name FROM skill WHERE skill_id=?;";

        try {

            con = db.getConnection();
			stmt = con.prepareStatement(sql);

            stmt.setInt(1, id);

			rs = stmt.executeQuery();

            String skill_name = null;
            while (rs.next()) {

             skill_name = rs.getString("skill_name");
            }

            rs.close();
			stmt.close();
			db.close();
			
			return skill_name;

        } catch (Exception e) {

            throw new Exception ("ΚΑΤΙ ΠΗΓΕ ΣΤΡΑΒΑ. " + e.getMessage());

        } finally {

            try {
                db.close();
            } catch (Exception e){
                throw new Exception("Δεν ήταν δυνατή η διακοπή της σύνδεσης με τη Βάση Δεδομένων");
            }
        }

    
    } // End of getSkillName
    
}