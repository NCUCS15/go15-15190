package cn.itcast.goods.order.dao;
import dbutils.DbUtils;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.*;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.itcast.commons.CommonUtils;
import cn.itcast.goods.book.domain.Book;
import cn.itcast.goods.cart.domain.CartItem;
import cn.itcast.goods.order.domain.Order;
import cn.itcast.goods.order.domain.OrderItem;
import cn.itcast.goods.pager.Expression;
import cn.itcast.goods.pager.PageBean;
import cn.itcast.goods.pager.PageConstants;
public class OrderDao {
	private QueryRunner qr = new QueryRunner();
	Connection conn = DbUtils.getConnection();
	public int findStatus(String oid) throws SQLException {
		String sql = "select status from t_order where oid=?";
		Number number = (Number)qr.query(conn,sql, new ScalarHandler(), oid);
		return number.intValue();
	}
	public void updateStatus(String oid, int status) throws SQLException {
		String sql = "update t_order set status=? where oid=?";
		qr.update(conn,sql, status, oid);
	}

	public Order load(String oid) throws SQLException {
		String sql = "select * from t_order where oid=?";
		Order order = qr.query(conn,sql, new BeanHandler<Order>(Order.class), oid);
		loadOrderItem(order);//为当前订单加载它的所有订单条目
		return order;
	}
	public void add(Order order) throws SQLException {

		Connection conn = DbUtils.getConnection();
		String sql = "insert into t_order values(?,?,?,?,?,?)";
		Object[] params = {order.getOid(), order.getOrdertime(),
				order.getTotal(),order.getStatus(),order.getAddress(),
				order.getOwner().getUid()};
		qr.update(conn,sql, params);
		sql = "insert into t_orderitem values(?,?,?,?,?,?,?,?)";
		int len = order.getOrderItemList().size();
		Object[][] objs = new Object[len][];
		for(int i = 0; i < len; i++){
			OrderItem item = order.getOrderItemList().get(i);
			objs[i] = new Object[]{item.getOrderItemId(),item.getQuantity(),
					item.getSubtotal(),item.getBook().getBid(),
					item.getBook().getBname(),item.getBook().getCurrPrice(),
					item.getBook().getImage_b(),order.getOid()};
		}
		qr.batch(conn,sql, objs);
	}

	public PageBean<Order> findByUser(String uid, int pc) throws SQLException {
		List<Expression> exprList = new ArrayList<Expression>();
		exprList.add(new Expression("uid", "=", uid));
		return findByCriteria(exprList, pc);
	}
	public  List<Order> findall(String uid) throws SQLException {
		Connection conn = DbUtils.getConnection();
		String sql = "select * from t_order where uid=?";
		List<Map<String,Object>> mapList = qr.query(conn,sql, new MapListHandler(), uid);
		return toOrder(mapList);
	}

	public PageBean<Order> findAll(int pc) throws SQLException {
		List<Expression> exprList = new ArrayList<Expression>();
		return findByCriteria(exprList, pc);
	}


	public PageBean<Order> findByStatus(int status, int pc) throws SQLException {
		List<Expression> exprList = new ArrayList<Expression>();
		exprList.add(new Expression("status", "=", status + ""));
		return findByCriteria(exprList, pc);
	}
	
	private PageBean<Order> findByCriteria(List<Expression> exprList, int pc) throws SQLException {
		int ps = PageConstants.ORDER_PAGE_SIZE;//每页记录数
		StringBuilder whereSql = new StringBuilder(" where 1=1"); 
		List<Object> params = new ArrayList<Object>();//SQL中有问号，它是对应问号的值
		Connection conn = DbUtils.getConnection();
		for(Expression expr : exprList) {
			whereSql.append(" and ").append(expr.getName())
				.append(" ").append(expr.getOperator()).append(" ");
			// where 1=1 and bid = ?
			if(!expr.getOperator().equals("is null")) {
				whereSql.append("?");
				params.add(expr.getValue());
			}
		}
		String sql = "select count(*) from t_order" + whereSql;
		Number number = (Number)qr.query(conn,sql, new ScalarHandler(), params.toArray());
		int tr = number.intValue();//得到了总记录数
		sql = "select * from t_order" + whereSql ;
		params.add((pc-1) * ps);//当前页首行记录的下标
		params.add(ps);//一共查询几行，就是每页记录数
		List<Order> beanList = qr.query(conn,sql, new BeanListHandler<Order>(Order.class), 
				params.toArray());
	
		for(Order order : beanList) {
			loadOrderItem(order);
		}
		PageBean<Order> pb = new PageBean<Order>();
		pb.setBeanList(beanList);
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(tr);
		
		return pb;
	}

	private void loadOrderItem(Order order) throws SQLException {

		Connection conn = DbUtils.getConnection();
		String sql = "select * from t_orderitem where oid=?";
		List<Map<String,Object>> mapList = qr.query(conn,sql, new MapListHandler(), order.getOid());
		List<OrderItem> orderItemList = toOrderItemList(mapList);
		
		order.setOrderItemList(orderItemList);
	}
	private List<OrderItem> toOrderItemList(List<Map<String, Object>> mapList) {
		List<OrderItem> orderItemList = new ArrayList<OrderItem>();
		for(Map<String,Object> map : mapList) {
			OrderItem orderItem = toOrderItem(map);
			orderItemList.add(orderItem);
		}
		return orderItemList;
	}
	private List<Order> toOrder(List<Map<String, Object>> mapList) {
		List<Order> orderItemList = new ArrayList<Order>();
		for(Map<String,Object> map : mapList) {
			Order order = toOrder(map);
			orderItemList.add(order);
		}
		return orderItemList;
	}
	private Order toOrder(Map<String, Object> map) {
		Order order = CommonUtils.toBean(map, Order.class);
		return order;
	}
	private OrderItem toOrderItem(Map<String, Object> map) {
		OrderItem orderItem = CommonUtils.toBean(map, OrderItem.class);
		Book book = CommonUtils.toBean(map, Book.class);
		orderItem.setBook(book);
		return orderItem;
	}
	public  List<Order> adminfindall() throws SQLException {
		Connection conn = DbUtils.getConnection();
		String sql = "select * from t_order";
		List<Map<String,Object>> mapList = qr.query(conn,sql, new MapListHandler());
		return toOrder(mapList);
	}
}
