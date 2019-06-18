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
		//��ȡ����
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		//����ҵ���߼�
		userService.addUser( username,password);
		//��ת����ҳ
		response.sendRedirect("login.jsp");
		}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
