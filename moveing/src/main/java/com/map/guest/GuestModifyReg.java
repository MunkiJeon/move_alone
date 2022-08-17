package com.map.guest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.map.model.UserDAO;
import com.map.model.UserDTO;

public class GuestModifyReg implements GuestService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			UserDTO dto = new UserDTO();
			HttpSession session = request.getSession();
			dto.setId((String)session.getAttribute("id"));
			dto.setPw((request.getParameter("pw")));
			dto.setEmail((request.getParameter("email")));
			dto.setTel((request.getParameter("tel")));
			
			int cnt = new UserDAO().modify(dto);
			
			request.setAttribute("oh", "no");
			System.out.println(dto.getEmail());
			if(!dto.getEmail().equals("")||!dto.getTel().equals("")||!dto.getPw().equals("")) {
				
				request.setAttribute("msg", "성공");
				request.setAttribute("mainUrl", "guest/mypage.jsp");
				request.setAttribute("oh", "yes");
			}else {
				request.setAttribute("msg", "실패");
				request.setAttribute("mainUrl", "guest/mypage.jsp");
				request.setAttribute("oh", "yes");
			}
			
			request.setAttribute("dto", dto);
			
			
			
			
		} catch (Exception e) {
			
		}
	
	}

}
