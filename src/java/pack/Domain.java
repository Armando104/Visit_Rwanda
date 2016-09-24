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
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

/**
 *
 * @author The Brain Key
 */
public class Domain {

    private int domain_id;
    private String name,description,msg,op="SUBMIT";

    public int getDomain_id() {
        return domain_id;
    }

    public void setDomain_id(int domain_id) {
        this.domain_id = domain_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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

  
    public static Domain getDomainFromName(String id) {
        Domain pr = null;
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from domains where name= '" + id + "'");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                pr=new Domain();
               pr.setDomain_id(rs.getInt(1));
                pr.setName(rs.getString(2));
                pr.setDescription(rs.getString(3));
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }

    public static Domain getDomainFromID(String id) {
        Domain pr = null;
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from domains where domain_id= " + id + "");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                pr=new Domain();
               pr.setDomain_id(rs.getInt(1));
                pr.setName(rs.getString(2));
                pr.setDescription(rs.getString(3));
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }
    public boolean delete() {
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("delete from domains where domain_id=?");
            pst.setInt(1, domain_id);

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
            PreparedStatement pst = con.prepareStatement("select * from domains");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return id + 1;
    }

     
    
     

    public static List<Domain> getList() {
        List<Domain> l = new ArrayList<Domain>();
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from domains");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Domain pr = new Domain();

                pr.setDomain_id(rs.getInt(1));
                pr.setName(rs.getString(2));
                pr.setDescription(rs.getString(3));
                
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
            PreparedStatement pst = con.prepareStatement("insert into domains values(?,?,?)");
            
            pst.setInt(1, getMaxID());
            pst.setString(2, name);
            pst.setString(3, description);
             
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
    public Domain() {
    }

    
    
}
