package com.map.ajax;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.map.model.InquiryDAO;
import com.map.model.InquiryDTO;
import com.map.model.UserDAO;
import com.map.model.UserDTO;

public class ChatBotReg implements AjaxService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		
		UserDTO dto = new UserDAO().oneUser(id);
		
		InquiryDTO inDto = new InquiryDTO();
		
		inDto.setId(id);
		inDto.setContents(request.getParameter("contents"));
		inDto.setName(dto.getName());
		
		int cnt = new InquiryDAO().insert(inDto);
		JSONArray data = new JSONArray();
		
		if(cnt > 0) {data.add("true"); 
		System.out.println("성공");}
		else {data.add("false");
		System.out.println("실패");}
		
		
		try {
			response.getWriter().append(data.toJSONString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
