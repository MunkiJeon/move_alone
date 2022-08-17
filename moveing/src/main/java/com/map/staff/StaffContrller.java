package com.map.staff;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.map.guest.GuestService;

/**
 * Servlet implementation class StaffContrller
 */
@WebServlet("/staff/*")
public class StaffContrller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public StaffContrller() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String service = request.getRequestURI().substring((request.getContextPath()+"/staff/").length());
		request.setAttribute("config", "staff");
		try {
			StaffService ss = (StaffService)Class.forName("com.map.staff."+service).newInstance();
			ss.execute(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RequestDispatcher rs = request.getRequestDispatcher("/view/template.jsp");
		rs.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
