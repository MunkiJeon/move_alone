package com.map.staff;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.map.model.MatchingDAO;
import com.map.model.MatchingDTO;

public class StaffWorkList implements StaffService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("mainUrl", "staff/workList.jsp");
		String air = "";
		ArrayList<MatchingDTO> dto4 = new MatchingDAO().workList(air,0);
		
		request.setAttribute("dto4", dto4);
	}
}
