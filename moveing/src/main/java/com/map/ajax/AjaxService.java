package com.map.ajax;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface AjaxService {
	void execute(HttpServletRequest request,HttpServletResponse response);
}
