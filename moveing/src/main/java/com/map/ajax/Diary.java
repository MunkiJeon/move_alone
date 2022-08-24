package com.map.ajax;

import java.net.URLEncoder;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.map.model.MatchingDAO;
import com.map.model.UserDAO;

public class Diary implements AjaxService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String pname = request.getParameter("month");
	
		try {

			JSONObject data2 = new JSONObject();

			Calendar now = Calendar.getInstance();
			int month = now.get(Calendar.MONTH);
			int nowNN = now.get(Calendar.DATE);
			int ye = now.get(Calendar.YEAR);
			String title = "";
			int staff = new UserDAO().staffLength();
			if(pname==null) {
				title += (now.get(Calendar.MONTH)+1)+"";
			}else {
				now.set(Calendar.YEAR, Integer.parseInt(pname)-1, 1);
				title += Integer.parseInt(pname);
			}
			now.set(Calendar.DATE,1);
			
			String ttt = "";

			ttt+="<div id='dates'>";
			
			for(int i = 1;i<now.get(Calendar.DAY_OF_WEEK);i++){
				ttt += "<div></div>";
			}

			MatchingDAO dao = new MatchingDAO();
			String monthReal = (Integer.parseInt(title))+"";
			String monthNext = (Integer.parseInt(title))+"";
			if(Integer.parseInt(title)>10) {
				monthReal = 0+monthReal;
				monthNext = 0+monthNext;
			}
			for(int i = 1;i<=now.getActualMaximum(Calendar.DATE);i++){
				String day = i+"";
				String next = i+1+"";
				if(i<10) {
					day = "0"+i+"";
				}
				if(i<9) {					
					next = "0"+(i+1)+"";
				}
				if(i==now.getActualMaximum(Calendar.DATE)) {
					next = "1";
					monthNext = Integer.parseInt(title)+1+"";
					if(month+2>10) {
						monthNext = "0"+(Integer.parseInt(title)+1)+"";
					}
				}
				
				if( month+1>= Integer.parseInt(title) && 
					nowNN>=i ) {
					ttt+="<div class='chk unchk'>"+i+"</div>";}
				else {
					if( dao.diaryNon(ye+"-"+monthReal+"-"+day,ye+"-"+monthNext+"-"+next) >= staff) {
						ttt+="<div class='chk unchk'>"+i+"</div>";
					}else {
						ttt+="<div class='chk'>"+i+"</div>";
						
					}
				}
				
			}
			dao.close();
			ttt+="</div></div></div>";

			data2.put("title", title);
			data2.put("diary", ttt);
			
			String res=data2.toJSONString();
			
			response.getWriter().append(res);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
