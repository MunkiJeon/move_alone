package com.map.ajax;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.map.guest.GuestService;
import com.map.model.InquiryDAO;
import com.map.model.InquiryDTO;

public class InquiryList implements AjaxService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		try {
			request.setCharacterEncoding("UTF-8");
			
			
		ArrayList<InquiryDTO> list = new InquiryDAO().atmosphere(Integer.parseInt(request.getParameter("index")));
		
		
		JSONArray data = new JSONArray();
		System.out.println("testsetset");
		
		for (InquiryDTO dto : list) {
			JSONObject realdata = new JSONObject();
			
			realdata.put("no", dto.getNo());
			realdata.put("id", URLEncoder.encode(dto.getId()));
			realdata.put("contents", URLEncoder.encode(dto.getContents()));
			
			if(dto.getAnswer()!=null){
			realdata.put("answer", URLEncoder.encode(dto.getAnswer()));}
			else {realdata.put("answer", "");}
			data.add(realdata);
		}
		String res = data.toJSONString();
			response.getWriter().append(res);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
