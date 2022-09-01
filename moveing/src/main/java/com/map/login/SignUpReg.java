package com.map.login;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.map.model.UserDAO;
import com.map.model.UserDTO;

public class SignUpReg implements LoginService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("mainUrl", "login/signup.jsp");
		
        String pid = request.getParameter("pid");
        String pw = request.getParameter("pw");
        String pname = request.getParameter("pname");
        String number = request.getParameter("number");
        String mail =request.getParameter("mail");
        String res =request.getParameter("res");
        
        
        
        System.out.println("SignUpReg 실행: "
        +"id->"+pid
        +"pw->"+pw
        +"pname->"+pname
        +"number->"+number
        +"mail->"+mail
        +"res->"+res);
        
        if(pid!=null&&pw!=null&&pname!=null&&number!=null&&mail!=null&&
        !pid.equals("")&&!pw.equals("")&&!pname.equals("")&&!number.equals("")&&!mail.equals("")&&res.equals("Suitable")) {

        	UserDTO dto = new UserDTO();
        	dto.setId(pid);
        	dto.setPw(pw);
        	dto.setName(pname);
        	dto.setTel(number);
        	dto.setEmail(mail);
        	
        	request.setAttribute("mainUrl", "guest/main.jsp");
    		new UserDAO().insert(dto);
        }
	}

}
