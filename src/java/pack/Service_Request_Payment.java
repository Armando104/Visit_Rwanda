/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pack;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
 

 
 public class Service_Request_Payment implements Serializable {
    private static final long serialVersionUID = 1L;
   
    private Integer paymentId=getMaxID();
   
    private Date paymentDate;
    private Integer amount;
    
    private Integer requestId;

    public Service_Request_Payment() {
    }

    public boolean insert() {
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("insert into service_request_payments values(?,?,?,?)");
            pst.setInt(1, paymentId);
            pst.setDate(2, new java.sql.Date(paymentDate.getTime()));
            pst.setString(3, amount+"");
            pst.setString(4, requestId+"");
           
            pst.execute();



            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static List<Service_Request_Payment> getList() {
        List<Service_Request_Payment> l = new ArrayList<Service_Request_Payment>();
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from service_request_payments");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Service_Request_Payment pr = new Service_Request_Payment();
                pr.setPaymentId(rs.getInt(1));
                pr.setPaymentDate(rs.getDate(2));
                pr.setAmount(rs.getInt(3));

                pr.setRequestId(rs.getInt(4));
                l.add(pr);
            }
        } catch (Exception e) {
        }
        return l;
    }

    
    
    public static Service_Request_Payment getPayment_Request_ID(String id) {
        Service_Request_Payment pr = null;
        System.out.println(" ID:--->"+id);
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from service_request_payments where request_id=" + id + "");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                pr = new Service_Request_Payment();
                pr.setPaymentId(rs.getInt(1));
                pr.setPaymentDate(rs.getDate(2));
                pr.setAmount(rs.getInt(3));

             pr.setRequestId(rs.getInt(4));
                 System.out.println(" PAYMENT:--->"+pr);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }
    

    public static Service_Request_Payment getPayment_id(String id) {
        Service_Request_Payment pr = null;
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select * from service_request_payments where payment_id=" + id + "");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                pr = new Service_Request_Payment();
                pr.setPaymentId(rs.getInt(1));
                pr.setPaymentDate(rs.getDate(2));
                pr.setAmount(rs.getInt(3));

               pr.setRequestId(rs.getInt(4));
                

            }
        } catch (Exception e) {
        }
        return pr;
    }

    public static int getSum_Of_Paid_Amount(String h) {
        int id = 0;
        System.out.println("ID:"+h);
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("select sum(amount) from service_request_payments where request_id="+h+"");
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
            PreparedStatement pst = con.prepareStatement("select * from service_request_payments");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return id + 1;
    }

//    public boolean update() {
//        try {
//            Connection con = DBClassConnector.getConnection();
//            PreparedStatement pst = con.prepareStatement("update service_request_payments set names=?,address=?,email=?,tel=? where client_id=?");
//            pst.setString(1, names);
//            pst.setString(2, address);
//            pst.setString(3, email);
//            pst.setString(4, tel);
//            pst.setInt(5, clientId);
//            {
//                pst.execute();
//            }
//
//            pst.execute();
//            return true;
//        } catch (Exception e) {
//            System.out.println(">>>>Error Hint>> " + e);
//            e.printStackTrace();
//            return false;
//        }
//    }

    public boolean delete() {
        try {
            Connection con = DBClassConnector.getConnection();
            PreparedStatement pst = con.prepareStatement("delete from service_request_payments where  payment_id=?");

            pst.setInt(1, paymentId);
            pst.execute();
            con.close();
            return true;
        } catch (Exception ex) {

            return false;
        }

    }

    public Service_Request_Payment(Integer paymentId) {
        this.paymentId = paymentId;
    }

    public Integer getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(Integer paymentId) {
        this.paymentId = paymentId;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public Integer getRequestId() {
        return requestId;
    }

    public void setRequestId(Integer requestId) {
        this.requestId = requestId;
    }

    

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (paymentId != null ? paymentId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Service_Request_Payment)) {
            return false;
        }
        Service_Request_Payment other = (Service_Request_Payment) object;
        if ((this.paymentId == null && other.paymentId != null) || (this.paymentId != null && !this.paymentId.equals(other.paymentId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "OfficePayment{" + "paymentId=" + paymentId + ", paymentDate=" + paymentDate + ", amount=" + amount + " =" + requestId + '}';
    }

     
    
}
