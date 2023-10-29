package save_lives_2021_2022;

public class Location {
    
    private String region;
    private String area_name;
    private String zip;

    public Location(String region, String area_name, String zip) {
        this.region = region;
        this.area_name = area_name;
        this.zip = zip;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getArea_name() {
        return area_name;
    }

    public void setArea_name(String area_name) {
        this.area_name = area_name;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    

    
}