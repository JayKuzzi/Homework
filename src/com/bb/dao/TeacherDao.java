package com.bb.dao;
/*
* 老师表操作
* Create by woo-bo
*/
import com.bb.bean.ApplyChange;
import com.bb.util.DBConnectionUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.sql.*;


public class TeacherDao {


    /**
     * 修改老师手机号
     */
    public static int update(int id,String phone) {
        PreparedStatement pstmt = null;
        Connection conn = DBConnectionUtil.getConn();
        String sql = "UPDATE tb_teacher SET phone = ? WHERE id = ?";
        int count = 0;
        try {
            // 声明对象
            pstmt = conn.prepareStatement(sql);
            // 给占位符赋值
            pstmt.setString(1, phone);
            pstmt.setInt(2, id);
            // 执行sql语句
            count = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnectionUtil.close(pstmt, conn);
        }
        return count;
    }

    /**
     * 遍历所有老师
     */
    public static String resultWithTeacher() {
        PreparedStatement pstmt = null;
        Connection conn = DBConnectionUtil.getConn();
        String sql = "SELECT * FROM tb_teacher";
        ResultSet rs = null;
        JSONArray array = new JSONArray();
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            // 获取列数
            ResultSetMetaData metaData = rs.getMetaData();
            int columnCount = metaData.getColumnCount();

            // 遍历ResultSet中的每条数据
            while (rs.next()) {
                JSONObject jsonObj = new JSONObject();
                // 遍历每一列
                for (int i = 1; i <= columnCount; i++) {
                    String columnName = metaData.getColumnLabel(i);
                    String value = rs.getString(columnName);
                    jsonObj.put(columnName, value);
                }
                array.add(jsonObj);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnectionUtil.close(pstmt, rs, conn);
        }
        return array.toString();
    }

    /**
     * 获取编号值,在最大的编号值的基础上加1。
     */
    public static int getDataBaseId() {
        int maxId = 0;// 存放最大的编号值，默认值设为0.
        PreparedStatement pstmt = null;
        ResultSet result = null;
        Connection conn = DBConnectionUtil.getConn();
        String sql = "select max(id) from tb_teacher";
        try {
            pstmt = conn.prepareStatement(sql);
            result = pstmt.executeQuery();
            if (result.next()) {
                maxId = result.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnectionUtil.close(pstmt, result, conn);
        }
        return maxId + 1;
    }
}
