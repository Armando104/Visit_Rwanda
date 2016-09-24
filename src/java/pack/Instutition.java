/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author The Brain Key
 */
public class Instutition {

    private int instutition_id=getMaxID(),domain_id,user_id;
    private String name,accronym,msg,address,reg_date,tel,email,details,acct_no,domain_v,op="SUBMIT",logo,username,password;
    
    public String getName() {
        return name;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
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

    public String getReg_date() {
        return reg_date;
    }

    public void setReg_date(String reg_date) {
        this.reg_date = reg_date;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public void setName(String name) {
        this.name = name;
    }

     

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    

    public String getOp() {
        return op;
    }

    public void setOp(String op) {
        this.op = op;
    }

  
    public static Instutition getInstutitionFromName(String id) {
        Instutition pr = null;
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from entities where name= '" + id + "'");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                pr=new Instutition();
                pr.setInstutition_id(rs.getInt(1));
                pr.setName(rs.getString(2));
                pr.setAccronym(rs.getString(3));
                pr.setAddress(rs.getString(4));
                pr.setTel(rs.getString(5));
                pr.setEmail(rs.getString(6));
                pr.setAcct_no(rs.getString(7));
                 pr.setDomain_id(rs.getInt(8));
                 pr.setLogo(rs.getString(9));
                  pr.setReg_date(rs.getString(10));
                  pr.setUser_id(rs.getInt(11));
                  pr.setDetails(rs.getString(12));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }

    public static Instutition getInstutitionFromID(String id) {
        Instutition pr = null;
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from entities where inst_id= " + id + "");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                pr=new Instutition();
              pr.setInstutition_id(rs.getInt(1));
                pr.setName(rs.getString(2));
                pr.setAccronym(rs.getString(3));
                pr.setAddress(rs.getString(4));
                pr.setTel(rs.getString(5));
                pr.setEmail(rs.getString(6));
                pr.setAcct_no(rs.getString(7));
                 pr.setDomain_id(rs.getInt(8));
                   pr.setLogo(rs.getString(9));
                    pr.setReg_date(rs.getString(10));
                     pr.setUser_id(rs.getInt(11));
                      pr.setDetails(rs.getString(12));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }
    
    public static Instutition getInstutitionFrom_UserID(String id) {
        Instutition pr = null;
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from entities where user_id= " + id + "");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                pr=new Instutition();
              pr.setInstutition_id(rs.getInt(1));
                pr.setName(rs.getString(2));
                pr.setAccronym(rs.getString(3));
                pr.setAddress(rs.getString(4));
                pr.setTel(rs.getString(5));
                pr.setEmail(rs.getString(6));
                pr.setAcct_no(rs.getString(7));
                 pr.setDomain_id(rs.getInt(8));
                   pr.setLogo(rs.getString(9));
                    pr.setReg_date(rs.getString(10));
                     pr.setUser_id(rs.getInt(11));
                      pr.setDetails(rs.getString(12));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }
    
    
    public boolean delete() {
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("delete from entities where inst_id=?");
            pst.setInt(1, instutition_id);

            pst.execute();
            return true;
        } catch (Exception e) {
            System.out.println(">>>>Error Hint>> " + e);
            e.printStackTrace();
            return false;
        }
    }

    public static int getMaxID() {
        int id = 0;
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from entities");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return id + 1;
    }
    public static List<Instutition> getList() {
        List<Instutition> l = new ArrayList<Instutition>();
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from entities");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Instutition pr = new Instutition();
                pr.setInstutition_id(rs.getInt(1));
                pr.setName(rs.getString(2));
                pr.setAccronym(rs.getString(3));
                pr.setAddress(rs.getString(4));
                pr.setTel(rs.getString(5));
                pr.setEmail(rs.getString(6));
                pr.setAcct_no(rs.getString(7));
                 pr.setDomain_id(rs.getInt(8));
                   pr.setLogo(rs.getString(9));
                   pr.setReg_date(rs.getString(10));
                    pr.setUser_id(rs.getInt(11));
                     pr.setDetails(rs.getString(12));
                l.add(pr);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    
    public boolean insert() {
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("insert into entities values(?,?,?,?,?,?,?,?,?,?,?,?)");
            
            pst.setInt(1, getMaxID());
            pst.setString(2, name);
            pst.setString(3, accronym);
            pst.setString(4,address);
            pst.setString(5, tel);
            pst.setString(6, email);
            pst.setString(7, acct_no);
            pst.setInt(8, Domain.getDomainFromName(domain_v).getDomain_id());
            pst.setString(9, logo);
             pst.setString(10, null);
             pst.setInt(11, user_id);
             pst.setString(12,details);
            pst.execute();
            return true;
        } catch (Exception e) {
            System.out.println("errrrorr........." + e);
            e.printStackTrace();
            return false;
        }
    }
//    
// public boolean Update() {
//        try {
//            Connection con = DBClassConnector.getConnection();
//            PreparedStatement pst = con.prepareStatement("update departments set dep_shortname=?,dep_longname=? where dep_id=?");
//
//            //deptid=Integer.parseInt(deptidvalue);
//            pst.setInt(3, dept_id);
//            pst.setString(1, dept_short_name);
//            pst.setString(2, dept_long_name);
//            pst.execute();
//            return true;
//        } catch (Exception e) {
//            System.out.println("errrrorr........." + e);
//            e.printStackTrace();
//            return false;
//        }
//    }
    public Instutition() {
    }

    public int getInstutition_id() {
        return instutition_id;
    }

    public void setInstutition_id(int instutition_id) {
        this.instutition_id = instutition_id;
    }

    public String getAccronym() {
        return accronym;
    }

    public void setAccronym(String accronym) {
        this.accronym = accronym;
    }

    public int getDomain_id() {
        return domain_id;
    }

    public void setDomain_id(int domain_id) {
        this.domain_id = domain_id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAcct_no() {
        return acct_no;
    }

    public void setAcct_no(String acct_no) {
        this.acct_no = acct_no;
    }

    public String getDomain_v() {
        return domain_v;
    }

    public void setDomain_v(String domain_v) {
        this.domain_v = domain_v;
    }

    
    
}
