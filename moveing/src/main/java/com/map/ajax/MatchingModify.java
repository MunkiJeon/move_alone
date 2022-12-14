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

public class MatchingModify implements AjaxService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
	
		System.out.println(request.getParameter("id"));
		
		
		MatchingDTO dto = new MatchingDAO().res_num(Integer.parseInt(request.getParameter("id")) );
		JSONObject data = new JSONObject();

		try {
		
		data.put("res_num",dto.getRes_num());
//		data.put("reservat_date",dto.getReservat_date());
		data.put("start_point",URLEncoder.encode(dto.getStart_point(),"UTF-8"));
		data.put("end_point",URLEncoder.encode(dto.getEnd_point(),"UTF-8"));
			
		
		response.getWriter().append(data.toJSONString());
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
