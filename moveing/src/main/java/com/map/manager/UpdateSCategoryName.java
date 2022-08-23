package com.map.manager;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.map.model.CategoryDao;

public class UpdateSCategoryName implements ManagerService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {



		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int sno = Integer.parseInt(request.getParameter("sno"));
		String i = request.getParameter("i");	
		String scname = request.getParameter("scname" + i);
		
		System.out.println("sno:" + sno);
		System.out.println("i:" + i);
		System.out.println("scname:" + scname);
		
		CategoryDao cdao = CategoryDao.getInstance();
		int cnt = cdao.updateSCategoryName(sno, scname);
		
		String msg = "";
		
		if(cnt > 0){
			msg = "소분류 수정 성공";		
		}
		else{
			msg = "소분류 수정 실패";	
		}
		
		request.setAttribute("mainUrl", "inc/alert.jsp");
		request.setAttribute("goUrl", "manager/CategoryManager");
	}

}
