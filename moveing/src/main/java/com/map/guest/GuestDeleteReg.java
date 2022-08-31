package com.map.guest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.map.model.UserDAO;
import com.map.model.UserDTO;

public class GuestDeleteReg implements GuestService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			UserDTO dto = new UserDTO();
			UserDTO dto2 = new UserDTO();
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			dto.setId(((String)session.getAttribute("id")).trim());
			dto.setPw(request.getParameter("pw2"));
			dto2=new UserDAO().oneUser(id);
			
			
			
			if(!dto2.getPw().equals(dto.getPw())) {
				request.setAttribute("msg", "비밀번호가 틀립니다.");
				request.setAttribute("mainUrl", "guest/alert.jsp");
				request.setAttribute("url", "/guest/GuestInformation");
				request.setAttribute("moveUrl", "http://localhost:8080/moveing"+request.getAttribute("url"));
				
			}else if(dto2.getPw().equals(dto.getPw())){
				request.setAttribute("msg", "탈퇴되었습니다.");
				request.setAttribute("mainUrl", "guest/alert.jsp");
				request.setAttribute("url", "/login/LogOut");
				request.setAttribute("moveUrl", "http://localhost:8080/moveing"+request.getAttribute("url"));
				int cnt = new UserDAO().delete(dto);
			}
			
			//System.out.println(cnt);
			//System.out.println((String)session.getAttribute("id"));
			
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
