package com.map.guest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.map.model.EstimateDAO;

public class CostCalc implements GuestService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		EstimateDAO dao = new EstimateDAO();
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		int res_num = dao.detailToRes_num(id);
		int step = dao.checkStaps(id, res_num);
		
		System.out.println("CostCalc들어옴 ID:"+id+" res_num:"+res_num+ " step:"+step);
		
		session.setAttribute("res_num", res_num);
		request.setAttribute("res_num", res_num);
		request.setAttribute("step", step);
		request.setAttribute("mainUrl", "guest/costcalc.jsp");
	}

}
