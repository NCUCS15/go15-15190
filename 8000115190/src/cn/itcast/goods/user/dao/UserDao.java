package cn.itcast.goods.user.dao;

import java.sql.SQLException;
import dbutils.DbUtils;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import cn.itcast.commons.CommonUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.itcast.commons.CommonUtils;
import cn.itcast.goods.book.domain.Book;
import cn.itcast.goods.order.domain.Order;
import cn.itcast.goods.order.domain.OrderItem;
import cn.itcast.goods.user.domain.User;

/**
 * 用户模块持久层
 * @author qdmmy6
 *
 */
public class UserDao {
	private QueryRunner qr = new QueryRunner();
	
	/**
	 * 按uid和password查询
	 * @param uid
	 * @param password
	 * @return
	 * @throws SQLException 
	 */
	public boolean findByUidAndPassword(String uid, String password) throws SQLException {
		String sql = "select count(*) from t_user where uid=? and loginpass=?";
		Connection conn = DbUtils.getConnection();
		Number number = (Number)qr.query(conn,sql, new ScalarHandler(), uid, password);
		return number.intValue() > 0;
	}
	
	/**
	 * 修改密码
	 * @param uid
	 * @param password
	 * @throws SQLException
	 */
	public void updatePassword(String uid, String password) throws SQLException {
		String sql = "update t_user set loginpass=? where uid=?";
		Connection conn = DbUtils.getConnection();
		qr.update(conn,sql, password, uid);
	}
	
	/**
	 * 按用户名和密码查询
	 * @param loginname
	 * @param loginpass
	 * @return
	 * @throws SQLException 
	 */
	public User findByLoginnameAndLoginpass(String loginname, String loginpass) throws SQLException {
		String sql = "select * from t_user where loginname=? and loginpass=?";
		Connection conn = DbUtils.getConnection();
		return qr.query(conn,sql, new BeanHandler<User>(User.class), loginname, loginpass);
	}
	
	/**
	 * 通过激活码查询用户
	 * @param code
	 * @return
	 * @throws SQLException 
	 */
	public User findByCode(String code) throws SQLException {
		String sql = "select * from t_user where activationCode=?";
		Connection conn = DbUtils.getConnection();
		return qr.query(conn,sql, new BeanHandler<User>(User.class), code);
	}
	
	/**
	 * 修改用户状态
	 * @param uid
	 * @param status
	 * @throws SQLException 
	 */
	public void updateStatus(String uid, boolean status) throws SQLException {
		String sql = "update t_user set status=? where uid=?";
		Connection conn = DbUtils.getConnection();
		qr.update(conn,sql, status, uid);
	}
	
	/**
	 * 校验用户名是否注册
	 * @param loginname
	 * @return
	 * @throws SQLException 
	 */
	public boolean ajaxValidateLoginname(String loginname) throws SQLException {
		String sql = "select count(1) from t_user where loginname=?";
		Connection conn = DbUtils.getConnection();
		Number number = (Number)qr.query(conn,sql, new ScalarHandler(), loginname);
		return number.intValue() == 0;
	}
	
	
	/**
	 * 添加用户
	 * @param user
	 * @throws SQLException 
	 */
	public void add(User user) throws SQLException {
		String sql = "insert into t_user values(?,?,?,?,?,?)";
		Object[] params = {user.getUid(), user.getLoginname(), user.getLoginpass(),
				user.getEmail(), user.isStatus(), user.getActivationCode()};
		Connection conn = DbUtils.getConnection();
		qr.update(conn,sql, params);
	}
	private User toUser(Map<String, Object> map) {
		User user = CommonUtils.toBean(map, User.class);
		return user;
	}
	private List<User> touser(List<Map<String, Object>> mapList) {
		List<User> orderItemList = new ArrayList<User>();
		for(Map<String,Object> map : mapList) {
			User user = toUser(map);
			orderItemList.add(user);
		}
		return orderItemList;
	}
	public  List<User> finduser() throws SQLException {
		Connection conn = DbUtils.getConnection();
		String sql = "select * from t_user";
		List<Map<String,Object>> mapList = qr.query(conn,sql, new MapListHandler());
		return touser(mapList);
	}
}
