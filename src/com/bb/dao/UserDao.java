package com.bb.dao;



/*
* 用户操作
* Create by woo-bo
*/
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.bb.bean.User;
import com.bb.util.DBConnectionUtil;
import com.oracle.javafx.jmx.json.JSONException;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


public class UserDao {
    /**
     * 注册添加用户信息
     */
    public static int add(User user) {
        PreparedStatement pstmt = null;
        Connection conn = DBConnectionUtil.getConn();
        String sql = "insert into tb_user values(?,?,?,?,?,?,?,?)";
        int count = 0;
        try {
            // 声明对象
            pstmt = conn.prepareStatement(sql);
            // 给占位符赋值
            pstmt.setInt(1, getDataBaseId());
            pstmt.setString(2, user.getUserId());
            pstmt.setString(3, user.getUserChinaName());
            pstmt.setString(4, user.getUserName());
            pstmt.setString(5, user.getUserPass());
            pstmt.setString(6, user.getClassinfo());
            pstmt.setString(7, user.getProfession());
            pstmt.setString(8, user.geteMail());

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
     * 更改用户信息
     */
    public static int update(User user) {
        PreparedStatement pstmt = null;
        Connection conn = DBConnectionUtil.getConn();
        String sql = "UPDATE tb_user SET user_china_name=?,userid=?,password=?,classinfo=?,profession=?,eMail=? WHERE id=?";
        int count = 0;
        try {
            // 声明对象
            pstmt = conn.prepareStatement(sql);
            // 给占位符赋值
            pstmt.setString(1, user.getUserChinaName());
            pstmt.setString(2, user.getUserId());
            pstmt.setString(3, user.getUserPass());
            pstmt.setString(4, user.getClassinfo());
            pstmt.setString(5, user.getProfession());
            pstmt.setString(6, user.geteMail());
            pstmt.setInt(7, user.getId());

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
     * 删除用户根据id
     */
    public static int delete(int id) {
        PreparedStatement pstmt = null;
        Connection conn = DBConnectionUtil.getConn();
        String sql = "DELETE FROM tb_user WHERE id = ?";
        int count = 0;
        try {
            // 声明对象
            pstmt = conn.prepareStatement(sql);
            // 给占位符赋值
            pstmt.setInt(1, id);
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
     * 查询所有用户信息
     */

    public static List<User> query() {
        PreparedStatement pstmt = null;
        Connection conn = DBConnectionUtil.getConn();
        String sql = "select * from tb_user";
        ResultSet rs = null;
        List<User> userList = new ArrayList<>();
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt("id"), rs.getString("userid"), rs.getString("user_china_name"), rs.getString("username"), rs.getString("password"),
                        rs.getString("classinfo"), rs.getString("profession"), rs.getString("eMail"));
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnectionUtil.close(pstmt, rs, conn);
        }

        return userList;
    }


    public static String resultSetToJson() {
        PreparedStatement pstmt = null;
        Connection conn = DBConnectionUtil.getConn();
        String sql = "select * from tb_user";
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


    public static String resultWithStudent() {
        PreparedStatement pstmt = null;
        Connection conn = DBConnectionUtil.getConn();
        String sql = "select * from tb_user WHERE id > ?";
        ResultSet rs = null;
        JSONArray array = new JSONArray();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,4);
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
     * 查询用户信息根据登录名
     */

    public static List<User> getByUsername(String username) {
        PreparedStatement pstmt = null;
        Connection conn = DBConnectionUtil.getConn();
        String sql = "select * from tb_user where username = ?";
        ResultSet rs = null;
        List<User> userList = new ArrayList<>();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt("id"), rs.getString("userid"), rs.getString("user_china_name"), rs.getString("username"), rs.getString("password"),
                        rs.getString("classinfo"), rs.getString("profession"), rs.getString("eMail"));
                userList.add(user);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnectionUtil.close(pstmt, rs, conn);
        }
        return userList;
    }


    /**
     * 查询用户信息根据学号
     */

    public static List<User> getByNum(String num) {
        PreparedStatement pstmt = null;
        Connection conn = DBConnectionUtil.getConn();
        String sql = "select * from tb_user where userid = ?";
        ResultSet rs = null;
        List<User> userList = new ArrayList<>();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, num);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt("id"), rs.getString("userid"), rs.getString("user_china_name"), rs.getString("username"), rs.getString("password"),
                        rs.getString("classinfo"), rs.getString("profession"), rs.getString("eMail"));
                userList.add(user);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnectionUtil.close(pstmt, rs, conn);
        }
        return userList;
    }

    /**
     * 修改密码根据用户名
     */

    public static int ChangePass(String new_pass,String username) {
        PreparedStatement pstmt = null;
        Connection conn = DBConnectionUtil.getConn();
        String sql = "UPDATE tb_user SET password=? WHERE username = ?";
        int count = 0;
        try {
            // 声明对象
            pstmt = conn.prepareStatement(sql);
            // 给占位符赋值
            pstmt.setString(1, new_pass);
            pstmt.setString(2, username);
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
     * 修改邮箱根据用户名
     */

    public static int ChangeEamil(String new_emial,String username) {
        PreparedStatement pstmt = null;
        Connection conn = DBConnectionUtil.getConn();
        String sql = "UPDATE tb_user SET eMail=? WHERE username = ?";
        int count = 0;
        try {
            // 声明对象
            pstmt = conn.prepareStatement(sql);
            // 给占位符赋值
            pstmt.setString(1, new_emial);
            pstmt.setString(2, username);
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
     * 获取编号值,在最大编号值的基础上加1。
     */
    public static int getDataBaseId() {
        int maxId = 0;// 存放最大的编号值，默认值设为0.
        PreparedStatement pstmt = null;
        ResultSet result = null;
        Connection conn = DBConnectionUtil.getConn();
        String sql = "select max(id) from tb_user";
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
