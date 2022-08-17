package com.map.login;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.map.model.CalculateDAO;
import com.map.model.CalculateDTO;
import com.map.model.UserDAO;
import com.map.model.UserDTO;

public class LoginReg implements LoginService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("mainUrl", "login/login.jsp");
		 ArrayList<UserDTO> list = new UserDAO().allUser();
		 String id = request.getParameter("id");
		 String pw = request.getParameter("pw");
		HttpSession session = request.getSession();
		int res = 0;
		int pl=0;
		int ma=0;
		 for (UserDTO dto : list) {
			if(dto.getId().equals(id)&&dto.getPw().equals(pw)) {
				
				session.setAttribute("id", id);
				switch(dto.getLevel()) {
				case 0:					
					ArrayList<CalculateDTO> clist = new CalculateDAO().list();
					for (CalculateDTO pr : clist) {
						if(pr.getCal_type().equals("매출")) {pl+=pr.getPrice();}
						else {ma += pr.getPrice();}
					}
					request.setAttribute("clist", clist);
					request.setAttribute("pl", pl);
					request.setAttribute("ma", ma);
					request.setAttribute("config", "manager");
					request.setAttribute("mainUrl", "manager/sales.jsp");
					break;
				case 1:
					request.setAttribute("config", "staff");
					request.setAttribute("mainUrl", "staff/main.jsp");
					break;
				case 2:
					request.setAttribute("config", "guest");
					request.setAttribute("mainUrl", "guest/main.jsp");
					break;
				}
				
			}
		}
	}
}
