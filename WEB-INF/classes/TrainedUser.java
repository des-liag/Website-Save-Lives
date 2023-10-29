package save_lives_2021_2022;

import java.util.List;

public class TrainedUser extends User {

    private String phone;
    private String region;
    private List<String> areas;
    private List<Skills> skills;

    public TrainedUser(String name, String surname, String email, String username, String password,
            String phone, String region, List<String> areas, List<Skills> skills) {
        super( name, surname, email, username, password);
        this.phone = phone;
        this.region = region;
        this.areas = areas;
        this.skills = skills;
    }

	public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public List<String> getAreas() {
        return areas;
    }

    public void setAreas(List<String> areas) {
        this.areas = areas;
    }

    public List<Skills> getSkills() {
        return skills;
    }

    public void setSkills(List<Skills> skills) {
        this.skills = skills;
    }
    
}