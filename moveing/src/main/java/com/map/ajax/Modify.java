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

public class Modify implements AjaxService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
	
		System.out.println(request.getParameter("id"));
		
		
		UserDTO dto = new UserDAO().oneUser(request.getParameter("id"));
		JSONObject data = new JSONObject();
		System.out.println(dto.getId());
		System.out.println(dto.getPw());
		System.out.println(dto.getName());
		System.out.println(dto.getEmail());
		System.out.println(dto.getTel());
		
		try {
		
		data.put("id",URLEncoder.encode(dto.getId(),"UTF-8"));
		data.put("pw",URLEncoder.encode(dto.getPw(),"UTF-8"));
		data.put("name",URLEncoder.encode(dto.getName(),"UTF-8"));
		data.put("email",URLEncoder.encode(dto.getEmail(),"UTF-8"));
		data.put("tel",URLEncoder.encode(dto.getTel(),"UTF-8"));
			
		String res = data.toString();
		
		response.getWriter().append(data.toJSONString());
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
