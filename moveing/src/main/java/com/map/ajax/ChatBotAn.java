package com.map.ajax;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.map.model.ChatBotDAO;
import com.map.model.ChatBotDTO;

public class ChatBotAn implements AjaxService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
		}
		System.out.println(request.getParameter("contents"));
		System.out.println("접속됨");
		ArrayList<ChatBotDTO> dto = new ChatBotDAO().list();
		
		
		JSONArray data = new JSONArray();
		for(ChatBotDTO dd : dto) {
			try {
				JSONObject data2 = new JSONObject();			
				data2.put("questions",URLEncoder.encode(dd.getQuestions(),"UTF-8"));
				data2.put("answer",URLEncoder.encode(dd.getAnswer(),"UTF-8"));
				if(dd.getType().equals("기사관련")) {
					System.out.println(dd.getQuestions());
					data2.put("staffQ", URLEncoder.encode(dd.getQuestions()));
					data2.put("staffA", URLEncoder.encode(dd.getAnswer()));
				}
				if(dd.getType().equals("이사관련")) {
					System.out.println(dd.getQuestions());
					data2.put("moveQ", URLEncoder.encode(dd.getQuestions()));
					data2.put("moveA", URLEncoder.encode(dd.getAnswer()));
				}
				
				data.add(data2);
				
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		
		
		try {
			response.getWriter().append(data.toJSONString());
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		
	}

}
