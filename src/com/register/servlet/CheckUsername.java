package com.register.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.register.domain.User;
import com.register.service.UserService;

@WebServlet("/checkusername")
public class CheckUsername extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CheckUsername() {
		super();

	}

	private UserService userService = new UserService();

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 拿到一个username，取查数据库，查完返回true，false
		String username = request.getParameter("username");
		User user = userService.selectUsername(username);
		boolean flag = true;
		if (user != null) {
			flag = false;
		}
		response.getWriter().print("" + flag);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
