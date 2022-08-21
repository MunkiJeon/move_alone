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
		String air = "";
		UserDTO dto = new UserDAO().oneUser(id);
		ArrayList<MatchingDTO> dto2 = new MatchingDAO().workList(id,2);
		ArrayList<MatchingDTO> dto3 = new MatchingDAO().workList(id,1);
		ArrayList<MatchingDTO> dto4 = new MatchingDAO().workList(air,0);
		int res = 0;
		
		for(MatchingDTO dd : dto2) {
			System.out.println(dd.getCost());
			res+=dd.getCost();
		}

		request.setAttribute("dtoS", dto);
		request.setAttribute("dtoS2", dto2);
		request.setAttribute("dtoS3", dto3);
		request.setAttribute("dto4", dto4);
		request.setAttribute("re", res);
	}

}
