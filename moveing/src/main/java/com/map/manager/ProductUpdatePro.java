package com.map.manager;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.map.model.CalculateDAO;
import com.map.model.ProductBean;
import com.map.model.ProductDao;
import com.map.model.StockDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;





public class ProductUpdatePro implements ManagerService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// 1. 웹서버 내에서 저장될 위치를 지정하기 위해, jsp의 내장객체 config를 이용해서 웹서버 내에서 특정 위치의 경로를 생성
		String targetLocation;
		targetLocation ="C:\\Users\\main\\Desktop\\last\\moveing\\src\\main\\webapp\\resource\\productImg";
		//System.out.println(targetLocation);
		
		// 2. 최대 업로드 가능 사이즈를 지정 및 인코딩 방식 지정
		int maxSize = 1024 * 1024 * 10; 	// 5메가
		String encType = "UTF-8"; 		// 한글이 안깨지도록
		
		// 3. 웹서버 폴더 내의 targetLocation 경로로 업로드 실행(객체 생성 = 업로드 실행임) 
		//MultipartRequest multi = new MultipartRequest(request, targetLocation, maxSize, encType);
		MultipartRequest multi = null;
		try {
			multi = new MultipartRequest(request, targetLocation, maxSize, encType, new DefaultFileRenamePolicy());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		/* DB에서의 수정 */
		ProductDao pdao = ProductDao.getInstance();
		int cnt1 = pdao.updateProduct(multi);
		if(cnt1 > 0){
			System.out.println("상품 수정 완료");
		}else{
			System.out.println("상품 수정 실패");
		} 
		
		
		/* 이전과 달라진 부분이 있다면 존재하던 사진 파일 삭제 */	
		String beforeMainImg = multi.getParameter("beforeMainImg");
		
		String mainImgN = multi.getFilesystemName("mainImg");
		
		
		if(beforeMainImg != null && mainImgN !=  null){
			File delFile = new File(targetLocation, beforeMainImg);
			
			boolean isSuccessed = false;
			
			if(delFile.exists()){ // true, false
				
				isSuccessed = delFile.delete(); // 파일 삭제
			}	
		}
		
	
		
		String haveToBedelete = multi.getParameter("haveToBedelete");
		String[] arr = haveToBedelete.split(",");
		
		for(String s : arr){
			if(s != null){
				File delFile = new File(targetLocation, s);
				if(delFile.exists()){ // true, false
					delFile.delete(); // 파일 삭제
				}	
			}
		}
		
		
		ProductDao da2 = ProductDao.getInstance();
		int s = da2.selectCount(Integer.parseInt(multi.getParameter("pno")));

		int res = s+Integer.parseInt(multi.getParameter("stock_1"));
		
		
		ProductDao da1 = ProductDao.getInstance();
		int cnt3 = da1.updateCount(res,Integer.parseInt(multi.getParameter("pno")));
		if(cnt3 > 0){
			System.out.println("매출 완료");
		}else{
			System.out.println("매출 실패");
		}
		
		int cnt2 = new CalculateDAO().insert(multi);
		if(cnt2 > 0){
			System.out.println("재고 재삽입 완료");
		}else{
			System.out.println("재고 재삽입 실패");
		}
//		StockDao sdao = StockDao.getInstance();
//		//재고 전부 delete.
//		int cnt2 = sdao.deleteAllStock(Integer.parseInt(multi.getParameter("pno")));
//		if(cnt2 > 0){
//			System.out.println("재고 재삽입전 전부 삭제완료");
//		}else{
//			System.out.println("재고 재삽입전 전부 삭제실패");
//		}
		
		/* 재고삽입 수정후에 하는 재고 삽입은 따로 이를 위한 함수를 만들어주자.*/
		
//		int cnt3 = sdao.insertStockForUpdate(multi);
//		
//		if(cnt3 > 0){
//			System.out.println("재고 재삽입 완료");
//		}else{
//			System.out.println("재고 재삽입 실패");
//		}

		request.setAttribute("mainUrl", "inc/alert.jsp");
		request.setAttribute("msg", "성공");
		request.setAttribute("goUrl", "manager/ProductList");
	}

}
