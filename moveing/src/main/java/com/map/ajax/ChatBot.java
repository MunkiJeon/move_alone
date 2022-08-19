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

public class ChatBot implements AjaxService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");

		
		
		JSONArray data = new JSONArray();
		
		ArrayList<InquiryDTO> list = new InquiryDAO().idList(id);
		
		
		for (InquiryDTO dto : list) {
			JSONObject detailData = new JSONObject();
			String answer = "null";
			if(dto.getAnswer()!=null) {
				answer = dto.getAnswer();
			}
			try {
				detailData.put("inquiry",URLEncoder.encode(dto.getContents(),"UTF-8") );
				detailData.put("answer", URLEncoder.encode(answer,"UTF-8"));
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			data.add(detailData);
			
		}
		
		
		
		try {
			response.getWriter().append(data.toJSONString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
