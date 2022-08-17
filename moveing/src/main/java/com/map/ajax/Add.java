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
import com.map.model.UserDAO;
import com.map.model.UserDTO;

public class Add implements AjaxService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
		}
	
		UserDTO dto = new UserDTO();
		dto.setId(request.getParameter("id"));
		dto.setPw(request.getParameter("pw"));
		dto.setEmail(request.getParameter("email"));
		dto.setName(request.getParameter("name"));
		dto.setTel(request.getParameter("tel"));
		dto.setLevel(Integer.parseInt(request.getParameter("level")));
		
		int cnt = new UserDAO().insert(dto);
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
