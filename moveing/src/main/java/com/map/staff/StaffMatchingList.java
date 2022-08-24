package com.map.staff;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.map.model.MatchingDAO;
import com.map.model.MatchingDTO;

public class StaffMatchingList implements StaffService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("mainUrl", "staff/matchingList.jsp");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		ArrayList<MatchingDTO> dto3 = new MatchingDAO().workList(id,1);
		
		request.setAttribute("dtoS3", dto3);
	}

}
