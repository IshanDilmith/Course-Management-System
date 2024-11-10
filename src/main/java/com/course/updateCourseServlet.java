package com.course;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/updateCourseServlet")
public class updateCourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public updateCourseServlet() {
        super();
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cid = request.getParameter("cID");
		String cname = request.getParameter("cName");
		String cdes = request.getParameter("cDes");
		double cfee = Double.parseDouble(request.getParameter("cFee"));
		
		boolean check;
		
		check = courseDBUtil.updateCourse(cid, cname, cdes, cfee);
		
		if(check == true) {
			RequestDispatcher dis = request.getRequestDispatcher("success.jsp");
			dis.forward(request, response);
		}else {
			RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
			dis2.forward(request, response);
		}
		
	}

}
