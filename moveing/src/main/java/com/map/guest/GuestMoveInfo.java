package com.map.guest;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.map.model.MatchingDAO;
import com.map.model.MatchingDTO;

public class GuestMoveInfo implements GuestService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		ArrayList<MatchingDTO> dto4= new MatchingDAO().oneUserForGuest(id,1);
		
		String [] arr;
		String [] arr2;
		
		
		  for(MatchingDTO dd2:dto4) {
		  
		  
		  arr=dd2.getStart_op().split(","); for(int i = 0; i<arr.length; i++) {
		  if(arr[0].equals("true")) { request.setAttribute("ele", "O");
		  
		 }else if(arr[0].equals("false")) { request.setAttribute("ele", "X"); }
		  
		  if(arr[3].equals("true")) { request.setAttribute("parking", "O"); }else
		  if(arr[3].equals("false")) { request.setAttribute("parking", "X"); }
		  request.setAttribute("floors", arr[1]); request.setAttribute("rooms",
		  arr[2]); }
		  
		  arr2=dd2.getEnd_op().split(","); for(int i = 0; i<arr2.length; i++) {
		  if(arr2[0].equals("true")) { request.setAttribute("ele2", "O");
		  
		  }else if(arr2[0].equals("false")) { request.setAttribute("ele2", "X"); }
		  
		  if(arr2[3].equals("true")) { request.setAttribute("parking2", "O"); }else
		  if(arr2[3].equals("false")) { request.setAttribute("parking2", "X"); }
		  request.setAttribute("floors2", arr2[1]); request.setAttribute("rooms2",
		  arr2[2]); }
		  
		  }
		 
		
		request.setAttribute("dto4", dto4);
		request.setAttribute("mainUrl", "guest/moveInformation.jsp");
	}

}
