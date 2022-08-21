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
		session.setAttribute("stf", "ss");
		String id = (String) session.getAttribute("id");
		ArrayList<MatchingDTO> dto2 = new MatchingDAO().oneUserForGuest(id,0);
		ArrayList<MatchingDTO> dto4 = new MatchingDAO().oneUserForGuest(id,1);
		String stf;
		UserDTO dto = new UserDAO().oneUser(id);
		
		
		
		
		
		for(MatchingDTO dd : dto2) {
			if(dd.getUser_ID().equals(id)) {
				stf = dd.getDriver_ID();
				session.setAttribute("stf", stf);
				UserDTO dto3 = new UserDAO().oneStaff(stf);
				
				request.setAttribute("dto3", dto3);
			}
		}
			

		request.setAttribute("dto",dto);
		request.setAttribute("dto2", dto2);
		request.setAttribute("dto4", dto4);
		
	}
}
