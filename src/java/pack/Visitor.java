/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.*;

public class Visitor {
  
    private String names,tel,telmsg, email, msg="",namesmsg, username, password,address,occupation,nationality;
    private int user_id,citizen_id;
    private boolean valid = true;

    public String getNamesmsg() {
        return namesmsg;
    }

    public void setNamesmsg(String namesmsg) {
        this.namesmsg = namesmsg;
    }

    public int getCitizen_id() {
        return citizen_id;
    }

    public void setCitizen_id(int citizen_id) {
        this.citizen_id = citizen_id;
    }

    
    public String getTelmsg() {
        return telmsg;
    }

    public void setTelmsg(String telmsg) {
        this.telmsg = telmsg;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
        try {
            long n=Long.parseLong(tel);
           
            if (tel.length() != 10) {
                telmsg = "<h3 style=color:red>Only Ten Numbers are required</h3>";
                valid = false;
            } 
        } catch (Exception e) {
             telmsg = "<h3 style=color:red>Please Use Only Numbers</h3>";
                        valid = false;
        }
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

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
public static Visitor getVisitor_ID(String id) {
        Visitor pr = null;
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from visitors where visitor_id= " + id + "");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                pr = new Visitor();
               pr.setCitizen_id(rs.getInt(1));
                pr.setNames(rs.getString(2));
                pr.setAddress(rs.getString(3));
                pr.setTel(rs.getString(5));
                pr.setEmail(rs.getString(4));
                pr.setOccupation(rs.getString(6));
             
                pr.setUser_id(rs.getInt(7));
                 pr.setNationality(rs.getString(8));
           }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }
    public static Visitor getVisitor_email(String id) {
        Visitor pr = null;
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from visitors where email= '" + id + "'");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                pr = new Visitor();
              pr.setCitizen_id(rs.getInt(1));
                pr.setNames(rs.getString(2));
                pr.setAddress(rs.getString(3));
                pr.setTel(rs.getString(5));
                pr.setEmail(rs.getString(4));
                pr.setOccupation(rs.getString(6));
             
                pr.setUser_id(rs.getInt(7));
                pr.setNationality(rs.getString(8));
           }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }

    public static Visitor getVisitor_USER_ID(String id) {
        Visitor pr = null;
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from visitors where user_id=" + id + "");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                pr = new Visitor();
                pr.setCitizen_id(rs.getInt(1));
                pr.setNames(rs.getString(2));
                pr.setAddress(rs.getString(3));
                pr.setTel(rs.getString(5));
                pr.setEmail(rs.getString(4));
                pr.setOccupation(rs.getString(6));
             
                pr.setUser_id(rs.getInt(7));
                pr.setNationality(rs.getString(8));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }

    public static List<Visitor> getList() {
        List<Visitor> l = new ArrayList<Visitor>();
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from visitors");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Visitor pr = new Visitor();
                pr.setCitizen_id(rs.getInt(1));
                pr.setNames(rs.getString(2));
                pr.setAddress(rs.getString(3));
                pr.setTel(rs.getString(5));
                pr.setEmail(rs.getString(4));
                pr.setOccupation(rs.getString(6));
             
                pr.setUser_id(rs.getInt(7));
                pr.setNationality(rs.getString(8));
                
                l.add(pr);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    

    public static int getMax_ID() {
        int max = 0;
       
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from visitors");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                max = rs.getInt(1);
                
            }
            max++;
 



        } catch (Exception e) {
            e.printStackTrace();
        }
        return max;
    }

    
    public boolean insert() {
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("insert into visitors values(?,?,?,?,?,?,?,?)");
            pst.setInt(1,getMax_ID());
            pst.setString(2, names);
            pst.setString(3, address);

            pst.setString(5, tel);
            pst.setString(4, email);
             
            pst.setString(6, occupation);
              
            pst.setInt(7, user_id);
              pst.setString(8, nationality);
            pst.execute();

            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
//     public boolean update() {
//        try {
//            Connection con = DBClassConnector.getConnection();
//            PreparedStatement pst = con.prepareStatement("update clients set names=?,addres=?,tel=?,email=?,nid=? where client_id=?");
//            pst.setInt(6,client_id);
//            pst.setString(1, names);
//            pst.setString(2, address);
//
//            pst.setString(3, tel);
//            pst.setString(4, email);
//             
//            pst.setString(5, nid);
//               
//             
//            pst.execute();
//
//            return true;
//        } catch (Exception e) {
//            e.printStackTrace();
//            return false;
//        }
//    }
//    public boolean delete() {
//        try {
//            Connection con = DBClassConnector.getConnection();
//            PreparedStatement pst = con.prepareStatement("delete from clients  where client_id=?");
//            pst.setInt(1,client_id); 
//             
//            pst.execute();
//
//            return true;
//        } catch (Exception e) {
//            e.printStackTrace();
//            return false;
//        }
//    }

       
  

   
//    public void setFname(String fname) {
//        this.fname = fname;
//        try {
//            if (fname.length() < 3) {
//                fnamemsg = "Too Short Names ";
//                valid = false;
//            } else {
//                String[] p = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"};
//                for (int i = 0; i < p.length; i++) {
//                    if (fname.contains(p[i])) {
//                        fnamemsg = "Remove Numbers ";
//                        valid = false;
//                        break;
//                    }
//
//                }
//
//
//            }
//        } catch (Exception e) {
//        }
//
//
//
//    }

   
   
  
   
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

     
     
    public boolean isValid() {
        return valid;
    }

    public void setValid(boolean valid) {
        this.valid = valid;
    }

    public String getNames() {
        return names;
    }

    public void setNames(String names) {
        this.names = names;
                try {
            if (names.length() < 3) {
                namesmsg = "<h3 style=color:red>Too Short Names</h3> ";
                valid = false;
            } else {
                String[] p = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"};
                for (int i = 0; i < p.length; i++) {
                    if (names.contains(p[i])) {
                        namesmsg = "<h3 style=color:red>Remove Numbers </h3>";
                        valid = false;
                        break;
                    }

                }


            }
        } catch (Exception e) {
        }
    }

    public String getOccupation() {
        return occupation;
    }

    public void setOccupation(String occupation) {
        this.occupation = occupation;
    }

  

     

    

   

   
   

    
}
