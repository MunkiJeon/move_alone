package com.map.manager;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.map.model.UserDAO;
import com.map.model.UserDTO;

public class StaffManagement implements ManagerService {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int level = Integer.parseInt(request.getParameter("level"));
		
		ArrayList<UserDTO> mainData = new UserDAO().levelUser(level);
		
		if(level==1) {request.setAttribute("title", "기사");}
		else {request.setAttribute("title", "고객");}
		
		
		request.setAttribute("level", level);
		request.setAttribute("mainData", mainData);
		request.setAttribute("mainUrl", "manager/staffmanagement.jsp");
	}
}
