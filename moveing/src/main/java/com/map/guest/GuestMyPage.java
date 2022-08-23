package com.map.guest;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.map.model.UserDTO;
import com.map.model.MatchingDAO;
import com.map.model.MatchingDTO;
import com.map.model.UserDAO;

public class GuestMyPage implements GuestService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("mainUrl", "guest/mypage.jsp");
		
		HttpSession session = request.getSession();
		session.setAttribute("stf", "ss");
		String id = (String) session.getAttribute("id");
		ArrayList<MatchingDTO> dto2 = new MatchingDAO().oneUserForGuest(id,2);
		ArrayList<MatchingDTO> dto4 = new MatchingDAO().oneUserForGuest(id,1);
		
		String stf;
		UserDTO dto = new UserDAO().oneUser(id);
		String [] arr;
		String [] arr2;
		
		
		
			for(MatchingDTO dd : dto2) {
				if(dd.getUser_ID().equals(id)) {
					stf = dd.getDriver_ID();
					session.setAttribute("stf", stf);
					UserDTO dto3 = new UserDAO().oneStaff(stf);
					
					request.setAttribute("dto3", dto3);
				}
			}
			
		for(MatchingDTO dd2:dto4) {
			
			System.out.println(dd2.getStart_op().split(","));
			arr=dd2.getStart_op().split(",");
			for(int i = 0; i<arr.length; i++) {
				if(arr[0].equals("true")) {
					request.setAttribute("ele", "O");
					
				}else if(arr[0].equals("false")) {
					request.setAttribute("ele", "X");
				}
			
				if(arr[3].equals("true")) {
					request.setAttribute("parking", "O");
				}else if(arr[3].equals("false")) {
					request.setAttribute("parking", "X");
				}
			request.setAttribute("floors", arr[1]);
			request.setAttribute("rooms", arr[2]);
			}
			
			arr2=dd2.getEnd_op().split(",");
			for(int i = 0; i<arr2.length; i++) {
				if(arr2[0].equals("true")) {
					request.setAttribute("ele2", "O");
					
				}else if(arr2[0].equals("false")) {
					request.setAttribute("ele2", "X");
				}
			
				if(arr2[3].equals("true")) {
					request.setAttribute("parking2", "O");
				}else if(arr2[3].equals("false")) {
					request.setAttribute("parking2", "X");
				}
			request.setAttribute("floors2", arr2[1]);
			request.setAttribute("rooms2", arr2[2]);
			}
			
		}
			
		request.setAttribute("dto",dto);
		request.setAttribute("dto2", dto2);
		request.setAttribute("dto4", dto4);
		
	}
}
