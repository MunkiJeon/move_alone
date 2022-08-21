package com.map.manager;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.map.model.MatchingDAO;
import com.map.model.MatchingDTO;

public class Matching implements ManagerService {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("execute >>>>>" + request.getParameter("search_resnum"));
		ArrayList<MatchingDTO> mainData = new MatchingDAO().allUser(request);
		
		System.out.println("mainData list >>>" + mainData.size());
		
		request.setAttribute("mainData", mainData);
		request.setAttribute("mainUrl", "manager/matching.jsp");
	}
}
