package com.course;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/insertCourseServlet")
public class insertCourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public insertCourseServlet() {
        super();
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("cid");
		String cname = request.getParameter("cName");
		String des = request.getParameter("cDes");
		double fee = Double.parseDouble(request.getParameter("cFee"));
		
		boolean check;
		
		check = courseDBUtil.insertCourse(id, cname, des, fee);
		
		if(check == true) {
			RequestDispatcher dis = request.getRequestDispatcher("success.jsp");
			dis.forward(request, response);
		}else {
			RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
			dis2.forward(request, response);
		}
		
	}

}
