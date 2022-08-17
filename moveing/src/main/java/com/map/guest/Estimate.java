package com.map.guest;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.map.model.EstimateDAO;

public class Estimate implements GuestService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String pageNum = request.getParameter("num");
		String test = null;
		EstimateDAO data = new EstimateDAO();
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("id");
		
		if(pageNum==null) {pageNum="";
		System.out.println(pageNum +"번째 입력 값:"+test); }
		else if(pageNum!=null) {
			if(pageNum.equals("2")) {
				
				String option = request.getParameter("option");
				String sel_date = request.getParameter("sel_date");
				String time = request.getParameter("time");
				
				String start_point = request.getParameter("st_zip")
									+request.getParameter("st_addr1")
									+request.getParameter("st_addr2");
				String[] start_op = {
						request.getParameter("start_el"),//엘베 유무
						request.getParameter("start_pk"),//주차 유무
						request.getParameter("st_addr3"),//층수
						request.getParameter("st_addr4"),//개수
						
				};
				
				String end_point = request.getParameter("en_zip")
									+request.getParameter("en_addr1")
									+request.getParameter("en_addr2");
				
				String[] end_op = {
						request.getParameter("end_el"),//엘베 유무
						request.getParameter("end_pk"),//주차 유무
						request.getParameter("en_addr3"),//층수
						request.getParameter("en_addr4"),//방개수
				};
				test= option+"]"+sel_date+"]"+time+"["+start_point+"]["+end_point+"]"+start_op[2]+"]"+end_op[2];
			}else if(pageNum.equals("3")) {
				String item1 = request.getParameter("item1");
				String item2 = request.getParameter("item2");
				String item3 = request.getParameter("item3");
				String box = request.getParameter("box");
				test= item1+"]["+item2+"]["+item3+"]["+box;
			}
			System.out.println(pageNum +"번째 입력 값:"+test); 
			data.addEstiate(pageNum, user_id);
		}
		
		request.setAttribute("mainUrl","guest/estimate"+pageNum+".jsp");
	}

}
