package com.map.manager;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.map.model.ChatBotDAO;
import com.map.model.ChatBotDTO;

public class AutoTalk implements ManagerService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<ChatBotDTO> list = new ChatBotDAO().list();
		
		request.setAttribute("mainData", new ChatBotDAO().list());
		request.setAttribute("mainUrl", "manager/autotalk.jsp");
	}

}
