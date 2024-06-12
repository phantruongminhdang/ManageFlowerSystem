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
import sample.dto.Category;
import sample.dto.Plant;
import sample.utils.DBUtils;

/**
 *
 * @author ACER
 */
public class CategoryDAO {

    public static ArrayList<Category> getCategories() throws Exception {
        ArrayList<Category> list = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select CateID, CateName\n"
                    + "from Categories";
            Statement st = cn.createStatement();
            ResultSet table = st.executeQuery(sql);
            if (table != null) {
                while (table.next()) {
                    int cateId = table.getInt("CateID");
                    String cateName = table.getString("CateName");
                    list.add(new Category(cateId, cateName));
                }
            }
            cn.close();
        }
        return list;
    }

    public static ArrayList<Category> getCategories(String cateName) throws Exception {
        ArrayList<Category> list = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select CateID, CateName\n"
                    + "from Categories\n";
            if (cateName != null) {
                sql = sql +"where CateName like ?";
            }
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, "%" + cateName + "%");
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int cateId = rs.getInt("CateID");
                    cateName = rs.getString("CateName");
                    Category cate = new Category(cateId, cateName);
                    list.add(cate);
                }
            }
            cn.close();
        }
        return list;
    }

    public static void insertCategory(String cateName) throws Exception {
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "insert dbo.Categories(CateName)\n"
                    + "values(?)";
            PreparedStatement pst = cn.prepareStatement(sql);
            //gan input params vao dau ?
            pst.setString(1, cateName);
            pst.executeUpdate();
            cn.close();
        }
    }

    public static void deleteCategory(int cateId) throws Exception {
        //step 1: make connection
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "delete dbo.Categories where CateID=?";
            PreparedStatement pst = cn.prepareStatement(sql);
            //gan input params vao dau ?
            pst.setInt(1, cateId);
            pst.executeUpdate();
            cn.close();
        }
    }
    
    public static void updateCategory(int cateId, String cateName) throws Exception {
        //step 1: make connection
        int result = 0;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "update dbo.Categories set CateName=?\n"
                    + " where CateID=? ";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, cateName);
            pst.setInt(2, cateId);
            pst.executeUpdate();
            cn.close();
        }
    }

}
