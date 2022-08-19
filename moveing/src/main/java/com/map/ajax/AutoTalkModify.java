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

public class AutoTalkModify implements AjaxService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
	
		
		System.out.println(request.getParameter("no")+"----------------");
		
		
		ChatBotDTO dto = new ChatBotDAO().oneAnswer(request.getParameter("no"));
		JSONObject data = new JSONObject();
		
		
		try {
		
		data.put("no",dto.getNo());
		data.put("type",URLEncoder.encode(dto.getType(),"UTF-8"));
		data.put("questions",URLEncoder.encode(dto.getQuestions(),"UTF-8"));
		data.put("answer",URLEncoder.encode(dto.getAnswer(),"UTF-8"));
			
		System.out.println(dto.getNo()+"000");
		
		response.getWriter().append(data.toJSONString());
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
