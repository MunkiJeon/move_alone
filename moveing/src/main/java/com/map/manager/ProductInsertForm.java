package com.map.manager;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.map.model.CategoryBean;
import com.map.model.CategoryDao;




public class ProductInsertForm implements ManagerService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		CategoryDao cdao = CategoryDao.getInstance();
		ArrayList<CategoryBean> list = cdao.getOnlyLargeCategory();
		
		request.setAttribute("list", list);
		request.setAttribute("mainUrl", "manager/productInsertForm.jsp");
	}

}
