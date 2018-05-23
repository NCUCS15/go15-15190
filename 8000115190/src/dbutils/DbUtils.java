package dbutils;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class DbUtils {
    private static Connection con;
    private static String driver;
    private static String url;
    private static String username;
    private static String password;
    
    static{
        try {
            readinfo();                 //��ȡ�����ļ�
            Class.forName(driver);      //����ķ�ʽע������
            con = DriverManager.getConnection(url, username, password);         //��ȡ���ݿ�����
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("���ݿ�����ʧ��");          //������ݿ������쳣ֱ����ֹ����
        }
    }
    //��ȡ���ӷ���
    public static Connection getConnection() {
        return con;
    }
    //�ͷ���Դ
    public static void close(ResultSet rs, Statement ps, Connection con) {
        try {
            if(rs != null) {
                rs.close();
                rs = null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            try {
                if(ps != null){
                    ps.close();
                    ps = null;
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }finally{
                try {
                    if(con != null) {
                        con.close();
                        con = null;
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    
    //û�н�����ͷ���Դ
    public static void close(Statement ps, Connection con) {
        try {
            if(ps != null){
                ps.close();
                ps = null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            try {
                if(con != null) {
                    con.close();
                    con = null;
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    //��ȡ�����ļ�
    private static void readinfo() throws IOException {
        //��ȡ������ �����ļ�dbutils.properties���ڹ���src�ļ�����
        InputStream is = DbUtils.class.getClassLoader().getResourceAsStream("dbutils.properties");
        //�������Լ���
        Properties pro = new Properties();
        //��ȡ�����б�
        pro.load(is);
        //��ȡ������Ӧ��ֵ,����ֵ
        driver = pro.getProperty("driver");
        url = pro.getProperty("url");
        username = pro.getProperty("username");
        password = pro.getProperty("password");
        //�ر���
        is.close();
    }
}

