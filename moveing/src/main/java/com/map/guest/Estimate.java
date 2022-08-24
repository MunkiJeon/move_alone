package com.map.guest;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.map.model.CategoryBean;
import com.map.model.CategoryDao;
import com.map.model.EstimateDAO;
import com.map.model.EstimateDTO;
import com.map.model.ProductBean;
import com.map.model.ProductDao;

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
		
		String[][] itemName = {
				{"침대/토퍼/매트","옷장","행거","수납장/책장/선반","테이블/식탁","소파","의자","거울/파티션"},
				{"TV/모니터","PC/데탑","세탁기/건조기","냉장고","공기청정기/제습기","정수기/식기세척기","주방기기","청소기","선풍기/서큘레이터/에어컨"},
				{"운동 용품","침구류","악기","아동용 가구/완구","장식/화분","조명기기","빨래건조대/바구니","애완용품"}};
		
		if(pageNum==null) {pageNum="";
		System.out.println(pageNum +"번째 입력 값:"+user_id); 
		data.addEstimate(pageNum, user_id, sel_date,gim_data);}
		
		else if(pageNum!=null) {
			if(pageNum.equals("2")) {
				
				String option = request.getParameter("option");
				sel_date = request.getParameter("sel_date");
				session.setAttribute("sel_date", sel_date);
				String time = request.getParameter("time");
				
				String start_point = request.getParameter("st_addr1")
						+request.getParameter("st_addr2");
				
				String[] start_op = {
						request.getParameter("start_el"),//엘베 유무
						request.getParameter("start_pk"),//주차 유무
						request.getParameter("st_addr3"),//층수
						request.getParameter("st_addr4"),//개수
						request.getParameter("st_addr4"),//방개수
				};
				
				String end_point = request.getParameter("en_addr1")
						+request.getParameter("en_addr2");
				
				String[] end_op = {
						request.getParameter("end_el"),//엘베 유무
						request.getParameter("end_pk"),//주차 유무
						request.getParameter("en_addr3"),//층수
						request.getParameter("en_addr4"),//방개수
				};
				String mo_km = request.getParameter("mo_km");
				request.setAttribute("itemName",itemName);
				gim_data= option+"@"+sel_date+"@"+time+"@"
				+start_point+"@"+start_op[0]+","+start_op[1]+","+start_op[2]+","+start_op[3]+"@"
				+end_point+"@"+end_op[0]+","+end_op[1]+","+end_op[2]+","+end_op[3]+"@"
				+mo_km;
				
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
				String req = request.getParameter("req"); // 쇼핑에서 받을예정
				gim_data= item1+"@"+item2+"@"+item3+"@"+req;
				System.out.println(pageNum +"번째 드감?"+"\n----"+gim_data);
				
				ProductDao pdao = ProductDao.getInstance();
				ArrayList<ProductBean> list = pdao.getAllProduct();
				CategoryDao cadao = CategoryDao.getInstance();
				ArrayList<CategoryBean> calist = cadao.getAllCategory();
				CategoryDao lcadao = CategoryDao.getInstance();
				ArrayList<CategoryBean> lcalist = lcadao.getOnlyLargeCategory();
				
				
				request.setAttribute("list", list);
				request.setAttribute("calist", calist);
				request.setAttribute("lcalist", lcalist);
				
			}else if(pageNum.equals("Res")) {
				String item = request.getParameter("item");
				String price = request.getParameter("price");

				gim_data= item+"@"+price;
				data.addEstimate(pageNum, user_id, sel_date,gim_data);
				
				HashMap<String, String> estimate_d = new EstimateDAO().one(user_id);
				System.out.println("estimate_d list >>>" + estimate_d.size());
				request.setAttribute("estimate_d", estimate_d);
				System.out.println(pageNum +"번째 드감?"+"\n----"+gim_data);
				
			}
			
			System.out.println(pageNum +"번째 입력 값:"+gim_data); 
			request.setAttribute("gim_data",gim_data);
			if(!pageNum.equals("Res")) {
				data.addEstimate(pageNum, user_id, sel_date,gim_data);
			}
		}
		
		request.setAttribute("mainUrl","guest/estimate"+pageNum+".jsp");
	}

}
