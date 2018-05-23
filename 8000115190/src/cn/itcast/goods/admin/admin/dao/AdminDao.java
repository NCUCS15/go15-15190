package cn.itcast.goods.admin.admin.dao;

import java.sql.SQLException;
import dbutils.DbUtils;
import java.sql.Connection;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import cn.itcast.goods.admin.admin.domain.Admin;

public class AdminDao {
	private QueryRunner qr = new QueryRunner();
	Connection conn = DbUtils.getConnection();
	public Admin find(String adminname, String adminpwd) throws SQLException {
		String sql = "select * from t_admin where adminname=? and adminpwd=?";
		return qr.query(conn,sql, new BeanHandler<Admin>(Admin.class), adminname, adminpwd);
	}
}
