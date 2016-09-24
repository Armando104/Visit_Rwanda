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

public class Service {

    private int service_id=getMaxID(), cost, duration,entity_id;
    private String name, description, costv, duration_msg="(Days)", durationv,entity_v, msg, op = "SUBMIT";

    public String getDuration_msg() {
        return duration_msg;
    }

    public void setDuration_msg(String duration_msg) {
        this.duration_msg = duration_msg;
    }

    public int getService_id() {
        return service_id;
    }

    public void setService_id(int service_id) {
        this.service_id = service_id;
    }

    public int getCost() {
        return cost;
    }

    public void setCost(int cost) {
        this.cost = cost;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public String getCostv() {
        return costv;
    }

    public void setCostv(String costv) {
        this.costv = costv;
    }

    public String getDurationv() {
        return durationv;
    }

    public void setDurationv(String durationv) {
        this.durationv = durationv;
    }

    public int getEntity_id() {
        return entity_id;
    }

    public void setEntity_id(int entity_id) {
        this.entity_id = entity_id;
    }

    public String getEntity_v() {
        return entity_v;
    }

    public void setEntity_v(String entity_v) {
        this.entity_v = entity_v;
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

    public static Service getPublic_ServiceFromName(String id) {
        Service pr = null;
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from services where service_name= '" + id + "'");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                pr = new Service();
                pr.setService_id(rs.getInt(1));
                pr.setName(rs.getString(2));
                pr.setDescription(rs.getString(3));
                pr.setCost(rs.getInt(4));
                pr.setDuration(rs.getInt(5));
                pr.setEntity_id(rs.getInt(6));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }

    public static Service getPublic_ServiceFromID(String id) {
        Service pr = null;
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from services where service_id= " + id + "");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                pr = new Service();
                pr.setService_id(rs.getInt(1));
                pr.setName(rs.getString(2));
                pr.setDescription(rs.getString(3));
                pr.setCost(rs.getInt(4));
                pr.setDuration(rs.getInt(5));
                pr.setEntity_id(rs.getInt(6));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }
//    public boolean delete() {
//        try {
//            Connection con = DBClassConnector.getConnection();
//            PreparedStatement pst = con.prepareStatement("delete from domains where domain_id=?");
//            pst.setInt(1, domain_id);
//
//            pst.execute();
//            return true;
//        } catch (Exception e) {
//            System.out.println(">>>>Error Hint>> " + e);
//            e.printStackTrace();
//            return false;
//        }
//    }
    
    
    public static int getCount_Services_Per_Entity(String ent) {
        int id = 0;
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select count(cost) from services where entity_id="+ent+"");
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
            PreparedStatement pst = con.prepareStatement("select * from services");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return id + 1;
    }

    public static List<Service> getList() {
        List<Service> l = new ArrayList<Service>();
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from services");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Service pr = new Service();

                pr.setService_id(rs.getInt(1));
                pr.setName(rs.getString(2));
                pr.setDescription(rs.getString(3));
                pr.setCost(rs.getInt(4));
                pr.setDuration(rs.getInt(5));
                 pr.setEntity_id(rs.getInt(6));

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
            PreparedStatement pst = con.prepareStatement("insert into services values(?,?,?,?,?,?)");

            pst.setInt(1, service_id);
            pst.setString(2, name);
            pst.setString(3, description);
            pst.setString(4, costv);
            pst.setString(5, durationv);
            pst.setInt(6,entity_id);

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

    public Service() {
    }
}
