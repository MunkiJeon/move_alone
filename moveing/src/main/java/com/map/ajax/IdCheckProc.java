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

public class IdCheckProc implements AjaxService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("UTF-8");
			String id = request.getParameter("id");
			System.out.println(id+"------------------------------");
			UserDAO mdao = UserDAO.getInstance();
			UserDTO dto = mdao.oneUser(id);
			JSONObject data = new JSONObject();
			String chk = "";
			if(dto != null){
				chk = "IMPOSSIBLE";	
			}else{
				chk = "POSSIBLE";
			}
			System.out.println(chk);
		data.put("chk", chk);
			
		response.getWriter().append(data.toJSONString());
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}