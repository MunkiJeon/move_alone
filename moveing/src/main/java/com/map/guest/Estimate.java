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
		String gim_data = null;
		String sel_date =null;
		EstimateDAO data = new EstimateDAO();
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("id");
		
		if(pageNum==null) {pageNum="";
		System.out.println(pageNum +"번째 입력 값:"+user_id); 
		data.addEstimate(pageNum, user_id, sel_date,gim_data);}
		
		else if(pageNum!=null) {
			if(pageNum.equals("2")) {
				
				String option = request.getParameter("option");
				sel_date = request.getParameter("sel_date");
				session.setAttribute("sel_date", sel_date);
				String time = request.getParameter("time");
				
				String start_point = request.getParameter("st_zip")
									+request.getParameter("st_addr1")
									+request.getParameter("st_addr2");
				String[] start_op = {
						request.getParameter("start_el"),//엘베 유무
						request.getParameter("start_pk"),//주차 유무
						request.getParameter("st_addr3"),//층수
						request.getParameter("st_addr4"),//개수
						request.getParameter("st_addr4"),//방개수
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
				gim_data= option+"@"+sel_date+"@"+time+"@"
				+start_point+"@"+start_op[0]+","+start_op[1]+","+start_op[2]+","+start_op[3]+"@"
				+end_point+"@"+end_op[0]+","+end_op[1]+","+end_op[2]+","+end_op[3];
				
			}else if(pageNum.equals("3")) {
				String item1 = request.getParameter("item1");
				String item2 = request.getParameter("item2");
				String item3 = request.getParameter("item3");
//				String box = request.getParameter("box"); // 쇼핑에서 받을예정
				gim_data= item1+"@"+item2+"@"+item3;
				System.out.println(pageNum +"번째 드감?"+"\n----"+gim_data);
				request.setAttribute("item1Arr",item1.split(","));
				request.setAttribute("item2Arr",item2.split(","));
				request.setAttribute("item3Arr",item3.split(","));
			}else if(pageNum.equals("4")) {
				String item1 = request.getParameter("item1");
				String item2 = request.getParameter("item2");
				String item3 = request.getParameter("item3");
				String req = request.getParameter("req"); 
				gim_data= item1+"@"+item2+"@"+item3+"@"+req;
				System.out.println(pageNum +"번째 드감?"+"\n----"+gim_data);
//				request.setAttribute("item1Arr",item1.split(","));
//				request.setAttribute("item2Arr",item2.split(","));
//				request.setAttribute("item3Arr",item3.split(","));
//				request.setAttribute("item3Arr",req);
			}
			System.out.println(pageNum +"번째 입력 값:"+gim_data); 
			request.setAttribute("gim_data",gim_data);
			data.addEstimate(pageNum, user_id, sel_date,gim_data);
		}
		
		request.setAttribute("mainUrl","guest/estimate"+pageNum+".jsp");
	}

}
