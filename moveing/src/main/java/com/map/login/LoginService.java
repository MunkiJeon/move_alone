package com.map.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface LoginService {
	void execute(HttpServletRequest request,HttpServletResponse response);
}
