package com.map.manager;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.map.model.CategoryDao;

public class SmallCategoryDown implements ManagerService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {


		int lno = Integer.parseInt(request.getParameter("lno"));
		int sno = Integer.parseInt(request.getParameter("sno"));
		int sstep = Integer.parseInt(request.getParameter("sstep")); // 해당 대분류의 순서
		
	 	CategoryDao cdao = CategoryDao.getInstance();	

		int totalRows = cdao.countScategory(lno);	// lno에 해당하는 소분류의 총 개수	
		int result = -1;
		
		if (totalRows != -1 && totalRows != sstep) { // cdao.countLcategory() 처리가 성공하였고, 수정하려는 행의 step이 마지막이 아닌 경우
			result = cdao.updateDownSStep(lno, sno, sstep);
		}
		
		request.setAttribute("mainUrl", "inc/alert.jsp");
		request.setAttribute("goUrl", "manager/CategoryManager");
	}

}
