package com.map.manager;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.map.model.CategoryDao;

public class LargeCategoryDown implements ManagerService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {


		int lno = Integer.parseInt(request.getParameter("lno"));
		int lstep = Integer.parseInt(request.getParameter("lstep")); // 해당 대분류의 순서
		
		CategoryDao cdao = CategoryDao.getInstance();	
		
		int totalRows = cdao.countLcategory();	// 대분류의 총 개수	
		int result = -1;
		
		if (totalRows != -1 && lstep < totalRows-1) { // cdao.countLcategory() 처리가 성공하였고, 수정하려는 행의 step이 마지막이 아닌 경우
			result = cdao.updateDownLStep(lno, lstep);
		}
		
		request.setAttribute("mainUrl", "inc/alert.jsp");
		request.setAttribute("goUrl", "manager/CategoryManager");
	}

}
