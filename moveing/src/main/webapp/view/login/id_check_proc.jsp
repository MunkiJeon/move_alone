<%@page import="com.map.model.UserDTO"%>
<%@page import="com.map.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
 	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	
	UserDAO mdao = UserDAO.getInstance();
	UserDTO dto = mdao.oneUser(id);
	
	if(dto != null){
		out.print("IMPOSSIBLE");	
	}else{
		out.print("POSSIBLE");
	}
%>