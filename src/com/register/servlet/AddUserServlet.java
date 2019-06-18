package com.register.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.register.service.UserService;

public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public AddUserServlet() {
		super();
	}
	private UserService userService=new UserService();

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		//获取参数
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		//调用业务逻辑
		userService.addUser( username,password);
		//跳转到主页
		response.sendRedirect("login.jsp");
		}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
