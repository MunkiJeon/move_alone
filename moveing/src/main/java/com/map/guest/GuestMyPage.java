package com.map.guest;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.map.model.UserDTO;
import com.map.model.MatchingDAO;
import com.map.model.MatchingDTO;
import com.map.model.UserDAO;

public class GuestMyPage implements GuestService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("mainUrl", "guest/mypage.jsp");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		UserDTO dto = new UserDAO().oneUser(id);
		ArrayList<MatchingDTO> dto2 = new MatchingDAO().oneUserForGuest(id);
		request.setAttribute("dto",dto);
		request.setAttribute("dto2", dto2);
		
	}
}
