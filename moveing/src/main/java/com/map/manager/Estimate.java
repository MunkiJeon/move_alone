package com.map.manager;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.map.model.MatchingDAO;
import com.map.model.MatchingDTO;

public class Estimate implements ManagerService {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("mainUrl", "manager/estimate.jsp");
	}
}
