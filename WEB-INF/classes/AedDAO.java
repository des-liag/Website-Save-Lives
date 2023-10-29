package save_lives_2021_2022;

import java.sql.*;

public class AedDAO {

    public Aed getAedByZip(String zip) throws Exception{

        final DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
        final String sql = "SELECT * FROM aed WHERE aed_zip=?;";

        try{

            con = db.getConnection();
			stmt = con.prepareStatement(sql);

            stmt.setString(1, zip);

            rs = stmt.executeQuery();
            
            if ( !rs.next() ) {
        
                throw new Exception("Δεν βρέθηκε κοντινός απινιδωτής");
                
            }

        
            Aed thisAed = new Aed(rs.getInt("aed_id"), rs.getString("aed_region"), rs.getString("aed_area"), 
                rs.getString("aed_street"), rs.getString("aed_number"), rs.getString("aed_zip"));
            
            
            rs.close();
            stmt.close();
            db.close();
            
            return thisAed;

        } catch (Exception e) {
            
            throw new Exception (e.getMessage());

        } finally {

            try {
                db.close();
            } catch (Exception e) {
                throw new Exception("Δεν ήταν δυνατή η διακοπή της σύνδεσης με τη Βάση Δεδομένων");
            }

		}	
    } //end of getAedByZip

}