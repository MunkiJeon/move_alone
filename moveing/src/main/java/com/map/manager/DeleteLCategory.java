package com.map.manager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.map.model.CategoryDao;

public class DeleteLCategory implements ManagerService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int lno = Integer.parseInt(request.getParameter("lno"));
		int lstep = Integer.parseInt(request.getParameter("lstep"));

		CategoryDao cdao = CategoryDao.getInstance();
		
		int cnt = cdao.countScategory(lno);
		
		String msg = "";
		if(cnt != 0){
			msg = "하위 소분류가 존재하여 삭제가 불가합니다.";
		}
		else{
			int result = cdao.deleteLCategory(lno, lstep);
			
			if(result > 0){
				msg = "대분류 삭제 성공";		
			}
			else{
				msg = "대분류 삭제 실패";	
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("mainUrl", "inc/alert.jsp");
		request.setAttribute("goUrl", "manager/CategoryManager");
	}

}
