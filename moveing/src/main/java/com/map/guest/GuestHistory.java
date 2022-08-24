package com.map.guest;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.map.model.MatchingDAO;
import com.map.model.MatchingDTO;

public class GuestHistory implements GuestService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("mainUrl", "guest/history.jsp");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		ArrayList<MatchingDTO> dto2 = new MatchingDAO().oneUserForGuest(id,2);
		
		request.setAttribute("dto2", dto2);
	}

}
