package com.map.ajax;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.map.model.MatchingDAO;
import com.map.model.MatchingDTO;

public class AjaxSelected implements AjaxService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("UTF-8");
			MatchingDTO dto = new MatchingDTO();
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			dto.setRes_num(Integer.parseInt(request.getParameter("ino")));
			dto.setDriver_ID(id);
			dto.setReq_state(1);
			
			int cnt = new MatchingDAO().update(dto);
			
			
			
			JSONObject data = new JSONObject();
			
			if(cnt>0) {
				System.out.println("ddd");
				data.put("cnt", cnt);
				response.getWriter().append(data.toJSONString());
			}
			
			
			
			
		} catch (Exception e) {
			
		}
		
	}

}
