package cn.itcast.goods.cart.dao;

import dbutils.DbUtils;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;

import cn.itcast.commons.CommonUtils;
import cn.itcast.goods.book.domain.Book;
import cn.itcast.goods.cart.domain.CartItem;
import cn.itcast.goods.user.domain.User;
public class CartItemDao {
	private QueryRunner qr = new QueryRunner();
	Connection conn = DbUtils.getConnection();
	private String toWhereSql(int len) {
		StringBuilder sb = new StringBuilder("cartItemId in(");
		for(int i = 0; i < len; i++) {
			sb.append("?");
			if(i < len - 1) {
				sb.append(",");
			}
		}
		sb.append(")");
		return sb.toString();
	}
	public List<CartItem> loadCartItems(String cartItemIds) throws SQLException {
		Object[] cartItemIdArray = cartItemIds.split(",");
		String whereSql = toWhereSql(cartItemIdArray.length);
		String sql = "select * from t_cartitem c, t_book b where c.bid=b.bid and " + whereSql;
		Connection conn = DbUtils.getConnection();
		return toCartItemList(qr.query(conn,sql, new MapListHandler(), cartItemIdArray));
	}
	public CartItem findByCartItemId(String cartItemId) throws SQLException {
		String sql = "select * from t_cartItem c, t_book b where c.bid=b.bid and c.cartItemId=?";
		Connection conn = DbUtils.getConnection();
		Map<String,Object> map = qr.query(conn,sql, new MapHandler(), cartItemId);
		return toCartItem(map);
	}
	
	/**
	 * 批量删除
	 * @param cartItemIds
	 * @throws SQLException
	 */
	public void batchDelete(String cartItemIds) throws SQLException {
		Connection conn = DbUtils.getConnection();
		Object[] cartItemIdArray = cartItemIds.split(",");
		String whereSql = toWhereSql(cartItemIdArray.length);
		String sql = "delete from t_cartitem where " + whereSql;
		qr.update(conn,sql, cartItemIdArray);//其中cartItemIdArray必须是Object类型的数组！
	}
	public CartItem findByUidAndBid(String uid, String bid) throws SQLException {
		String sql = "select * from t_cartitem where uid=? and bid=?";
		Connection conn = DbUtils.getConnection();
		Map<String,Object> map = qr.query(conn,sql, new MapHandler(), uid, bid);
		CartItem cartItem = toCartItem(map);
		return cartItem;
	}
	
	/**
	 * 修改指定条目的数量
	 * @param cartItemId
	 * @param quantity
	 * @throws SQLException 
	 */
	public void updateQuantity(String cartItemId, int quantity) throws SQLException {
		String sql = "update t_cartitem set quantity=? where cartItemId=?";
		Connection conn = DbUtils.getConnection();
		qr.update(conn,sql, quantity, cartItemId);
	}
	
	/**
	 * 添加条目
	 * @param cartItem
	 * @throws SQLException 
	 */
	public void addCartItem(CartItem cartItem) throws SQLException {
		String sql = "insert into t_cartitem(cartItemId, quantity, bid, uid,orderBy)" +
				" values(?,?,?,?,?)";
		Connection conn = DbUtils.getConnection();
		Object[] params = {cartItem.getCartItemId(), cartItem.getQuantity(),
				cartItem.getBook().getBid(), cartItem.getUser().getUid(),1};
		qr.update(conn,sql, params);
	}
	private CartItem toCartItem(Map<String,Object> map) {
		if(map == null || map.size() == 0) return null;
		CartItem cartItem = CommonUtils.toBean(map, CartItem.class);
		Book book = CommonUtils.toBean(map, Book.class);
		User user = CommonUtils.toBean(map, User.class);
		cartItem.setBook(book);
		cartItem.setUser(user);
		return cartItem;
	}
	private List<CartItem> toCartItemList(List<Map<String,Object>> mapList) {
		List<CartItem> cartItemList = new ArrayList<CartItem>();
		for(Map<String,Object> map : mapList) {
			CartItem cartItem = toCartItem(map);
			cartItemList.add(cartItem);
		}
		return cartItemList;
	}
	public List<CartItem> findByUser(String uid) throws SQLException {
		Connection conn = DbUtils.getConnection();
		
		String sql = "select * from t_cartitem c, t_book b where c.bid=b.bid and uid=?";
		List<Map<String,Object>> mapList = qr.query(conn,sql, new MapListHandler(), uid);
		return toCartItemList(mapList);
	}
}
