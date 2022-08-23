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
			String id = (String)session.getAttribute("id");
			dto.setId((String)session.getAttribute("id"));
			dto.setName(request.getParameter("pname"));
			dto.setEmail((request.getParameter("email")));
			dto.setTel((request.getParameter("tel")));
			UserDTO dto2 = new UserDAO().oneUser(id);
			
			
			int cnt = new UserDAO().modify(dto);
			
			request.setAttribute("msg", "기본정보 변경완료");
			request.setAttribute("mainUrl", "guest/alert.jsp");
			request.setAttribute("url", "/guest/GuestMyPage");
			request.setAttribute("moveUrl", "http://localhost:8080/moveing"+request.getAttribute("url"));
			
			
			
			
			
		
			
			request.setAttribute("dto", dto);
			
			
			
			
		} catch (Exception e) {
			
		}
	
	}

}
