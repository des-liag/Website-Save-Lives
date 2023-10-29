package save_lives_2021_2022;


public class User {
 
    private String name;
    private String surname;
    private String email;
    private String username;
    private String password;

    /**
     * Full constructor 
     * 
     * @param name
     * @param surname
     * @param email
     * @param username
     * @param password
     */

    public User(String name, String surname, String email, String username, String password) {
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.username = username;
        this.password = password;
        
    }

    

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getUserId(String username) throws Exception{
        UserDAO ds = new UserDAO();
        int id = ds.getUser_id(username);
        return id;
    }
}