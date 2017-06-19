package com.bb.dao;

import com.bb.bean.Work;
import com.bb.util.DBConnectionUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/*
* 作业操作
* Create by woo-bo
*/
public class WorkDao {
    /**
     * 添加作业
     */
    public static int add(Work work) {
        PreparedStatement pstmt = null;
        Connection conn = DBConnectionUtil.getConn();
        String sql = "insert into tb_work values(?,?,?,?,?,?,?,?,?)";
        int count = 0;
        try {
            // 声明对象
            pstmt = conn.prepareStatement(sql);
            // 给占位符赋值
            pstmt.setInt(1, getDataBaseId());
            pstmt.setInt(2, work.getUserId());
            pstmt.setInt(3, work.getTeacherId());
            pstmt.setString(4, work.getWorkName());
            pstmt.setString(5, work.getFile());
            pstmt.setString(6, work.getWorkGrade());
            pstmt.setString(7, work.getWorkDate());
            pstmt.setString(8, work.getWorkPhone());
            pstmt.setString(9, work.getWorkInfo());
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
     * 修改作业带文件
     */
    public static int updateWithFile(Work work) {
        PreparedStatement pstmt = null;
        Connection conn = DBConnectionUtil.getConn();
        String sql = "update tb_work set workName=?,teacherId=?,workPhone=?,file=?,workInfo=?,workDate=? where id=?";
        int count = 0;
        try {
            // 声明对象
            pstmt = conn.prepareStatement(sql);
            // 给占位符赋值
            pstmt.setString(1, work.getWorkName());
            pstmt.setInt(2, work.getTeacherId());
            pstmt.setString(3, work.getWorkPhone());
            pstmt.setString(4, work.getFile());
            pstmt.setString(5, work.getWorkInfo());
            pstmt.setString(6, work.getWorkDate());
            pstmt.setInt(7, work.getId());
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
     * 修改作业不带文件
     */
    public static int update(Work work) {
        PreparedStatement pstmt = null;
        Connection conn = DBConnectionUtil.getConn();
        String sql = "update tb_work set workName=?,teacherId=?,workPhone=?,workInfo=?,workDate=? where id=?";
        int count = 0;
        try {
            // 声明对象
            pstmt = conn.prepareStatement(sql);
            // 给占位符赋值
            pstmt.setString(1, work.getWorkName());
            pstmt.setInt(2, work.getTeacherId());
            pstmt.setString(3, work.getWorkPhone());
            pstmt.setString(4, work.getWorkInfo());
            pstmt.setString(5, work.getWorkDate());
            pstmt.setInt(6, work.getId());
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
     * 修改作业得分根据作业id
     */
    public static int updateGrade(int workId,String workGrade) {
        PreparedStatement pstmt = null;
        Connection conn = DBConnectionUtil.getConn();
        String sql = "update tb_work set workGrade=? where id=?";
        int count = 0;
        try {
            // 声明对象
            pstmt = conn.prepareStatement(sql);
            // 给占位符赋值
            pstmt.setString(1, workGrade);
            pstmt.setInt(2, workId);
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
     * 删除作业
     */
    public static int delete(Work work) {
        PreparedStatement pstmt = null;
        Connection conn = DBConnectionUtil.getConn();
        String sql = "DELETE  FROM tb_work  where id=?";
        int count = 0;
        try {
            // 声明对象
            pstmt = conn.prepareStatement(sql);
            // 给占位符赋值
            pstmt.setInt(1, work.getId());
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
     * 查询作业的作业id表
     */

    public static List<Integer> QuaryId() {
        PreparedStatement pstmt = null;
        Connection conn = DBConnectionUtil.getConn();
        String sql = "SELECT * FROM tb_work";
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
     * 查询表转换成json(根据用户数据库id编号)
     */
    public static String resultSetToJson(int userid) {
        PreparedStatement pstmt = null;
        Connection conn = DBConnectionUtil.getConn();
        String sql = "select t1.id,t1.workName,t1.file,t1.teacherId,t1.workGrade,t1.workDate,t1.workPhone,t1.workInfo,t2.name,t2.phone from tb_work t1,tb_teacher t2 WHERE t1.userId = ? and t1.teacherId = t2.id";
        ResultSet rs = null;
        JSONArray array = new JSONArray();

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userid);
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
     * 查询表转换成json(根据老师id编号)
     */
    public static String resultSetToJsonWithTeacherId(int teacherId) {
        PreparedStatement pstmt = null;
        Connection conn = DBConnectionUtil.getConn();
        String sql = "select t1.id,t1.userId,t1.workName,t1.file,t1.teacherId,t1.workGrade,t1.workDate,t1.workPhone,t1.workInfo,t2.userid,t2.user_china_name,t2.profession,t2.classinfo,t2.eMail from tb_work t1,tb_user t2 WHERE t1.userId = t2.id and t1.teacherId=?";
        ResultSet rs = null;
        JSONArray array = new JSONArray();

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, teacherId);
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
     * 查询表转换成json(根据用户数据库id编号、作业名称)
     */
    public static String resultSetToJsonWithworkName(int userid,String workName) {
        PreparedStatement pstmt = null;
        Connection conn = DBConnectionUtil.getConn();
        String sql = "select t1.id,t1.workName,t1.file,t1.teacherId,t1.workGrade,t1.workDate,t1.workPhone,t1.workInfo,t2.name,t2.phone from tb_work t1,tb_teacher t2 WHERE t1.userId = ? and t1.teacherId = t2.id and t1.workName like ?";
        ResultSet rs = null;
        JSONArray array = new JSONArray();

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userid);
            pstmt.setString(2, "%" + workName + "%");

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
     * 老师界面查询表转换成json(根据用户数据库id编号、作业名称)
     */
    public static String resultSetToJsonWithworkName2(int teacherId,String workName) {
        PreparedStatement pstmt = null;
        Connection conn = DBConnectionUtil.getConn();
        String sql = "select t1.id,t1.userId,t1.workName,t1.file,t1.teacherId,t1.workGrade,t1.workDate,t1.workPhone,t1.workInfo,t2.userid,t2.user_china_name,t2.profession,t2.classinfo,t2.eMail from tb_work t1,tb_user t2 WHERE t1.userId = t2.id and t1.teacherId=? and t1.workName like ?";
        ResultSet rs = null;
        JSONArray array = new JSONArray();

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, teacherId);
            pstmt.setString(2, "%" + workName + "%");

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
     * //查询表转换成json(根据用户数据库id编号、日期)
     */
    public static String resultSetToJsonWithDate(int userid,String date) {
        PreparedStatement pstmt = null;
        Connection conn = DBConnectionUtil.getConn();
        String sql = "select t1.id,t1.workName,t1.file,t1.teacherId,t1.workGrade,t1.workDate,t1.workPhone,t1.workInfo,t2.name,t2.phone from tb_work t1,tb_teacher t2 WHERE t1.userId = ? and t1.teacherId = t2.id and t1.workDate like ?";
        ResultSet rs = null;
        JSONArray array = new JSONArray();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userid);
            pstmt.setString(2, "%" + date + "%");

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
     * //老师界面查询表转换成json(根据用户数据库id编号、日期)
     */
    public static String resultSetToJsonWithDate2(int teacherId,String date) {
        PreparedStatement pstmt = null;
        Connection conn = DBConnectionUtil.getConn();
        String sql = "select t1.id,t1.userId,t1.workName,t1.file,t1.teacherId,t1.workGrade,t1.workDate,t1.workPhone,t1.workInfo,t2.userid,t2.user_china_name,t2.profession,t2.classinfo,t2.eMail from tb_work t1,tb_user t2 WHERE t1.userId = t2.id and t1.teacherId=? and t1.workDate like ?";
        ResultSet rs = null;
        JSONArray array = new JSONArray();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, teacherId);
            pstmt.setString(2, "%" + date + "%");

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
     * //查询表转换成json(根据用户数据库id编号、日期、WorkName)
     */
    public static String resultSetToJsonWithDouble(int userid,String date,String workName) {
        PreparedStatement pstmt = null;
        Connection conn = DBConnectionUtil.getConn();
        String sql = "select t1.id,t1.workName,t1.file,t1.teacherId,t1.workGrade,t1.workDate,t1.workPhone,t1.workInfo,t2.name,t2.phone from tb_work t1,tb_teacher t2 WHERE t1.userId = ? and t1.teacherId = t2.id and t1.workDate like ? and t1.workName like ?";
        ResultSet rs = null;
        JSONArray array = new JSONArray();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userid);
            pstmt.setString(2, "%" + date + "%");
            pstmt.setString(3, "%" + workName + "%");

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
     * //老师界面查询表转换成json(根据用户数据库id编号、日期、WorkName)
     */
    public static String resultSetToJsonWithDouble2(int teacherId,String date,String workName) {
        PreparedStatement pstmt = null;
        Connection conn = DBConnectionUtil.getConn();
        String sql = "select t1.id,t1.userId,t1.workName,t1.file,t1.teacherId,t1.workGrade,t1.workDate,t1.workPhone,t1.workInfo,t2.userid,t2.user_china_name,t2.profession,t2.classinfo,t2.eMail from tb_work t1,tb_user t2 WHERE t1.userId = t2.id and t1.teacherId=? and t1.workDate like ? and t1.workName like ?";
        ResultSet rs = null;
        JSONArray array = new JSONArray();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, teacherId);
            pstmt.setString(2, "%" + date + "%");
            pstmt.setString(3, "%" + workName + "%");

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
        String sql = "select max(id) from tb_work";
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
