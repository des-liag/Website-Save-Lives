package save_lives_2021_2022;


import java.sql.Date;
import java.sql.Time;



public class Emergency {

    private int emergency_id;
    private Skills type;
    private String emergency_location;
    private String emergency_zip;
    private Date date;
    private Time time;


    public Emergency(Skills type, String emergency_location, String emergency_zip, Date date, Time time) {
        
        this.type = type;
        this.emergency_location = emergency_location;
        this.emergency_zip = emergency_zip;
        this.date = date;
        this.time = time;
    }

    public Emergency(int emergency_id, Skills type, String emergency_location, String emergency_zip, Date date, Time time) {
        this.emergency_id = emergency_id;
        this.type = type;
        this.emergency_location = emergency_location;
        this.emergency_zip = emergency_zip;
        this.date = date;
        this.time = time;
    }

    public int getEmergency_id() {
        return emergency_id;
    }

    public void setEmergency_id(int emergency_id) {
        this.emergency_id = emergency_id;
    }

    public Skills getType() {
        return type;
    }

    public void setType(Skills type) {
        this.type = type;
    }

    public String getEmergency_location() {
        return emergency_location;
    }

    public void setEmergency_location(String emergency_location) {
        this.emergency_location = emergency_location;
    }

    public String getEmergency_zip() {
        return emergency_zip;
    }

    public void setEmergency_zip(String emergency_zip) {
        this.emergency_zip = emergency_zip;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }
  
}