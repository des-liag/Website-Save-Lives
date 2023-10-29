package save_lives_2021_2022;

import java.util.List;
import java.sql.*;
import java.util.ArrayList;

public class LocationDAO {


    /**
     * Find all Regions that exist in the DB
     * 
     * @return
     * @throws Exception
     */
    public List<String> getAllRegions() throws Exception {

        List<String> allRegions = new ArrayList<String>();
        DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
        String sql = "SELECT DISTINCT region FROM location order by region;";

        try {

            con = db.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
            
            while (rs.next()) {
                allRegions.add(rs.getString("region"));
            }

            con = db.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

            return allRegions;
        } catch (Exception e) {

            throw new Exception ("ΚΑΤΙ ΠΗΓΕ ΣΤΡΑΒΑ. " + e.getMessage());

        } finally {

            try {
                db.close();
            } catch (Exception e){
                throw new Exception("Δεν ήταν δυνατή η διακοπή της σύνδεσης με τη Βάση Δεδομένων");
            }
        }
    } // End of getAllRegions


    /**
     * Finds all the areas of a specific region
     * 
     * @param region
     * @return
     * @throws Exception
     */
    public List<String> findArea(String region) throws Exception{

        List<String> areas_of_region = new ArrayList<String>();
        DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
        String sql = "SELECT DISTINCT area_name FROM location WHERE region=? order by area_name;";

        try {

            con = db.getConnection();
			stmt = con.prepareStatement(sql);

            stmt.setString(1, region);

			rs = stmt.executeQuery();

            while (rs.next()){

                areas_of_region.add(rs.getString("area_name"));

            }

            rs.close();
			stmt.close();
			db.close();

			return areas_of_region;

		} catch (Exception e) {

			throw new Exception ("ΚΑΤΙ ΠΗΓΕ ΣΤΡΑΒΑ. " + e.getMessage());

		} finally {

			try {
				db.close();
			} catch (Exception e) {

                throw new Exception ("Δεν ήταν δυνατή η διακοπή της σύνδεσης με τη Βάση Δεδομένων");

			}
		}

    } //End of findArea
    

    /**
     * Finds and returns all the zips that a trained user can go 
     * based on the region and the areas he has declared during his registration as trained
     * 
     * @param region
     * @param areas
     * @return
     * @throws Exception
     */
    public List<String> findZips(String region, List<String>areas) throws Exception {

        List<String> thisusers_zips = new ArrayList<String>();
        DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

        String sql = "SELECT zip FROM location WHERE region=? AND area_name=?;";

        try {

			con = db.getConnection();
			stmt = con.prepareStatement(sql);
			
            stmt.setString(1, region);

            for (String i : areas) {
                stmt.setString(2, i);

                rs = stmt.executeQuery(); 

                while (rs.next()) {
                    thisusers_zips.add(rs.getString("zip"));
                }

            }

            rs.close();
            stmt.close();
            db.close();

            return thisusers_zips;
        } catch (Exception e) {
            throw new Exception ("ΚΑΤΙ ΠΗΓΕ ΣΤΡΑΒΑ. " + e.getMessage());

		} finally {

			try {
				db.close();
			} catch (Exception e) {
                throw new Exception("Δεν ήταν δυνατή η διακοπή της σύνδεσης με τη Βάση Δεδομένων");
			}
		}

    } //End of findZips



    public List<String> findNearestTrainedUser(String emergency_zip, int skill_id) throws Exception {

        List<String> nearTrainedUsersEmails = new ArrayList<String>();
        DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
        String sql = "select us.email from user us, traineduser tu, users_zips uz, trainedskills ts WHERE us.user_id = tu.user_id AND uz.user_id2 = us.user_id  AND ts.user_id1 = tu.user_id AND uz.trained_zip = ? AND ts.skill_id1 = ?;";

        try {

            con = db.getConnection();
            stmt = con.prepareStatement(sql);

            stmt.setString(1, emergency_zip);
            stmt.setInt(2, skill_id);

            rs = stmt.executeQuery();

            boolean flag = false;
            while (rs.next()){
                nearTrainedUsersEmails.add(rs.getString("email"));
                flag = true;
            }

            if  (flag == false){
                rs.close();
                stmt.close();
                return nearTrainedUsersEmails = null;
            }

            rs.close();
            stmt.close();
            db.close();

            return nearTrainedUsersEmails;
        } catch (Exception e) {
            throw new Exception ("ΚΑΤΙ ΠΗΓΕ ΣΤΡΑΒΑ. " + e.getMessage());

		} finally {

			try {
				db.close();
			} catch (Exception e) {
                throw new Exception("Δεν ήταν δυνατή η διακοπή της σύνδεσης με τη Βάση Δεδομένων");
			}
		}

    }

   
}