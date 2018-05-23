package dbutils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import dbutils.DbUtils;
public class dbutilstest {
    public static void main(String[] args) throws SQLException{
        //≤‚ ‘
        Connection con = DbUtils.getConnection();
        String sql = "SELECT * FROM t_book";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while(rs.next()) {
            System.out.println(rs.getString("bname") + "   " + rs.getString("author") );
        }
    }
}