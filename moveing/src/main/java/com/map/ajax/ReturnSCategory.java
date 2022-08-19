package com.map.ajax;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.map.manager.ManagerService;
import com.map.model.CategoryBean;
import com.map.model.CategoryDao;



public class ReturnSCategory implements AjaxService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {


		int lno = Integer.parseInt(request.getParameter("lno"));

		CategoryDao cdao = CategoryDao.getInstance();
		ArrayList<CategoryBean> scateList = cdao.getOnlySmallCategory(lno);
		
		JSONObject jsonList = new JSONObject();
		JSONArray itemList = new JSONArray();
		
		for(CategoryBean cbean : scateList){
			JSONObject tempJson = new JSONObject();
			try {
				tempJson.put("sno",URLEncoder.encode(cbean.getSno()+"","UTF-8") );
				tempJson.put("sname", URLEncoder.encode(cbean.getSname(),"UTF-8"));
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			itemList.add(tempJson);
		}
		
		jsonList.put("ITEMS", itemList);
		
		try {
			response.getWriter().append(jsonList.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
