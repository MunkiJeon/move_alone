package com.map.manager;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.map.model.ProductBean;
import com.map.model.ProductDao;



public class ProductList implements ManagerService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		ProductDao pdao = ProductDao.getInstance();
		ArrayList<ProductBean> list = pdao.getAllProduct();
		
		
		request.setAttribute("list", list);
		request.setAttribute("mainUrl", "manager/productList.jsp");
	}

}
