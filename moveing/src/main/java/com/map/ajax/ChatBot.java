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
		String contents = request.getParameter("contents");
		
		UserDTO dto = new UserDAO().oneUser(id);
		
		InquiryDTO iqDto = new InquiryDTO();
		iqDto.setId(dto.getId());
		iqDto.setName(dto.getName());
		iqDto.setContents(contents);
		int cnt=0;
		if(!contents.equals("null")) {
			new InquiryDAO().insert(iqDto);
		}
		JSONArray data = new JSONArray();
		
		ArrayList<InquiryDTO> list = new InquiryDAO().idList(id);
		for (InquiryDTO inquiryDTO : list) {
			
			try {
				data.add(URLEncoder.encode(inquiryDTO.getContents(),"UTF-8"));
				
				if(inquiryDTO.getAnswer()!=null) {
				data.add(URLEncoder.encode(inquiryDTO.getAnswer(),"UTF-8"));
				}else {data.add("null");}
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		try {
			response.getWriter().append(data.toJSONString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
