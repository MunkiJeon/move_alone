package com.map.ajax;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.map.model.CalculateDAO;
import com.map.model.CalculateDTO;
import com.map.model.UserDAO;
import com.map.model.UserDTO;

public class AjaxOnOff implements AjaxService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
		}
		
	HttpSession session = request.getSession();
	String id = (String)session.getAttribute("id");
	
	UserDTO dto = new UserDAO().oneUser(id);
	

	
	
	System.out.println(dto.getId());
	
	JSONObject data = new JSONObject();
	try {
		if(request.getParameter("bal").equals("1")) {
			dto.setState((Integer.parseInt(request.getParameter("bal"))));
		}else if (request.getParameter("bal").equals("0")) {
			dto.setState((Integer.parseInt(request.getParameter("bal"))));
		}
		int c = new UserDAO().staffState(dto);
		data.put("bal", request.getParameter("bal"));
		String res = data.toJSONString();
		
		response.getWriter().append(res);
	} catch (Exception e) {
		// TODO: handle exception
	}
}
}