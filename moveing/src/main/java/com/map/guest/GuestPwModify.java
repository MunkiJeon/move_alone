package com.map.guest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.map.model.UserDAO;
import com.map.model.UserDTO;

public class GuestPwModify implements GuestService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			
			UserDTO dto = new UserDTO();
			UserDTO dto2 = new UserDAO().oneUser(id);
			UserDTO dto3= new UserDTO();
		
			dto.setId(id);
			dto3.setId(id);
			
			dto.setPw(request.getParameter("pwP"));
			dto3.setPw(request.getParameter("pwN"));
			
			if(dto2.getPw().equals(dto.getPw())) {
				int cnt = new UserDAO().pwModify(dto3);
				request.setAttribute("msg", "비밀번호가 변경되었습니다.");
				request.setAttribute("mainUrl", "guest/alert.jsp");
				request.setAttribute("url", "/guest/GuestInformation");
				request.setAttribute("moveUrl", "http://localhost:8080/moveing"+request.getAttribute("url"));
			}else if(!dto2.getPw().equals(dto.getPw())) {
				request.setAttribute("msg", "비밀번호가 틀립니다.");
				request.setAttribute("mainUrl", "guest/alert.jsp");
				request.setAttribute("url", "/guest/GuestInformation");
				request.setAttribute("moveUrl", "http://localhost:8080/moveing"+request.getAttribute("url"));
			}
			
			
			
		} catch (Exception e) {
			
		}
	}

}
