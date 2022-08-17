package com.map.login;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.map.model.UserDAO;
import com.map.model.UserDTO;

public class LogOut implements LoginService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("mainUrl", "guest/main.jsp");
		
		HttpSession session = request.getSession();
		  session.removeAttribute("id");
		  System.out.println("testetste");
		  System.out.println(session.getAttribute("id"));
		  
	}
}
