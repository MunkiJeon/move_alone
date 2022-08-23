package com.map.manager;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.map.model.CategoryDao;

public class UpdateLCategoryName implements ManagerService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {


		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int lno = Integer.parseInt(request.getParameter("lno"));
		String i = request.getParameter("i");	
		String lcname = request.getParameter("lcname" + i);
		
		CategoryDao cdao = CategoryDao.getInstance();
		int cnt = cdao.updateLCategoryName(lno, lcname);
		
		String msg = "";
		
		if(cnt > 0){
			msg = "대분류 수정 성공";		
		}
		else{
			msg = "대분류 수정 실패";	
		}
		
		request.setAttribute("mainUrl", "inc/alert.jsp");
		request.setAttribute("goUrl", "manager/CategoryManager");
	}

}
