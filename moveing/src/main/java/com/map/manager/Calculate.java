package com.map.manager;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.map.model.CalculateDAO;
import com.map.model.CalculateDTO;

public class Calculate implements ManagerService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("mainUrl", "manager/calculate.jsp");
		ArrayList<CalculateDTO> list = new CalculateDAO().list();
		
		ArrayList<CalculateDTO> mlist = new ArrayList<CalculateDTO>();
		ArrayList<CalculateDTO> plist = new ArrayList<CalculateDTO>();
		
		int res = 0;
		int pl=0;
		int ma=0;
		for (CalculateDTO pr : list) {
			if(pr.getCal_type().equals("매출")) {
			res += pr.getPrice();pl+=pr.getPrice();plist.add(pr);}
			else {res -= pr.getPrice();ma+=pr.getPrice();mlist.add(pr);}
		}
		
		
		
		request.setAttribute("res", res);
		request.setAttribute("pl", pl);
		request.setAttribute("ma", ma);
		request.setAttribute("clist", list);
		System.out.println(pl+","+ma+","+request.getParameter("res")+"------------------------res");
		System.out.println(request.getParameter("res")+"------------------------res");
		

		if(request.getParameter("res")==null) {
			request.setAttribute("mainUrl", "manager/sales.jsp");
		}else if(request.getParameter("res").equals("매출")) {
			request.setAttribute("clist", plist);
			request.setAttribute("res", pl);
			request.setAttribute("param", "매출");
		}else {
			request.setAttribute("clist", mlist);
			request.setAttribute("res", ma);
			request.setAttribute("param", "매입");
		}
		
	}

}
