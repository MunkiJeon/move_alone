package com.map.ajax;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import com.map.model.CalculateDAO;
import com.map.model.CalculateDTO;

public class CalcDay implements AjaxService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
		}
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String type = request.getParameter("type");
		
		ArrayList<CalculateDTO> list = new CalculateDAO().monthList(start, end,type);
		System.out.println(request.getParameter("type")+"--");
		System.out.println(request.getParameter("param")+"--");
		System.out.println(request.getParameter("start")+"--");
		System.out.println(request.getParameter("end")+"--");
		JSONArray data = new JSONArray();
		if(!request.getParameter("param").equals("")) {
		for (CalculateDTO dto : list) {
			if(dto.getCal_type().equals(request.getParameter("param")))
				data.add( URLEncoder.encode(dto.getPo_name())+","+URLEncoder.encode(dto.getPrice()+"") );			
		}
		}else {
			for (CalculateDTO dto : list) {
				data.add( URLEncoder.encode(dto.getPo_name())+","+URLEncoder.encode(dto.getPrice()+"") );			
			}
		}
		try {
			response.getWriter().append(data.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
