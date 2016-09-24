/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

 
public class User {

    private int user_id=getMaxID();
    private String username,names, usernamemsg;
    private String password, passwordmsg,user_status;
    private String role, rolemsg,msg,msg1,log;

    public int getUser_id() {
        return user_id;
    }

    public String getMsg1() {
        return msg1;
    }

    public void setMsg1(String msg1) {
        this.msg1 = msg1;
    }

    public String getUser_status() {
        return user_status;
    }

    public void setUser_status(String user_status) {
        this.user_status = user_status;
    }

    public String getNames() {
        return names;
    }

    public void setNames(String names) {
        this.names = names;
    }

    public String getLog() {
        return log;
    }

    public void setLog(String log) {
        this.log = log;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public User() {
    }

    

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
 public static int getMaxID() {
        int id = 10190;
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from users");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return id + 1;
    }
    public boolean insert() {
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("insert into users values(?,?,?,?,?,?)");
            pst.setInt(1, getMaxID());
            
            pst.setString(2, names);
            pst.setString(3, username);
            pst.setString(4, password);
            pst.setString(5, role);
            pst.setString(6, "unlocked");
            
            pst.execute();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

 

    public void tt(List<String> l) {
    }

    public static void main(String args[]) {
        System.out.println(Service.getMaxID());
    }

    public static List<User> getUserList() {
        List<User> l = new ArrayList<User>();
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from users");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                User pr = new User();
                pr.setUser_id(rs.getInt(1));
                pr.setNames(rs.getString(2));
                pr.setUsername(rs.getString(3));
                pr.setPassword(rs.getString(4));
                pr.setRole(rs.getString(5));
                pr.setUser_status(rs.getString(6));
                
                l.add(pr);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }
 public static User getUser(String Citizen_id) {
        User pr = null;
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from users where usr_username='" + Citizen_id + "'");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                pr = new User();

                pr.setUser_id(rs.getInt(1));
                pr.setNames(rs.getString(2));
                pr.setUsername(rs.getString(3));
                pr.setPassword(rs.getString(4));
                pr.setRole(rs.getString(5));
                pr.setUser_status(rs.getString(6));
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }
    public static User getUser_ID(String Citizen_id) {
        User pr = null;
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from users where user_id=" + Citizen_id + "");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                pr = new User();
                pr.setUser_id(rs.getInt(1));
                pr.setNames(rs.getString(2));
                pr.setUsername(rs.getString(3));
                pr.setPassword(rs.getString(4));
                pr.setRole(rs.getString(5));
                pr.setUser_status(rs.getString(6));
               
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }
    public boolean UnlockUser(String op) {
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("update users set usr_status='"+op+"' where usr_username=?");
            
            
            pst.setString(1, username);
             
            pst.execute();
            return true;
        } catch (Exception ex) {
                JOptionPane.showMessageDialog(null,ex);
            return false;
        }

    }
public boolean lockUser() {
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("update users set usr_status='locked' where username=?");
            
            
            pst.setString(1, username);
             
            pst.execute();
            return true;
        } catch (Exception ex) {
                JOptionPane.showMessageDialog(null,ex);
            return false;
        }

    }
  
 public boolean update_Password() {
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("update users set password=? where username=?");
            
            pst.setString(1, password);
            pst.setString(2, username);
             
            pst.execute();
            return true;
        } catch (Exception ex) {
                 ex.printStackTrace();
            return false;
        }

    }
  public boolean updateOnline() {
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("update users set log=? where username=?");
            
            pst.setString(1, "on");
            pst.setString(2, username);
             
            pst.execute();
            return true;
        } catch (Exception ex) {
                 ex.printStackTrace();
            return false;
        }

    }

    public boolean delete() {
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("delete from users where user_id=?");

            pst.setInt(1, user_id);
            pst.execute();
            con.close();
            return true;
        } catch (Exception ex) {

            return false;
        }

    }
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUsernamemsg() {
        return usernamemsg;
    }

    public void setUsernamemsg(String usernamemsg) {
        this.usernamemsg = usernamemsg;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPasswordmsg() {
        return passwordmsg;
    }

    public void setPasswordmsg(String passwordmsg) {
        this.passwordmsg = passwordmsg;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getRolemsg() {
        return rolemsg;
    }

    public void setRolemsg(String rolemsg) {
        this.rolemsg = rolemsg;
    }
}
