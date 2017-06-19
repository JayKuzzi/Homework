package com.bb.dao;
/*
* 申请修改操作
* Create by woo-bo
*/

import com.bb.bean.User;
import com.bb.bean.WorkShow;
import com.bb.util.DBConnectionUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class WorkShowDao {
    /**
     * 添加作业展示
     */
    public static int add(WorkShow workShow) {
        PreparedStatement pstmt = null;
        Connection conn = DBConnectionUtil.getConn();
        String sql = "insert into tb_workshow values(?,?,?,?)";
        int count = 0;
        try {
            // 声明对象
            pstmt = conn.prepareStatement(sql);
            // 给占位符赋值
            pstmt.setInt(1, getDataBaseId());
            pstmt.setInt(2, workShow.getWorkId());
            pstmt.setString(3, workShow.getPreview());
            pstmt.setString(4, workShow.getState());
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
     * 查询作业展示的作业id表
     */

    public static List<Integer> QuaryId() {
        PreparedStatement pstmt = null;
        Connection conn = DBConnectionUtil.getConn();
        String sql = "SELECT * FROM tb_workshow";
        ResultSet rs = null;
        List<Integer> list = new ArrayList<>();
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt("workId"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnectionUtil.close(pstmt, rs, conn);
        }
        return list;
    }




    /**
     * 修改作业展示状态根据作业展示id
     */

    public static int ChangeState(int showId,String state) {
        PreparedStatement pstmt = null;
        Connection conn = DBConnectionUtil.getConn();
        String sql = "UPDATE tb_workshow SET state=? WHERE id = ?";
        int count = 0;
        try {
            // 声明对象
            pstmt = conn.prepareStatement(sql);
            // 给占位符赋值
            pstmt.setString(1, state);
            pstmt.setInt(2, showId);
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
     * 查询通过的优秀作业转换成json
     */
    public static String resultSetToJson() {
        PreparedStatement pstmt = null;
        Connection conn = DBConnectionUtil.getConn();
        String sql = "select t1.id,t1.workId,t1.preview,t1.state,t2.workName,t2.workGrade,t2.file,t2.userId,t3.user_china_name,t3.profession,t3.classinfo from tb_workshow t1,tb_work t2,tb_user t3 WHERE t1.workId = t2.id AND t2.userId=t3.id AND t1.state=?";
        ResultSet rs = null;
        JSONArray array = new JSONArray();

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "已通过");
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
     * 查询所有优秀作业转换成json
     */
    public static String resultAllShow() {
        PreparedStatement pstmt = null;
        Connection conn = DBConnectionUtil.getConn();
        String sql = "select t1.id,t1.workId,t1.preview,t1.state,t2.workName,t2.workGrade,t2.workDate,t2.workPhone,t2.file,t2.userId,t3.user_china_name,t3.profession,t3.classinfo from tb_workshow t1,tb_work t2,tb_user t3 WHERE t1.workId = t2.id AND t2.userId=t3.id";
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
        String sql = "select max(id) from tb_workshow";
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
