package com.map.manager;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.map.model.CategoryDao;

public class LargeCategoryUp implements ManagerService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {


		int lno = Integer.parseInt(request.getParameter("lno"));
		int lstep = Integer.parseInt(request.getParameter("lstep")); // 해당 대분류의 순서
		
		CategoryDao cdao = CategoryDao.getInstance();	
		
		int result = -1;
		
		if (lstep > 1) { // 수정하려는 행의 step이 맨 첫번째가 아닌 경우
			result = cdao.updateUpLStep(lno, lstep);
		}

		request.setAttribute("mainUrl", "inc/alert.jsp");
		request.setAttribute("goUrl", "manager/CategoryManager");
	}

}
