package com.map.manager;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.map.model.CategoryDao;

public class InsertLCategory implements ManagerService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String lcname = request.getParameter("lcname");
		
		
		CategoryDao cdao = CategoryDao.getInstance();
		int cnt = cdao.insertLCategory(lcname);
		
		String msg = "";
		
		if(cnt > 0){
			msg = "대분류 추가 성공";		
		}
		else{
			msg = "대분류 추가 실패";	
		}
		request.setAttribute("msg", msg);
		request.setAttribute("mainUrl", "inc/alert.jsp");
		request.setAttribute("goUrl", "manager/CategoryManager");
	}

}
