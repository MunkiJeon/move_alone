package com.map.manager;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.map.model.CalculateDAO;
import com.map.model.CalculateDTO;
import com.map.model.MoneyDTO;

public class Calculate implements ManagerService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("mainUrl", "manager/calculate.jsp");
		ArrayList<CalculateDTO> list = new CalculateDAO().list();
		ArrayList<MoneyDTO> saleslist = new CalculateDAO().Saleslist();
		
		ArrayList<CalculateDTO> mlist = new ArrayList<CalculateDTO>();
		ArrayList<CalculateDTO> plist = new ArrayList<CalculateDTO>();
		
		int res = 0;
		int pl=0;
		int ma=0;
		
		for (CalculateDTO pr : list) {
			
			if(pr.getPo_name().equals("일반이사")) {
				ma+=pr.getPrice();	
			}else if(pr.getPo_name().equals("포장이사")) {
				pl+=pr.getPrice();
			}
		}
		res += pl+ma;
		request.setAttribute("res", res);
		request.setAttribute("pl", pl);
		request.setAttribute("ma", ma);
		System.out.println(pl+","+ma+","+request.getParameter("res")+"------------------------"+res);


		if(request.getParameter("res")==null) {
			request.setAttribute("mainUrl", "manager/sales.jsp");
			request.setAttribute("list", list);			
		}else if(request.getParameter("res").equals("매출")) {
			System.out.println(pl+","+ma+","+request.getParameter("res")+"----디디?------>"+saleslist.size());
			request.setAttribute("salelist", saleslist);
			request.setAttribute("param", "매출");
		}
		/*
		 * else { request.setAttribute("clist", mlist); request.setAttribute("res", ma);
		 * request.setAttribute("param", "매입"); }
		 */
	}

}
