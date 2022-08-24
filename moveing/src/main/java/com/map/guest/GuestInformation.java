package com.map.guest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.map.model.UserDAO;
import com.map.model.UserDTO;

public class GuestInformation implements GuestService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		UserDTO dto = new UserDAO().oneUser(id);
		request.setAttribute("dto",dto);
		request.setAttribute("mainUrl", "guest/myInformation.jsp");
	}

}
