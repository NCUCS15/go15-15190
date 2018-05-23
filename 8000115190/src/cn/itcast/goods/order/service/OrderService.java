package cn.itcast.goods.order.service;

import java.sql.SQLException;
import java.util.List;

import cn.itcast.goods.cart.domain.CartItem;
import cn.itcast.goods.order.dao.OrderDao;
import cn.itcast.goods.order.domain.Order;
import cn.itcast.goods.order.domain.OrderItem;
import cn.itcast.goods.pager.PageBean;
import cn.itcast.jdbc.JdbcUtils;
public class OrderService {
	private OrderDao orderDao = new OrderDao();
	public void updateStatus(String oid, int status) {
		try {
			orderDao.updateStatus(oid, status);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	public int findStatus(String oid) {
		try {
			return orderDao.findStatus(oid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	public Order load(String oid) {
		try {
			JdbcUtils.beginTransaction();
			Order order = orderDao.load(oid);
			JdbcUtils.commitTransaction();
			return order;
		} catch (SQLException e) {
			try {
				JdbcUtils.rollbackTransaction();
			} catch (SQLException e1) {}
			throw new RuntimeException(e);
		}
	}
	public void createOrder(Order order) {
		try {
			JdbcUtils.beginTransaction();
			orderDao.add(order);
			JdbcUtils.commitTransaction();
		} catch (SQLException e) {
			try {
				JdbcUtils.rollbackTransaction();
			} catch (SQLException e1) {}
			throw new RuntimeException(e);
		}
	}
	public PageBean<Order> myOrders(String uid, int pc) {
			PageBean<Order> pb=null;
			try {
				pb = orderDao.findByUser(uid, pc);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return pb;
		
	}
	public PageBean<Order> findByStatus(int status, int pc) {
		try {
			JdbcUtils.beginTransaction();
			PageBean<Order> pb = orderDao.findByStatus(status, pc);
			JdbcUtils.commitTransaction();
			return pb;
		} catch (SQLException e) {
			try {
				JdbcUtils.rollbackTransaction();
			} catch (SQLException e1) {}
			throw new RuntimeException(e);
		}
	}
	public PageBean<Order> findAll(int pc) {
		PageBean<Order> pb ;
		try {
			 pb = orderDao.findAll(pc);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return pb;
	
	}
	public List<Order> myorder(String uid) {
		OrderDao od = new OrderDao();
		try {
			return od.findall(uid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	public List<Order> myorder() {
		OrderDao od = new OrderDao();
		try {
			return od.adminfindall();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
