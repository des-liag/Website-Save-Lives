package save_lives_2021_2022;

public class Skills {

    private int skill_id;
    private String skill_name;

    public Skills(final int skill_id, final String skill_name) {
        this.skill_id = skill_id;
        this.skill_name = skill_name;
    }

    public int getSkill_id() {
        return skill_id;
    }

    public void setSkill_id(final int skill_id) {
        this.skill_id = skill_id;
    }

    public String getSkill_name() {
        return skill_name;
    }

    public void setSkill_name(final String skill_name) {
        this.skill_name = skill_name;
    }
   
}