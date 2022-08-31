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
		ArrayList<MatchingDTO> dto4= new MatchingDAO().oneUserForGuest(id);
		
		String [] arr;
		String [] arr2;
		
		
		  for(MatchingDTO dd2:dto4) {
		  
			  arr=dd2.getStart_op().split(","); 
			  for(int i = 0; i<arr.length; i++) {
					/*
					 * if(arr[0].equals("사용가능")) { request.setAttribute("ele", "O"); }else
					 * if(arr[0].equals("사용불가")) { request.setAttribute("ele", "X"); }
					 * if(arr[1].equals("주차가능")) { request.setAttribute("parking", "O"); }else
					 * if(arr[1].equals("주차불가")) { request.setAttribute("parking", "X"); }
					 */
				  request.setAttribute("ele", arr[0]);
				  request.setAttribute("parking", arr[1]);
				  request.setAttribute("floors", arr[2]); 
				  request.setAttribute("rooms",	arr[3]); 
			  }
			  
			  arr2=dd2.getEnd_op().split(",");
			  for(int i = 0; i<arr2.length; i++) {
				  if(arr2[0].equals("사용가능")) { 
					  request.setAttribute("ele2", "O");
				  }else if(arr2[0].equals("사용불가")) { 
					  request.setAttribute("ele2", "X"); 
				  }
				  if(arr2[1].equals("주차가능")) {
					  request.setAttribute("parking2", "O"); 
				  }else if(arr2[1].equals("주차 불가")) { 
					  request.setAttribute("parking2", "X"); 
				  }
				  request.setAttribute("ele2", arr[0]);
				  request.setAttribute("parking2", arr[1]);
				  request.setAttribute("floors2", arr[2]); 
				  request.setAttribute("rooms2", arr[3]); 
			  }
		  
		  }
		request.setAttribute("dto4", dto4);
		request.setAttribute("mainUrl", "guest/moveInformation.jsp");
	}

}
