
package njust.dao;

import java.sql.*;

public class BaseDao {    
    public final static String driver = "com.mysql.jdbc.Driver";           // ���ݿ�����
    public final static String url    = "jdbc:mysql://localhost:3306/test-888";     // url
    public final static String dbName = "sms";                                                  // ���ݿ��û���
    public final static String dbPass = "sms";                                                     // ���ݿ�����
    
    //�õ����ݿ�����
    public Connection getConn() throws ClassNotFoundException, SQLException{
        Connection conn = null;
        Class.forName(driver);
        conn=DriverManager.getConnection(url,dbName,dbPass);
        return conn ;                                                            //��������
    }

     //�ͷ���Դ
    public void closeAll( Connection conn, PreparedStatement pstmt, ResultSet rs ) {
        if(rs != null){
            try { rs.close();} catch (SQLException e) {e.printStackTrace();}
        }
        if(pstmt != null){
            try { pstmt.close();} catch (SQLException e) {e.printStackTrace();}
        }
        if(conn != null){
            try { conn.close();} catch (SQLException e) {e.printStackTrace();}
        }
    }
    

     //ִ��SQL��䣬���Խ�������ɾ���ĵĲ���������ִ�в�ѯ
    public int executeSQL(String preparedSql,Object[] param) {
        Connection        conn  = null;
        PreparedStatement pstmt = null;
        int               num   = 0;
        
        /*  ����SQL,ִ��SQL  */
        try {
            conn=getConn();
            pstmt=conn.prepareStatement(preparedSql);
            if( param != null ) {
                for( int i = 0; i < param.length; i++ ) {
                    pstmt.setObject(i+1,param[i]);
                }
            }
            num = pstmt.executeUpdate();                    // ִ��SQL���
        } catch (ClassNotFoundException e) {
            e.printStackTrace();                            // ����ClassNotFoundException�쳣
        } catch (SQLException e) {
            e.printStackTrace();                            // ����SQLException�쳣
        } finally {
            closeAll(conn,pstmt,null);
        }
        return num;
    }

}
