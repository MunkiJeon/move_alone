package com.map.manager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.map.model.CategoryDao;

public class DeleteSCategory implements ManagerService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		int sno = Integer.parseInt(request.getParameter("sno"));
		int sstep = Integer.parseInt(request.getParameter("sstep"));

		CategoryDao cdao = CategoryDao.getInstance();
		int cnt = cdao.deleteSCategory(sno, sstep);
		
		String msg = "";
		
		if(cnt > 0){
			msg = "소분류 삭제 성공";		
		}
		else{
			msg = "소분류 삭제 실패";	
		}
		request.setAttribute("msg", msg);
		request.setAttribute("mainUrl", "inc/alert.jsp");
		request.setAttribute("goUrl", "manager/CategoryManager");
	}

}
