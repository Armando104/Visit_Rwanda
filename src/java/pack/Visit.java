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
public class Visit {

    private int visit_id,entity_id,visitor_id;
    private Date date;
    private String time,msg,op="SUBMIT";

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
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

  
   public static Visit getVisitFromID(String id) {
        Visit pr = null;
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from visits where visit_id= " + id + "");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                pr=new Visit();
               pr.setVisit_id(rs.getInt(1));
                pr.setTime(rs.getString(2));
                pr.setVisitor_id(rs.getInt(3));
                pr.setEntity_id(rs.getInt(4));
                pr.setDate(rs.getDate(5));
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }

    public static Visit getVisitFromID_Date(String visitor_id,String date,String entity_id) {
        Visit pr = null;
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from visits where visitor_id= " + visitor_id + " and entity_id="+entity_id+" and date='"+date+"'");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                pr=new Visit();
               pr.setVisit_id(rs.getInt(1));
                pr.setTime(rs.getString(2));
                pr.setVisitor_id(rs.getInt(3));
                pr.setEntity_id(rs.getInt(4));
                pr.setDate(rs.getDate(5));
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }
    public boolean delete() {
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("delete from visits where visit_id=?");
            pst.setInt(1, visit_id);

            pst.execute();
            return true;
        } catch (Exception e) {
            System.out.println(">>>>Error Hint>> " + e);
            e.printStackTrace();
            return false;
        }
    }

     public static int getCount(String i) {
        int id = 0;
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select count(time) from visits where entity_id="+i+"");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return id;
    }
    
    public static int getMaxID() {
        int id = 0;
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from visits");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                id = rs.getInt(1);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return id + 1;
    }

     
    
     

    public static List<Visit> getList() {
        List<Visit> l = new ArrayList<Visit>();
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from visits");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Visit pr = new Visit();

                pr.setVisit_id(rs.getInt(1));
                pr.setTime(rs.getString(2));
                pr.setVisitor_id(rs.getInt(3));
                pr.setEntity_id(rs.getInt(4));
                 pr.setDate(rs.getDate(5));
                l.add(pr);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    
    public boolean insert() {
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("insert into visits values(?,?,?,?,?)");
            
            pst.setInt(1, getMaxID());
            pst.setString(2, null);
            pst.setInt(3, visitor_id);
            pst.setInt(4, entity_id);
            pst.setDate(5, new java.sql.Date(new Date().getTime()));
             
            pst.execute();
            con.close();
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
    public Visit() {
    }

    public int getVisit_id() {
        return visit_id;
    }

    public void setVisit_id(int visit_id) {
        this.visit_id = visit_id;
    }

    public int getEntity_id() {
        return entity_id;
    }

    public void setEntity_id(int entity_id) {
        this.entity_id = entity_id;
    }

    public int getVisitor_id() {
        return visitor_id;
    }

    public void setVisitor_id(int visitor_id) {
        this.visitor_id = visitor_id;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    
    
}
