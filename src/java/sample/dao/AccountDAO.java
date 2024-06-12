package sample.dao;

import sample.dto.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import sample.utils.DBUtils;

/**
 *
 * @author ACER
 */
public class AccountDAO {

    public static ArrayList<Account> getAllAccounts() throws Exception {
        ArrayList<Account> list = new ArrayList<>();
        //step 1: make connection
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            //step 2: viet sql va excute no
            String sql = "select accID,email,password,fullname,phone,status,role,token\n"
                    + "from dbo.Accounts";
            Statement st = cn.createStatement();
            ResultSet table = st.executeQuery(sql);
            //step 3: xu li ket qua 
            if (table != null) {
                while (table.next()) {
                    int accid = table.getInt("accID");
                    String email = table.getString("email");
                    String password = table.getString("password");
                    String fullname = table.getString("fullname");
                    String phone = table.getString("phone");
                    int status = table.getInt("status");
                    int role = table.getInt("role");
                    String token = table.getString("token");
                    Account acc = new Account(accid, email, password, fullname, phone, status, role, token);
                    list.add(acc);
                }//het while
            }//het if
            cn.close();
        }
        return list;
    }

    public static Account getAccount(String email, String password) throws Exception {
        Account acc = null;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select accID,email,password,fullname,phone,status,role,token\n"
                    + "from dbo.Accounts\n"
                    + "where status = 1 and email = ? and password = ? COLLATE Latin1_General_CS_AS";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, password);
            ResultSet table1 = st.executeQuery();
            if (table1 != null && table1.next()) {
                int accid = table1.getInt("accID");
                String fullname = table1.getString("fullname");
                String phone = table1.getString("phone");
                int status = table1.getInt("status");
                int role = table1.getInt("role");
                String token = table1.getString("token");
                acc = new Account(accid, email, password, fullname, phone, status, role, token);
            }
            cn.close();
        }
        return acc;
    }

    public static int insertAccount(String email, String password, String fullname, String phone, int status, int role) throws Exception {
        int result = 0;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "insert dbo.Accounts(email,password,fullname,phone,status,role)\n"
                    + "values(?,?,?,?,?,?)";
            PreparedStatement pst = cn.prepareStatement(sql);
            //gan input params vao dau ?
            pst.setString(1, email);
            pst.setString(2, password);
            pst.setString(3, fullname);
            pst.setString(4, phone);
            pst.setInt(5, status);
            pst.setInt(6, role);
            result = pst.executeUpdate();
            cn.close();
        }
        return result;
    }

    public static Account getAccount(String email) throws Exception {
        Account acc = null;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select accID,email,password,fullname,phone,status,role,token\n"
                    + "from dbo.Accounts\n"
                    + "where email = ?";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, email);
            ResultSet table1 = st.executeQuery();
            if (table1 != null && table1.next()) {
                int accid = table1.getInt("accID");
                String password = table1.getString("password");
                String fullname = table1.getString("fullname");
                String phone = table1.getString("phone");
                int status = table1.getInt("status");
                int role = table1.getInt("role");
                String token = table1.getString("token");
                acc = new Account(accid, email, password, fullname, phone, status, role, token);
            }
            cn.close();
        }
        return acc;
    }

    public static ArrayList<Account> getAccountByName(String fullname) throws Exception {
        ArrayList<Account> list = new ArrayList();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select accID,email,password,fullname,phone,status,role,token\n"
                    + "from dbo.Accounts\n"
                    + "where fullname like ?";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, "%" + fullname + "%");
            ResultSet table = st.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int accid = table.getInt("accID");
                    String password = table.getString("password");
                    String email = table.getString("email");
                    fullname = table.getString("fullname");
                    String phone = table.getString("phone");
                    int status = table.getInt("status");
                    int role = table.getInt("role");
                    String token = table.getString("token");
                    Account acc = new Account(accid, email, password, fullname, phone, status, role, token);
                    list.add(acc);
                }
            }
            cn.close();
        }
        return list;
    }

    public static void updateAccount(int accID, String name, String phone) throws Exception {
        //step 1: make connection
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "update dbo.Accounts set fullname =?, phone=?\n"
                    + " where accID=?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, name);
            pst.setString(2, phone);
            pst.setInt(3, accID);
            pst.executeUpdate();
            cn.close();
        }
    }

    public static int updateToken(String token, String email) throws Exception {
        //step 1: make connection
        int result = 0;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "update dbo.Accounts set token=?\n"
                    + " where email =?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, token);
            pst.setString(2, email);
            result = pst.executeUpdate();
            cn.close();
        }
        return result;
    }

    public static Account getAccountByToken(String token) throws Exception {
        Account acc = null;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select accID,email,password,fullname,phone,status,role\n"
                    + "from dbo.Accounts\n"
                    + "where token = ?";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, token);
            ResultSet table1 = st.executeQuery();
            if (table1 != null && table1.next()) {
                int accid = table1.getInt("accID");
                String email = table1.getString("email");
                String password = table1.getString("password");
                String fullname = table1.getString("fullname");
                String phone = table1.getString("phone");
                int status = table1.getInt("status");
                int role = table1.getInt("role");
                acc = new Account(accid, email, password, fullname, phone, status, role, token);
            }
            cn.close();
        }
        return acc;
    }

    public static void updateAccountStatus(int status, String email) throws Exception {
        //step 1: make connection
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "update dbo.Accounts set status=?\n"
                    + " where email =?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, status);
            pst.setString(2, email);
            pst.executeUpdate();
            cn.close();
        }
    }
}
