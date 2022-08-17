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
			HttpSession session = request.getSession();
			dto.setId(((String)session.getAttribute("id")).trim());
			dto.setPw(request.getParameter("pw"));
			int cnt = new UserDAO().delete(dto);
			System.out.println(cnt);
			System.out.println((String)session.getAttribute("id"));
			request.setAttribute("mainUrl", "guest/outS.jsp");
			request.setAttribute("dto", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
