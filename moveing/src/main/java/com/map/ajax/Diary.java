package com.map.ajax;

import java.net.URLEncoder;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

public class Diary implements AjaxService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String pname = request.getParameter("month");
	
		try {

			JSONObject data2 = new JSONObject();
			

			Calendar now = Calendar.getInstance();
			int month = now.get(Calendar.MONTH);
			int nowNN = now.get(Calendar.DATE);
			String title = "";
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
			for(int i = 1;i<=now.getActualMaximum(Calendar.DATE);i++){
				
				if(month+1>= Integer.parseInt(title) && nowNN>=i )
				ttt+="<div class='chk unchk'>"+i+"</div>";
				else ttt+="<div class='chk'>"+i+"</div>";
			}
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
