package com.map.staff;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.map.model.UserDAO;
import com.map.model.UserDTO;

public class StaffInformation implements StaffService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("mainUrl", "staff/staffInfo.jsp");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		UserDTO dto = new UserDAO().oneUser(id);
		request.setAttribute("dtoS", dto);
	}

}
