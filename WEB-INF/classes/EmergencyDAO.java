package save_lives_2021_2022;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class EmergencyDAO {

    /**
     * Saves a new emergency in the database
     * 
     * @param newEmergency
     * @throws Exception
     */
    public void saveNewEmergency(Emergency newEmergency) throws Exception {

        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;

        String sql = "INSERT INTO emergency (emergency_loc, emer_date, emer_time, emergency_type, emergency_zip)"
                + "VALUES (?, ?, ?, ?, ?);";

        try {

            con = db.getConnection();

            stmt = con.prepareStatement(sql);

            stmt.setString(1, newEmergency.getEmergency_location());
            stmt.setDate(2, newEmergency.getDate());
            stmt.setTime(3, newEmergency.getTime());
            stmt.setInt(4, newEmergency.getType().getSkill_id());
            stmt.setString(5, newEmergency.getEmergency_zip());

            stmt.executeUpdate();

            stmt.close();
            db.close();

        } catch (Exception e) {

            throw new Exception ("ΚΑΤΙ ΠΗΓΕ ΣΤΡΑΒΑ. " + e.getMessage());

        } finally {

            try {
                db.close();

            } catch (Exception e) {
                throw new Exception("Δεν ήταν δυνατή η διακοπή της σύνδεσης με τη Βάση Δεδομένων");

            }

        }

    } // End of saveNewEmergency


    /**
     * Returns a list af all the emergencies
     *  
     * @return
     * @throws Exception
     */
    public List<Emergency> viewAllEmergencies() throws Exception {

        List<Emergency> all_emer = new ArrayList<Emergency>();
        DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
        PreparedStatement stmt1 = null;
        ResultSet rs1 = null;
        String sql = "SELECT * FROM emergency;";
        String sql1 = "SELECT area_name FROM skill WHERE skill_id=?;";

        try {

            con = db.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

            while (rs.next()){

                stmt1 = con.prepareStatement(sql1);
                stmt1.setInt(1, rs.getInt("emergency_type"));

                rs1 = stmt1.executeQuery();


                Skills emer_type = new Skills(rs.getInt("emergency_type"), rs1.getString("skill_name"));


                all_emer.add(new Emergency(rs.getInt("emergency_id"), emer_type, rs.getString("emergency_loc"), rs.getString("emergency_zip"), rs.getDate("emer_date"), rs.getTime("emer_time")));

            }

            rs.close();
            rs1.close();
            stmt.close();
            stmt1.close();
            db.close();

            return all_emer;
        } catch (Exception e) {
            throw new Exception ("ΚΑΤΙ ΠΗΓΕ ΣΤΡΑΒΑ. " + e.getMessage());

		} finally {

			try {
				db.close();
			} catch (Exception e) {
                throw new Exception("Δεν ήταν δυνατή η διακοπή της σύνδεσης με τη Βάση Δεδομένων");

			}
		}
           
    } //End of viewAllEmergencies



}