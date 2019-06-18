package com.register.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/textcode")
public class TextCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public TextCodeServlet() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String word=(String) request.getSession().getAttribute("word");
		
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(word);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
