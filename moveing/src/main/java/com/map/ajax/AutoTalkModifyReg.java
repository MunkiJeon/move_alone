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

public class AutoTalkModifyReg implements AjaxService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
	

		ChatBotDTO dto = new ChatBotDTO();
		dto.setNo(Integer.parseInt(request.getParameter("no")));
		dto.setQuestions(request.getParameter("questions"));
		dto.setAnswer(request.getParameter("answer"));
		dto.setType(request.getParameter("type"));
		
		
		JSONObject data = new JSONObject();
		
		
		int cnt = new ChatBotDAO().modify(dto);
		System.out.println(dto.getNo()+"------------------------------------");
		System.out.println(dto.getAnswer());
		System.out.println(dto.getQuestions());
		System.out.println(dto.getType());
		System.out.println(cnt);
		
		try {
			if(cnt > 0) {data.put("chk","true"); 
			System.out.println("성공");}
			else {data.put("chk","false");
			System.out.println("실패");}
			
			String res = data.toString();
		
			response.getWriter().append(data.toJSONString());
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
