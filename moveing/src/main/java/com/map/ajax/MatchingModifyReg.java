package com.map.ajax;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.map.model.CalculateDAO;
import com.map.model.CalculateDTO;
import com.map.model.MatchingDAO;
import com.map.model.MatchingDTO;
import com.map.model.UserDAO;
import com.map.model.UserDTO;

public class MatchingModifyReg implements AjaxService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		

		MatchingDTO dto = new MatchingDTO();
		dto.setRes_num(Integer.parseInt(request.getParameter("id")));
		dto.setStart_point(request.getParameter("start_point"));
		dto.setEnd_point(request.getParameter("end_point"));
		
		
		System.out.println(request.getParameter("id"));
		
		int cnt = new MatchingDAO().managerUpdate(dto);
		JSONObject data = new JSONObject();

		try {

			if(cnt > 0) {data.put("chk","true"); 
			System.out.println("성공");}
			else {data.put("chk","false");
			System.out.println("실패");}	
		
		response.getWriter().append(data.toJSONString());
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
