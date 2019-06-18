package com.register.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




import com.register.domain.User;
import com.register.service.UserService;

public class CheckLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	private UserService userService = new UserService();

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		// 获得用户名及密码
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		User user =userService.selectUser(username, password);
		if (user!=null) {
			System.out.println("true");
			HttpSession session = request.getSession(true);
			session.setAttribute("loginok", true);// servlet中的设置session方式
			response.sendRedirect("admin/home.jsp");
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('用户名或密码错误，请重新登录');window.location.href='login.jsp';</script>");
			// response.sendRedirect("login.jsp");
		}
	}

}
