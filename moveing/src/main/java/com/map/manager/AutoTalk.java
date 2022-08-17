package com.map.manager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.map.model.ChatBotDAO;

public class AutoTalk implements ManagerService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("mainData", new ChatBotDAO().list());
		request.setAttribute("mainUrl", "manager/autotalk.jsp");
	}

}
