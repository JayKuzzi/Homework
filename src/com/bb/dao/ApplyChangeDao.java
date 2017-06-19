package com.bb.dao;
/*
* 申请修改操作
* Create by woo-bo
*/
import com.bb.bean.ApplyChange;
import com.bb.bean.Work;
import com.bb.util.DBConnectionUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class ApplyChangeDao {
    /**
     * 添加apply
     */
    public static int add(ApplyChange applyChange) {
        PreparedStatement pstmt = null;
        Connection conn = DBConnectionUtil.getConn();
        String sql = "insert into tb_apply values(?,?,?,?,?)";
        int count = 0;
        try {
            // 声明对象
            pstmt = conn.prepareStatement(sql);
            // 给占位符赋值
            pstmt.setInt(1, getDataBaseId());
            pstmt.setInt(2, applyChange.getUserId());
            pstmt.setString(3, applyChange.getTittle());
            pstmt.setString(4, applyChange.getContent());
            pstmt.setString(5, applyChange.getStste());
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
     * 修改apply状态为通过
     */
    public static int update(int id) {
        PreparedStatement pstmt = null;
        Connection conn = DBConnectionUtil.getConn();
        String sql = "UPDATE tb_apply SET state = ? WHERE id = ?";
        int count = 0;
        try {
            // 声明对象
            pstmt = conn.prepareStatement(sql);
            // 给占位符赋值
            pstmt.setString(1, "已通过");
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
     * 遍历所有申请
     */
    public static String resultWithApply() {
        PreparedStatement pstmt = null;
        Connection conn = DBConnectionUtil.getConn();
        String sql = "select t1.userid,t1.user_china_name,t2.id,t2.tittle,t2.content,t2.state from tb_user t1,tb_apply t2 WHERE t2.userId=t1.id";
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
     * 查询申请修改的id表
     */

    public static List<Integer> QuaryId() {
        PreparedStatement pstmt = null;
        Connection conn = DBConnectionUtil.getConn();
        String sql = "SELECT * FROM tb_apply";
        ResultSet rs = null;
        List<Integer> list = new ArrayList<>();
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt("userId"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnectionUtil.close(pstmt, rs, conn);
        }
        return list;
    }

    /**
     * 获取编号值,在最大的编号值的基础上加1。
     */
    public static int getDataBaseId() {
        int maxId = 0;// 存放最大的编号值，默认值设为0.
        PreparedStatement pstmt = null;
        ResultSet result = null;
        Connection conn = DBConnectionUtil.getConn();
        String sql = "select max(id) from tb_apply";
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
