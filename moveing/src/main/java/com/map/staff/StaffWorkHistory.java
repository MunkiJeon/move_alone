package com.map.staff;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.map.model.MatchingDAO;
import com.map.model.MatchingDTO;

public class StaffWorkHistory implements StaffService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("mainUrl", "staff/workHistory.jsp");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");	
		ArrayList<MatchingDTO> dto2 = new MatchingDAO().workList(id,2);
		int res = 0;
		for(MatchingDTO dd : dto2) {
			System.out.println(dd.getCost());
			res+=dd.getCost();
		}
		request.setAttribute("dtoS2", dto2);
		request.setAttribute("re", res);
	}

}
