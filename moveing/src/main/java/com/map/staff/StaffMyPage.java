package com.map.staff;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.map.model.MatchingDAO;
import com.map.model.MatchingDTO;
import com.map.model.UserDAO;
import com.map.model.UserDTO;

public class StaffMyPage implements StaffService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("mainUrl", "staff/mypage.jsp");
		
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");	
		UserDTO dto = new UserDAO().oneUser(id);
		ArrayList<MatchingDTO> dto2 = new MatchingDAO().oneUserForStaff(id);
		request.setAttribute("dtoS", dto);
		request.setAttribute("dtoS2", dto2);
	}

}
