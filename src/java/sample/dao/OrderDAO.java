/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import sample.dto.Order;
import sample.dto.OrderDetail;
import sample.utils.DBUtils;

/**
 *
 * @author ACER
 */
public class OrderDAO {
    
    public static ArrayList<Order> getAllOrders() throws Exception {
        ArrayList<Order> list = new ArrayList<>();
        //step 1: make connection
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            //step 2: viet sql va excute no
            String sql = "select OrderID,OrdDate,shipdate,ord.status,ord.AccID\n"
                    + "from dbo.Orders ord join dbo.Accounts acc\n"
                    + "on ord.AccID=acc.accID";
            Statement st = cn.createStatement();
            ResultSet table = st.executeQuery(sql);
            //step 3: xu li ket qua 
            if (table != null) {
                while (table.next()) {
                    int orderId = table.getInt("OrderID");
                    String ordDate = table.getString("OrdDate");
                    String shipdate = table.getString("shipdate");
                    int status = table.getInt("status");
                    int accId = table.getInt("AccID");
                    Order ord = new Order(orderId, ordDate, shipdate, status, accId);
                    list.add(ord);
                }//het while
            }//het if
            cn.close();
        }
        return list;
    }

    public static ArrayList<Order> getOrders(String email) throws Exception {
        ArrayList<Order> list = new ArrayList<>();
        //step 1: make connection
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            //step 2: viet sql va excute no
            String sql = "select OrderID,OrdDate,shipdate,ord.status,ord.AccID\n"
                    + "from dbo.Orders ord join dbo.Accounts acc\n"
                    + "on ord.AccID=acc.accID\n"
                    + "where acc.email=?";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, email);
            ResultSet table = st.executeQuery();
            //step 3: xu li ket qua 
            if (table != null) {
                while (table.next()) {
                    int orderId = table.getInt("OrderID");
                    String ordDate = table.getString("OrdDate");
                    String shipdate = table.getString("shipdate");
                    int status = table.getInt("status");
                    int accId = table.getInt("AccID");
                    Order ord = new Order(orderId, ordDate, shipdate, status, accId);
                    list.add(ord);
                }//het while
            }//het if
            cn.close();
        }
        return list;
    }

    public static ArrayList<Order> getOrdersByDate(String email,String from, String to) throws Exception {
        ArrayList<Order> list = new ArrayList<>();
        ResultSet table = null;
        //step 1: make connection
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            //step 2: viet sql va excute no
            String sql = "select OrderID,OrdDate,shipdate,ord.status,ord.AccID\n"
                    + "from dbo.Orders ord join dbo.Accounts acc\n"
                    + "on ord.AccID=acc.accID\n"
                    + "where acc.email=?";
            //       + "where ord.OrdDate >= ? and ord.shipdate <= ?";
            if (from == null || from.equals("")) {
                if (to == null || to.equals("")) {
                    PreparedStatement st = cn.prepareStatement(sql);
                    st.setString(1, email);
                    table = st.executeQuery();
                }else{
                    sql += " and ord.shipdate <= ?";
                    PreparedStatement st = cn.prepareStatement(sql);
                    st.setString(1, email);
                    st.setString(2, to);
                    table = st.executeQuery();                    
                }
            } else {
                if (to == null || to.equals("")) {
                    sql += " and ord.OrdDate >= ?";
                    PreparedStatement st = cn.prepareStatement(sql);
                    st.setString(1, email);
                    st.setString(2, from);
                    table = st.executeQuery();
                } else {
                    sql += " and ord.OrdDate >= ? and ord.shipdate <= ?";
                    PreparedStatement st = cn.prepareStatement(sql);
                    st.setString(1, email);
                    st.setString(2, from);
                    st.setString(3, to);
                    table = st.executeQuery();                    
                }
            }
            //step 3: xu li ket qua 
            if (table != null) {
                while (table.next()) {
                    int orderId = table.getInt("OrderID");
                    String ordDate = table.getString("OrdDate");
                    String shipdate = table.getString("shipdate");
                    int status = table.getInt("status");
                    int accId = table.getInt("AccID");
                    Order ord = new Order(orderId, ordDate, shipdate, status, accId);
                    list.add(ord);
                }//het while
            }//het if
            cn.close();
        }
        return list;
    }

    public static ArrayList<Order> getOrdersByDate(String from, String to) throws Exception {
        ArrayList<Order> list = new ArrayList<>();
        ResultSet table = null;
        //step 1: make connection
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            //step 2: viet sql va excute no
            String sql = "select OrderID,OrdDate,shipdate,ord.status,ord.AccID\n"
                    + "from dbo.Orders ord join dbo.Accounts acc\n"
                    + "on ord.AccID=acc.accID";
            //       + "where ord.OrdDate >= ? and ord.shipdate <= ?";
            if (from == null || from.equals("")) {
                if (to == null || to.equals("")) {
                    PreparedStatement st = cn.prepareStatement(sql);
                    table = st.executeQuery();
                }else{
                    sql += " where ord.shipdate <= ?";
                    PreparedStatement st = cn.prepareStatement(sql);
                    st.setString(1, to);
                    table = st.executeQuery();                    
                }
            } else {
                if (to == null || to.equals("")) {
                    sql += " where ord.OrdDate >= ?";
                    PreparedStatement st = cn.prepareStatement(sql);
                    st.setString(1, from);
                    table = st.executeQuery();
                } else {
                    sql += " where ord.OrdDate >= ? and ord.shipdate <= ?";
                    PreparedStatement st = cn.prepareStatement(sql);
                    st.setString(1, from);
                    st.setString(2, to);
                    table = st.executeQuery();                    
                }
            }
            //step 3: xu li ket qua 
            if (table != null) {
                while (table.next()) {
                    int orderId = table.getInt("OrderID");
                    String ordDate = table.getString("OrdDate");
                    String shipdate = table.getString("shipdate");
                    int status = table.getInt("status");
                    int accId = table.getInt("AccID");
                    Order ord = new Order(orderId, ordDate, shipdate, status, accId);
                    list.add(ord);
                }//het while
            }//het if
            cn.close();
        }
        return list;
    }
    public static ArrayList<OrderDetail> getOrderDetail(int orderID) {
        ArrayList<OrderDetail> list = new ArrayList<>();
        //step 1: make connection
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                //step 2: viet sql va excute no
                String sql = "select DetailId,OrderID,PID,PName,price,imgPath,quantity\n"
                        + "from dbo.OrderDetails od join dbo.Plants pl on od.FID=pl.PID\n"
                        + "where OrderID=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, orderID);
                ResultSet rs = pst.executeQuery();
                //step 3: xu li ket qua 
                if (rs != null) {
                    while (rs.next()) {
                        int orderDetailID = rs.getInt("DetailId");
                        int plantID = rs.getInt("PID");
                        String PlantName = rs.getString("PName");
                        int price = rs.getInt("price");
                        String ImgPath = rs.getString("imgPath");
                        int quantity = rs.getInt("quantity");
                        OrderDetail orderdetail = new OrderDetail(orderDetailID, orderID, plantID, PlantName, price, ImgPath, quantity);
                        list.add(orderdetail);
                    }//het while
                }//het if
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    public static ArrayList<Order> getOrders(String email, int status) throws Exception {
        ArrayList<Order> list = new ArrayList<>();
        //step 1: make connection
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            //step 2: viet sql va excute no
            String sql = "select OrderID,OrdDate,shipdate,ord.status,ord.AccID\n"
                    + "from dbo.Orders ord join dbo.Accounts acc\n"
                    + "on ord.AccID=acc.accID\n"
                    + "where acc.email=? and ord.status=? ";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, email);
            pst.setInt(2, status);
            ResultSet table = pst.executeQuery();
//            Statement st = cn.createStatement();
//            ResultSet table = st.executeQuery(sql);
            //step 3: xu li ket qua 
            if (table != null) {
                while (table.next()) {
                    int orderId = table.getInt("OrderID");
                    String ordDate = table.getString("OrdDate");
                    String shipdate = table.getString("shipdate");
                    status = table.getInt("status");
                    int accId = table.getInt("AccID");
                    Order ord = new Order(orderId, ordDate, shipdate, status, accId);
                    list.add(ord);
                }//het while
            }//het if
            cn.close();
        }
        return list;
    }

    public static void updateStatusOrder(String orderID, String status) throws Exception {
        //step 1: make connection
        int result = 0;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "update dbo.Orders set status=?\n"
                    + " where OrderID =? ";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, status);
            pst.setString(2, orderID);
            pst.executeUpdate();
            cn.close();
        }
    }

    public static boolean insertOrder(String email, HashMap<String, Integer> cart) {
        Connection cn = null;
        boolean result = false;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                int accid = 0, orderid = 0;
                cn.setAutoCommit(false);
                String sql = "select accID\n"
                        + "from dbo.Accounts\n"
                        + "where email = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    accid = rs.getInt("accID");
                }
                //insert a new order
                System.out.println("accountid:" + accid);
                Date d = new Date(System.currentTimeMillis());
                System.out.println("order date:" + d);
                sql = "insert dbo.Orders(OrdDate,status,AccID)\n"
                        + "values(?,?,?)";
                pst = cn.prepareStatement(sql);
                pst.setDate(1, d);
                pst.setInt(2, 1);
                pst.setInt(3, accid);
                pst.executeUpdate();
                //get order id that is the largest number
                sql = "select top 1 OrderID\n"
                        + "from dbo.Orders\n"
                        + "order by OrderID desc";
                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    orderid = rs.getInt("OrderID");
                }
                //chen order detail
                System.out.println("orderid:" + orderid);
                for (String pid : cart.keySet()) {
                    sql = "insert dbo.OrderDetails(OrderID,FID,quantity)\n"
                            + "values(?,?,?)";
                    pst = cn.prepareStatement(sql);
                    pst.setInt(1, orderid);
                    pst.setInt(2, Integer.parseInt(pid.trim()));
                    pst.setInt(3, cart.get(pid));
                    pst.executeUpdate();
                    cn.commit();
                    cn.setAutoCommit(true);
                }
                return true;
            } else {
                System.out.println("khong chen order duoc");
            }
        } catch (Exception e) {
            try {
                if (cn != null) {
                    cn.rollback();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
            result = false;
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }
}
