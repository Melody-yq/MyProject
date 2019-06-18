package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.PageBean;
import com.service.ProductService;

import net.sf.json.JSONObject;


@WebServlet("/page")
public class PageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public PageServlet() {
		super();
		// TODO Auto-generated constructor stub
	}
	private ProductService productService = new ProductService();

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pagesize = request.getParameter("pagesize");
		String pageno = request.getParameter("pageno");	
		int pageSize = Integer.parseInt(pagesize);
		int pageNo = Integer.parseInt(pageno);
		PageBean pageBean = productService.getPage(pageSize, pageNo);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(JSONObject.fromObject(pageBean));

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
