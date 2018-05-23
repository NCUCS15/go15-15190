package cn.itcast.goods.admin.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.goods.user.domain.User;
import cn.itcast.goods.user.service.UserService;

public class Adminuser extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Adminuser() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}


	public String finduser(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
			UserService os = new UserService();
			List<User> user = os.finduser();
			req.setAttribute("userList", user);
			return "f:/adminjsps/admin/user/user.jsp";
	}
}
