/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import sample.dto.Plant;
import sample.utils.DBUtils;

/**
 *
 * @author ACER
 */
public class PlantDAO {

    public static ArrayList<Plant> getPlants(String keyword, String searchby) throws Exception {
        ArrayList<Plant> list = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null && searchby != null) {
            String sql = "select PID,PName,price,imgPath,description,status,Plants.CateID as 'CateID',CateName\n"
                    + "from Plants join Categories on Plants.CateID=Categories.CateID\n";
            if (searchby.equalsIgnoreCase("byname")) {
                sql = sql + "where Plants.PName like ?";
            } else {
                sql = sql + "where CateName like ?";
            }
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, "%" + keyword + "%");
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int PID = rs.getInt("PID");
                    String PName = rs.getString("PName");
                    int price = rs.getInt("price");
                    String imgPath = rs.getString("imgPath");
                    String description = rs.getString("description");
                    int status = rs.getInt("status");
                    int CateID = rs.getInt("CateID");
                    String CateName = rs.getString("CateName");
                    Plant plant = new Plant(PID, PName, price, imgPath, description, status, CateID, CateName);
                    list.add(plant);
                }
            }
            cn.close();
        }
        return list;
    }

    public static ArrayList<Plant> getAllPlants() throws Exception {
        ArrayList<Plant> list = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select PID,PName,price,imgPath,description,status,Plants.CateID as 'CateID',CateName\n"
                    + "from Plants join Categories on Plants.CateID=Categories.CateID\n";
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs != null) {
                while (rs.next()) {
                    int PID = rs.getInt("PID");
                    String PName = rs.getString("PName");
                    int price = rs.getInt("price");
                    String imgPath = rs.getString("imgPath");
                    String description = rs.getString("description");
                    int status = rs.getInt("status");
                    int CateID = rs.getInt("CateID");
                    String CateName = rs.getString("CateName");
                    Plant plant = new Plant(PID, PName, price, imgPath, description, status, CateID, CateName);
                    list.add(plant);
                }
            }
            cn.close();
        }
        return list;
    }

    public static void insertPlant(String pName, int price, String imgPath, String description, int status, int CateID) throws Exception {
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "insert Plants(PName,price,imgPath,description,status,CateID)\n"
                    + "values(?,?,?,?,?,?)";
            PreparedStatement pst = cn.prepareStatement(sql);
            //gan input params vao dau ?
            pst.setString(1,pName);
            pst.setInt(2,price);
            pst.setString(3,imgPath);
            pst.setString(4,description);
            pst.setInt(5,status);
            pst.setInt(6,CateID);
            pst.executeUpdate();
            cn.close();
        }
    }

    public static void deletePlant(int pId) throws Exception {
        //step 1: make connection
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "delete Plants where PID=?";
            PreparedStatement pst = cn.prepareStatement(sql);
            //gan input params vao dau ?
            pst.setInt(1, pId);
            pst.executeUpdate();
            cn.close();
        }
    }
    public static Plant getPlant(String id) throws Exception {
        Plant plant = null;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select PID,PName,price,imgPath,description,status,Plants.CateID as 'CateID',CateName\n"
                    + "from Plants join Categories on Plants.CateID=Categories.CateID\n"
                    + "where PID = ?";

            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int PID = rs.getInt("PID");
                    String PName = rs.getString("PName");
                    int price = rs.getInt("price");
                    String imgPath = rs.getString("imgPath");
                    String description = rs.getString("description");
                    int status = rs.getInt("status");
                    int CateID = rs.getInt("CateID");
                    String CateName = rs.getString("CateName");
                    plant = new Plant(PID, PName, price, imgPath, description, status, CateID, CateName);
                }
            }
            cn.close();
        }
        return plant;
    }

    public static ArrayList<Plant> getPlantsPaging(int index, int page) throws Exception {
        ArrayList<Plant> list = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select PID,PName,price,imgPath,description,status,Plants.CateID as 'CateID',CateName\n"
                    + "from Plants join Categories on Plants.CateID=Categories.CateID where PID between ? and ?\n";

            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, page * (index - 1) + 1);
            pst.setInt(2, page * index);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int PID = rs.getInt("PID");
                    String PName = rs.getString("PName");
                    int price = rs.getInt("price");
                    String imgPath = rs.getString("imgPath");
                    String description = rs.getString("description");
                    int status = rs.getInt("status");
                    int CateID = rs.getInt("CateID");
                    String CateName = rs.getString("CateName");
                    Plant plant = new Plant(PID, PName, price, imgPath, description, status, CateID, CateName);
                    list.add(plant);
                }
            }
        }
        cn.close();

        return list;
    }

    public static int getQuan() throws Exception {
        try {
            String sql = " select count(*) as quantity\n"
                    + " from Plants join Categories on Plants.CateID=Categories.CateID";
            Connection cn = DBUtils.makeConnection();
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {

        }
        return 0;
    }
    
    public static void updatePlant(int pId, String pName, int price, String imgPath, String description, int status) throws Exception {
        //step 1: make connection
        int result = 0;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "update dbo.Plants set PName=?,price=?,imgPath=?,description=?,status=?\n"
                    + " where PID =? ";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, pName);
            pst.setInt(2, price);
            pst.setString(3, imgPath);
            pst.setString(4, description);
            pst.setInt(5, status);
            pst.setInt(6, pId);
            pst.executeUpdate();
            cn.close();
        }
    }
}
