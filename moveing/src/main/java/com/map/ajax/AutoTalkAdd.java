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
import com.map.model.ChatBotDAO;
import com.map.model.ChatBotDTO;
import com.map.model.UserDAO;
import com.map.model.UserDTO;

public class AutoTalkAdd implements AjaxService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
		}
	
		ChatBotDTO dto = new ChatBotDTO();
		dto.setQuestions(request.getParameter("questions"));
		dto.setAnswer(request.getParameter("answer"));
		dto.setType(request.getParameter("type"));
		
		int cnt = new ChatBotDAO().insert(dto);
		JSONArray data = new JSONArray();
		System.out.println(cnt);
		
		try {
		if(cnt > 0) {data.add("true"); 
		System.out.println("성공");}
		else {data.add("false");
		System.out.println("실패");}
		
		String res = data.toString();
		
		response.getWriter().append(res);
			
		response.getWriter().append(data.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
