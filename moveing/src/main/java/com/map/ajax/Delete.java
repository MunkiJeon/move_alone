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

public class Delete implements AjaxService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
	
		String[] idList = request.getParameter("id").split(",");
		System.out.println(request.getParameter("id"));
		UserDAO dao = new UserDAO();
		JSONObject data = new JSONObject();
		int cnt = 0;
		for (String id : idList) {
			
			 cnt += new UserDAO().managerDelete(id);
		}
		
		
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
