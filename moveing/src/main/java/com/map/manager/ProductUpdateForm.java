package com.map.manager;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.map.model.CategoryBean;
import com.map.model.CategoryDao;
import com.map.model.ProductBean;
import com.map.model.ProductDao;
import com.map.model.StockBean;
import com.map.model.StockDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;



public class ProductUpdateForm implements ManagerService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int pno = Integer.parseInt(request.getParameter("pno"));
		System.out.println(pno);
		
		ProductDao pdao = ProductDao.getInstance();
		ProductBean pbean = pdao.getProduct(pno);
		
		CategoryDao cdao = CategoryDao.getInstance();
		ArrayList<CategoryBean> lcateList = cdao.getOnlyLargeCategory();
		
		StockDao sdao = StockDao.getInstance();
		ArrayList<StockBean> slist = sdao.getAllStockByPno(pno);
		
		

		request.setAttribute("pno", pno);
		request.setAttribute("pbean", pbean);
		request.setAttribute("lcateList", lcateList);
		request.setAttribute("slist", slist);
		request.setAttribute("mainUrl", "manager/prodUpdateForm.jsp");
	}

}
