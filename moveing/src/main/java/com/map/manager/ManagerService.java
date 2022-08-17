package com.map.manager;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ManagerService {
	void execute(HttpServletRequest request, HttpServletResponse response);
}
