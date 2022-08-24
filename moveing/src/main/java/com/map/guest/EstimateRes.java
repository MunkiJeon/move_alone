package com.map.guest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.map.model.EstimateDAO;

public class EstimateRes implements GuestService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String user_id = (String)request.getSession().getAttribute("id");
		EstimateDAO res =new EstimateDAO();
		res.send(user_id);
		
		request.setAttribute("mainUrl", "guest/main.jsp");
	}
}
