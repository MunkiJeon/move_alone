package com.map.manager;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.map.model.ProductBean;

import com.map.model.ProductDao;
import com.map.model.StockDao;




public class ProductDelete implements ManagerService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String msg = "실패";
		int pno = Integer.parseInt(request.getParameter("pno"));

		ProductDao pdao = ProductDao.getInstance();
		ProductBean pbean = pdao.getProduct(pno);
		
		/* 존재하는 사진부터 지우기 */
		String targetLocation;
		targetLocation ="C:\\Users\\main\\Desktop\\last\\moveing\\src\\main\\webapp\\resource\\productImg";
		if(pbean.getMainImgN() != null){
			File delFile = new File(targetLocation, pbean.getMainImgN());
			
			boolean isSuccessed = false;
			
			if(delFile.exists()){ // true, false
				
				isSuccessed = delFile.delete(); // 파일 삭제
			}
		}

		
		/* DB에서 해당 행 지우기 */
		int cnt = pdao.deleteProduct(pno);
		
		/* 사이즈에서 해당 테이블 지우기 */
		StockDao sdao = StockDao.getInstance();
		int cnt2 = sdao.deleteAllStock(pno);
		request.setAttribute("mainUrl", "inc/alert.jsp");
		request.setAttribute("goUrl", "manager/ProductList");
		
		if(cnt>0) {
			msg="삭제 완료";
		}
		request.setAttribute("msg", msg);
		
		
	}

}
