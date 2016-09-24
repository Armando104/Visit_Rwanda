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
import java.util.*;

 
public class Service_Request {

    private int request_id = getMaxID(), service_id, visit_id, qty;
    private String request_datev, details, msg, qtyv, op = "SUBMIT", request_status;
    private Date sending_date, request_date;

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
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

     

    

    public static Service_Request getService_Request_ID(String id) {
        Service_Request pr = null;
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from service_requests where request_id= " + id + "");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                pr = new Service_Request();
                pr.setRequest_id(rs.getInt(1));
                pr.setRequest_date(rs.getDate(2));
                pr.setSending_date(rs.getDate(3));
                pr.setDetails(rs.getString(4));
                pr.setQty(rs.getInt(5));
                pr.setService_id(rs.getInt(6));
                pr.setVisit_id(rs.getInt(7));
                pr.setRequest_status(rs.getString(8));
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }

    public boolean delete() {
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("delete from service_requests where request_id=?");
            pst.setInt(1, request_id);

            pst.execute();
            return true;
        } catch (Exception e) {
            System.out.println(">>>>Error Hint>> " + e);
            e.printStackTrace();
            return false;
        }
    }
     public static int getCount_Rejected(String v) {
        int id = 0;
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from service_requests where request_status like 'rejected' and visitor_id="+v+"");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return id;
    }
      public static int getCount_accepted(String v) {
        int id = 0;
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from service_requests where request_status like 'accepted' and visitor_id="+v+"");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return id;
    }
      
      public static int getCount_Pending_entity(String v) {
        int id = 0;
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from service_requests where request_status like 'pending' and visitor_id="+v+"");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return id;
    }
      
 public static int getCount_Pending(String v) {
        int id = 0;
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from service_requests where request_status like 'pending' and visitor_id="+v+"");
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
            PreparedStatement pst = con.prepareStatement("select * from service_requests");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return id + 1;
    }

    public static List<Service_Request> getList() {
        List<Service_Request> l = new ArrayList<Service_Request>();
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from service_requests");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Service_Request pr = new Service_Request();
                pr.setRequest_id(rs.getInt(1));
                pr.setRequest_date(rs.getDate(2));
                pr.setSending_date(rs.getDate(3));
                pr.setDetails(rs.getString(4));
                pr.setQty(rs.getInt(5));
                pr.setService_id(rs.getInt(6));
                pr.setVisit_id(rs.getInt(7));
                pr.setRequest_status(rs.getString(8));
                
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
            PreparedStatement pst = con.prepareStatement("insert into service_requests values(?,?,?,?,?,?,?,?)");

            pst.setInt(1, getMaxID());
            pst.setString(2, request_datev);
            pst.setString(3, null);
            pst.setString(4, details);
            pst.setInt(5, qty);
            pst.setInt(6, service_id);
            pst.setInt(7, visit_id);
            pst.setString(8, "pending");

            pst.execute();
            return true;
        } catch (Exception e) {
            System.out.println("errrrorr........." + e);
            e.printStackTrace();
            return false;
        }
    }
//    
 public boolean Update_Status(String op,String id) {
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("update service_requests set request_status=? where request_id=?");

            
            pst.setString(1, op);
            pst.setString(2, id);
            pst.execute();
            return true;
        } catch (Exception e) {
            System.out.println("errrrorr........." + e);
            e.printStackTrace();
            return false;
        }
    }

    public Service_Request() {
    }

    public int getRequest_id() {
        return request_id;
    }

    public void setRequest_id(int request_id) {
        this.request_id = request_id;
    }

    public int getService_id() {
        return service_id;
    }

    public void setService_id(int service_id) {
        this.service_id = service_id;
    }

    public int getVisit_id() {
        return visit_id;
    }

    public void setVisit_id(int visit_id) {
        this.visit_id = visit_id;
    }

    public String getRequest_datev() {
        return request_datev;
    }

    public void setRequest_datev(String request_datev) {
        this.request_datev = request_datev;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public String getQtyv() {
        return qtyv;
    }

    public void setQtyv(String qtyv) {
        this.qtyv = qtyv;
    }

    public String getRequest_status() {
        return request_status;
    }

    public void setRequest_status(String request_status) {
        this.request_status = request_status;
    }

    public Date getSending_date() {
        return sending_date;
    }

    public void setSending_date(Date sending_date) {
        this.sending_date = sending_date;
    }

    public Date getRequest_date() {
        return request_date;
    }

    public void setRequest_date(Date request_date) {
        this.request_date = request_date;
    }
}
