package sample.dto;

/**
 *
 * @author ACER
 */
public class Account {

    private int accID;
    private String email;
    private String password;
    private String fullname;
    private String phone;
    private int status;
    private int role;
    private String token;

    public Account() {
    }

    public Account(int accID, String email, String password, String fullname, String phone, int status, int role, String token) {
        this.accID = accID;
        this.email = email;
        this.password = password;
        this.fullname = fullname;
        this.phone = phone;
        this.status = status;
        this.role = role;
        this.token = token;
    }

    
    public int getAccID() {
        return accID;
    }

    public void setAccID(int accID) {
        this.accID = accID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

}
