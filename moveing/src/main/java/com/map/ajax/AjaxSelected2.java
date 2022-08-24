package com.map.ajax;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.map.model.CalculateDAO;
import com.map.model.CalculateDTO;
import com.map.model.MatchingDAO;
import com.map.model.MatchingDTO;

public class AjaxSelected2 implements AjaxService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("UTF-8");
			MatchingDTO dto = new MatchingDTO();
			
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			dto.setRes_num(Integer.parseInt(request.getParameter("ino2")));
			dto.setDriver_ID(id);
			dto.setReq_state(2);
			
			MatchingDTO dto2 = new MatchingDAO().res_num(Integer.parseInt(request.getParameter("ino2")));
			double res = (double)dto2.getCost()*(double)0.70;
			int cost = (int)Math.round(res);
			
			int cnt = new MatchingDAO().update2(dto);
			
			CalculateDTO dto3 = new CalculateDTO();
			System.out.println(dto2.getSV_Type());
			dto3.setPo_name(dto2.getSV_Type());
			dto3.setPrice(cost);
			dto3.setRes_num(Integer.parseInt(request.getParameter("ino2")));
			
			int cnt2 = new CalculateDAO().insert2(dto3);
			
			JSONObject data = new JSONObject();
			
			
			 if(cnt>0) { System.out.println("ddd");
			 data.put("cnt", cnt);
			 response.getWriter().append(data.toJSONString()); }
			 
			
			
			
		} catch (Exception e) {
			
		}
		
	}

}
