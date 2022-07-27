/*
 * njust.dao.UserDao.java
 * 2007-08-10
 * �û����ݿ������
 */
package njust.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import njust.entity.User;

public class UserDao extends BaseDao{
    private Connection        conn  = null;   // ���ݿ�����
    private PreparedStatement pstmt = null;   // ����PreparedStatement����
    private ResultSet         rs    = null;   // �������������

    public User findByUname(String uname) {
        User user = null;
        String sql = "select * from TBL_USER where name=?";
        try {
            conn  = this.getConn();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, uname);
            rs    = pstmt.executeQuery();
            while(rs.next()) {
                user = new User();
                user.setName(rs.getString("name"));
                user.setPass(rs.getString("pass"));
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            this.closeAll(conn, pstmt, rs);
        }
        return user;
    }
}
