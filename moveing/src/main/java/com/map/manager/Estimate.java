package com.map.manager;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.map.model.EstimateDAO;
import com.map.model.EstimateDTO;



public class Estimate implements ManagerService {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("execute >>>>>" + request.getParameter("search_resnum"));
		ArrayList<EstimateDTO> mainData = new EstimateDAO().all(request);
		
		System.out.println("mainData list >>>" + mainData.size());
		
		request.setAttribute("mainData", mainData);
		request.setAttribute("mainUrl", "manager/estimate.jsp");
	}
}
