package com.map.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

public class EstimateDAO {
	Connection con;
	PreparedStatement ptmt;
	ResultSet rs;
	String sql;
	
	public EstimateDAO() {
		try {
			InitialContext init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/qwer");
			con = ds.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public HashMap<String, String> one(String user_id) {
		HashMap<String, String> res = new HashMap<String, String>();
		String gim = "";
		sql = "select * from estimate where id = ?";
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, user_id);
			rs = ptmt.executeQuery();

			while (rs.next()) {
				res.put("res_num", "" + rs.getInt("res_num"));
				res.put("id", "" + rs.getString("id"));
				res.put("SV_Type", rs.getString("SV_Type"));
				res.put("sel_date", "" + rs.getDate("sel_date"));
				res.put("start_Point", "" + rs.getString("start_Point"));
				res.put("start_OP", "" + rs.getString("start_OP"));
				res.put("end_Point", "" + rs.getString("end_Point"));
				res.put("end_OP", "" + rs.getString("end_OP"));

				gim += rs.getString("Furniture_Det") + "@";
				gim += rs.getString("Home_App_Det") + "@";
				gim += rs.getString("Other_Det");
				res.put("luggage_list", gim);

				res.put("shopping_list", "" + rs.getString("shopping_list"));
				res.put("request", "" + rs.getString("request"));
				res.put("req_date", "" + rs.getDate("req_date"));
				res.put("price", "" + rs.getInt("price"));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return res;
	}
	
	public ArrayList<EstimateDTO> all(HttpServletRequest request) {
		ArrayList<EstimateDTO> res = new ArrayList<EstimateDTO>();
		String searchResnum = request.getParameter("search_resnum"); // 예약번호
		String searchName   = request.getParameter("search_name");   // 이름(고객ID)
		String searchId     = request.getParameter("search_id");     // 아이디(기사ID)
		String searchDate   = request.getParameter("search_date");   // 이사날짜
		
		//System.out.println("searchResnum >>>" + searchResnum);
		//System.out.println("searchName >>>" + searchName);
		//System.out.println("searchId >>>" + searchId);
		//System.out.println("searchDate >>>" + searchDate);
		
		sql = "select * from matching where 1=1";
			if(searchResnum != "" && searchResnum != null) {
				//sql	+= " and res_num = " + searchResnum; //전체검색
				sql	+= " and res_num LIKE '%" + searchResnum + "%'"; //특정검색
			}
			if(searchName != "" && searchName != null) {
				//sql	+= " and user_ID = '" + searchName + "'"; //전체검색
				sql	+= " and user_ID LIKE '%" + searchName + "%'"; //특정검색
			}
			if(searchId != "" && searchId != null) {
				sql	+= " and driver_ID = '" + searchId +"'";
			}
			if(searchDate != "" && searchDate != null) {
				sql	+= " and DATE(reservat_date) = '" + searchDate +"'";
			}
		System.out.println("sql >>>" + sql);
		try {
			ptmt = con.prepareStatement(sql);
			
			rs = ptmt.executeQuery();
			while(rs.next()) {
				EstimateDTO dto = new EstimateDTO();
				
				dto = new EstimateDTO();
				dto.setRes_num(rs.getInt("res_num"));
				dto.setId(rs.getString("id"));
				dto.setSV_Type(rs.getString("SV_Type"));
				dto.setSel_date(rs.getDate("sel_date"));
				dto.setStart_Point(rs.getString("start_Point"));
				dto.setStart_OP(rs.getString("start_OP"));
				dto.setEnd_Point(rs.getString("end_Point"));
				dto.setEnd_OP(rs.getString("end_OP"));
				dto.setFurniture(rs.getString("Furniture"));
				dto.setHome_App(rs.getString("Home_App"));
				dto.setOther(rs.getString("Other"));
				//
				dto.setFurniture_Det(rs.getString("Furniture_Det"));
				dto.setHome_App_Det(rs.getString("Home_App_Det"));
				dto.setOther_Det(rs.getString("Other_Det"));
				//
				dto.setShopping_list(rs.getString("shopping_list"));
				dto.setRequest(rs.getString("request"));
				dto.setReq_date(rs.getDate("req_date"));
				
				res.add(dto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return res;
	}
	
	public int detailToRes_num(String user_id) {
		int res_num = 0;
		try {
			sql = "select res_num from estimate where id = '" + user_id + "' and state=0";
			ptmt = con.prepareStatement(sql);
			rs = ptmt.executeQuery();
			if (rs.next()) {
				res_num = rs.getInt("res_num");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("찾음:" + res_num);
		return res_num;
	}

	public void send(String user_id) {
		int res_num = detailToRes_num(user_id);

		String luggage_list = "";
		try {
			sql = "select Furniture_Det, Home_App_Det, Other_Det from estimate "
					+ "where id =? and state =0 and res_num =" + res_num + "";
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, user_id);
			rs = ptmt.executeQuery();
			while (rs.next()) {
				luggage_list = 
						  rs.getString("Furniture_Det") + "," 
						+ rs.getString("Home_App_Det") + ","
						+ rs.getString("Other_Det");
			}
			
			sql = "INSERT INTO matching(res_num ,user_ID, SV_Type ,reservat_date, start_point, start_op, end_point, end_op, luggage_list, shopping_list, requests, cost)"
					+ "select res_num, id, SV_Type, sel_date, start_Point, start_OP, end_Point, end_OP,'" + luggage_list
					+ "', shopping_list, request, price from estimate " + "where id =? and state =0 and res_num ='"
					+ res_num + "'";
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, user_id);
			rs = ptmt.executeQuery(); // 결제 하고 넣어야 될듯

			sql = "INSERT INTO calculate( po_code, po_wname, po_name , Quantity, price, cal_type, res_num)"
					+ "SELECT 'a001', '이사', SV_Type, 1, price, '매출',res_num from estimate "
					+ "where id = ? and state = 0 and res_num = "+res_num;
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, user_id);
			rs = ptmt.executeQuery();
			
			sql = "update estimate set state =1 "
				+ "where id =? and state =0 and res_num =" + res_num + "";
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, user_id);
			rs = ptmt.executeQuery();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}

	}
	
	public void addEstimate(String pagenum, String user_id, String sel_date, String data) {

		System.out.println("addEstiate들어옴" + pagenum + "// ID:" + user_id + "// date:" + sel_date);

		try {
			int res_num = detailToRes_num(user_id);

			if (pagenum.equals("") && res_num == 0) {
				sql = "INSERT INTO estimate (id,state) VALUES (?, 0)";

				ptmt = con.prepareStatement(sql);
				ptmt.setString(1, user_id);
				rs = ptmt.executeQuery();
				System.out.println(user_id + ": 데이터 생성");
			} else if (pagenum.equals("") && res_num != 0) {
				System.out.println(user_id + ": 데이터 유지");
			} else if (!pagenum.equals("") && res_num != 0) {// 그냥 else해도됨
				String[] arr = data.split("@");
				System.out.println("arr길이: " + arr.length + "/번호: " + res_num + "\n---" + data);
				if (pagenum.equals("2")) {// 1페이지에서 2페이지 넘어갈때

					String[] stop = arr[4].split(",");
					String[] enop = arr[6].split(",");

					String[] res = { arr[0], stop[0], stop[1], enop[0], enop[1] };

					// System.out.println(res.length+"//"+arr[0]+"//"+stop[0]+"//"+stop[1]+"//"+enop[0]+"//"+enop[1]);
					int price = 0;
					sql = "select name, cost from ecategory";
					ptmt = con.prepareStatement(sql);
					rs = ptmt.executeQuery();
					while (rs.next()) {
						for (String a : res) {
							if (a.equals(rs.getString("name"))) {
								price += rs.getInt("cost");
								// price = price + rs.getInt("cost");
								// System.out.println(rs.getInt("cost"));
							}
						}
					}
					System.out.println("거리값 뺴고:" + price);
					price += Double.parseDouble(arr[7]) * 1000;
					System.out.println("거리값:" + price);
					sql = "update estimate set "
							+ "SV_Type =?, sel_date =?, Start_point =?, Start_OP =?, End_point =?, End_OP =?, price=? "
							+ "where id =? and state =0 and res_num ='" + res_num + "'";
					ptmt = con.prepareStatement(sql);
					ptmt.setString(1, arr[0]);
					ptmt.setString(2, arr[1]);
					ptmt.setString(3, arr[3]);
					ptmt.setString(4, arr[4]);
					ptmt.setString(5, arr[5]);
					ptmt.setString(6, arr[6]);
					ptmt.setInt(7, price);

					ptmt.setString(8, user_id);

					rs = ptmt.executeQuery();

					System.out.println("개인 데이터 넣음" + pagenum + "// ID:" + user_id + "// date:" + sel_date);
				} else if (pagenum.equals("3")) {// 2페이지에서 3페이지 넘어갈때
					sql = "update estimate set " + "Furniture =?, Home_App =?, Other =? "
							+ "where id =? and state =0 and res_num ='" + res_num + "'";
					ptmt = con.prepareStatement(sql);
					ptmt.setString(1, arr[0]);
					ptmt.setString(2, arr[1]);
					ptmt.setString(3, arr[2]);

					ptmt.setString(4, user_id);
					/* ptmt.setInt(5,0); */
					rs = ptmt.executeQuery();

					System.out.println("개인 데이터 넣음" + pagenum + "// ID:" + user_id + "// date:" + sel_date);
				} else if (pagenum.equals("4")) {// 3페이지에서 4페이지 넘어갈때
					sql = "update estimate set " + "Furniture_Det =?, Home_App_Det =?, Other_Det =?, request =? "
							+ "where id =? and state =0 and res_num ='" + res_num + "'";
					ptmt = con.prepareStatement(sql);
					ptmt.setString(1, arr[0]);
					ptmt.setString(2, arr[1]);
					ptmt.setString(3, arr[2]);
					ptmt.setString(4, arr[3]);

					ptmt.setString(5, user_id);
					rs = ptmt.executeQuery();

					System.out.println("개인 데이터 넣음" + pagenum + "// ID:" + user_id + "// date:" + sel_date);
				} else if (pagenum.equals("Res")) {// 4페이지에서 결과 확인페이지 넘어갈때
					int price = 0;
					sql = "select price from estimate "
							+ "where id =? and state =0 and res_num ='" + res_num + "'";
					ptmt = con.prepareStatement(sql);
					ptmt.setString(1, user_id);
					rs = ptmt.executeQuery();
					while (rs.next()) {
						price = rs.getInt("price");
					}

					System.out.println("견적 중간 값!!" + price);
					price += Integer.parseInt(arr[1]);
					System.out.println("견적 최종 값!!" + price);
					sql = "update estimate set " + "shopping_list =?, price =? "
							+ "where id =? and state =0 and res_num ='" + res_num + "'";
					ptmt = con.prepareStatement(sql);
					ptmt.setString(1, arr[0]);
					ptmt.setString(2, "" + price);
					ptmt.setString(3, user_id);
					rs = ptmt.executeQuery();

					System.out.println("개인 데이터 넣음" + pagenum + "// ID:" + user_id + "// date:" + sel_date);
				}

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close();
		}
	}

	public void close() {
		if(rs!=null)try {rs.close();} catch (SQLException e) {}
		if(ptmt!=null)try {ptmt.close();} catch (SQLException e) {}
		if(con!=null)try {con.close();} catch (SQLException e) {}
	}
}
