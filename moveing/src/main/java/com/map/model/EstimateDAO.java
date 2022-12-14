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
		String gim = "",gim_Det = "";
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
				
				gim += rs.getString("Furniture") + "@";
				gim += rs.getString("Home_App") + "@";
				gim += rs.getString("Other");
				res.put("luggage", gim);
				
				gim_Det += rs.getString("Furniture_Det") + "@";
				gim_Det += rs.getString("Home_App_Det") + "@";
				gim_Det += rs.getString("Other_Det");
				
				res.put("luggage_list", gim_Det);

				/* res.put("shopping_list", "" + rs.getString("shopping_list")); */
				res.put("request", "" + rs.getString("request"));
				res.put("req_date", "" + rs.getDate("req_date"));
				res.put("price", "" + rs.getInt("price"));

			}
			System.out.println(res.get("luggage_list")+"------????????? ?????????");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return res;
	}
	
	public int checkStaps(String user_id, int res_num) {
		int step = 0;
		
		try {
			sql = "select * from estimate where id = ? and res_num =? and state = 0";
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, user_id);
			ptmt.setInt(2, res_num);
			rs = ptmt.executeQuery();
			ee:while (rs.next()) {
				if(rs.getString("SV_Type") == null || rs.getDate("sel_date") == null || rs.getString("start_Point") == null ||
				   rs.getString("start_OP") == null ||	rs.getString("end_Point") == null || rs.getString("start_OP") == null) {
					step = 1; break ee;
				}else if(rs.getString("Furniture") ==null || rs.getString("Home_App") ==null || rs.getString("Other") ==null) {
					step = 2; break ee;
				}else if(rs.getString("Furniture_Det") ==null || rs.getString("Home_App_Det") ==null || rs.getString("Other_Det") ==null || rs.getString("request") ==null) {
					step = 3; break ee;
				}
				/*
				 * else if(rs.getString("shopping_list") ==null) { step = 4; break ee; }
				 */
				else if(rs.getInt("state") != 1) {
					step = 5; break ee;
				}				
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			close();
		}
		
		
		return step;
	}
	
	public ArrayList<EstimateDTO> all(HttpServletRequest request) {
		ArrayList<EstimateDTO> res = new ArrayList<EstimateDTO>();
		String searchResnum = request.getParameter("search_resnum"); // ????????????
		String searchName   = request.getParameter("search_name");   // ??????(??????ID)
		String searchId     = request.getParameter("search_id");     // ?????????(??????ID)
		String searchDate   = request.getParameter("search_date");   // ????????????
		

		sql = "select * from estimate ";
			if(searchResnum != "" && searchResnum != null) {
				//sql	+= " and res_num = " + searchResnum; //????????????
				sql	+= " and res_num LIKE '%" + searchResnum + "%'"; //????????????
			}
			if(searchName != "" && searchName != null) {
				//sql	+= " and user_ID = '" + searchName + "'"; //????????????
				sql	+= " and id LIKE '%" + searchName + "%'"; //????????????
			}
			if(searchId != "" && searchId != null) {
				sql	+= " and SV_Type = '" + searchId +"'";
			}
			if(searchDate != "" && searchDate != null) {
				sql	+= " and DATE(sel_date) = '" + searchDate +"'";
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
				dto.setName(rs.getString("name"));
				dto.setSV_Type(rs.getString("SV_Type"));
				dto.setSel_date(rs.getDate("sel_date"));
				dto.setStart_Point(rs.getString("start_Point"));
				dto.setStart_OP(rs.getString("start_OP"));
				dto.setEnd_Point(rs.getString("end_Point"));
				dto.setEnd_OP(rs.getString("end_OP"));
				dto.setFurniture_Det(rs.getString("Furniture_Det"));
				dto.setHome_App_Det(rs.getString("Home_App_Det"));
				dto.setOther_Det(rs.getString("Other_Det"));
				dto.setRequest(rs.getString("request"));
				dto.setReq_date(rs.getDate("req_date"));
				dto.setPrice(rs.getInt("price"));
				dto.setState(rs.getInt("state"));
				
				res.add(dto);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return res;
	}
	
	public String findName (String user_id) {
		String name="";
		
		try {
			sql = "select name from user where id = '" + user_id + "'";
			ptmt = con.prepareStatement(sql);
			rs = ptmt.executeQuery();
			if (rs.next()) {
				name = rs.getString("name");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return name;
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
		System.out.println("??????:" + res_num);
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
			
			
			sql = "INSERT INTO matching(res_num ,user_ID, SV_Type ,reservat_date, start_point, start_op, end_point, end_op, luggage_list, requests, cost)"
					+ "select res_num, id, SV_Type, sel_date, start_Point, start_OP, end_Point, end_OP,'" + luggage_list
					+ "', request, price from estimate " + "where id =? and state =0 and res_num ='"
					+ res_num + "'";
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, user_id);
			rs = ptmt.executeQuery(); // ?????? ?????? ????????? ??????

			sql = "INSERT INTO calculate( po_code, po_wname, po_name , Quantity, price, cal_type, res_num)"
					+ "SELECT 'a001', '??????', SV_Type, 1, price, '??????',res_num from estimate "
					+ "where id = ? and state = 0 and res_num = "+res_num;
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, user_id);
			rs = ptmt.executeQuery();
			
			sql = "update estimate set state =1 "
				+ "where id =? and state =0 and res_num ="+ res_num ;
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, user_id);
			rs = ptmt.executeQuery();
			
			sql = "update money set state =1 "
					+ "where id =? and state =0 and res_num ="+ res_num ;
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

		System.out.println("addEstiate?????????" + pagenum + "// ID:" + user_id + "// date:" + sel_date);

		int res_num = detailToRes_num(user_id);
		String name = findName(user_id);
		try {

			if (pagenum.equals("") && res_num == 0) {
				sql = "INSERT INTO estimate (id,name,state) VALUES (?,?, 0)";

				ptmt = con.prepareStatement(sql);
				ptmt.setString(1, user_id);
				ptmt.setString(2, name);
				rs = ptmt.executeQuery();

				System.out.println(user_id + ": ????????? ??????");
			} else if (pagenum.equals("") && res_num != 0) {
				System.out.println(user_id + ": ????????? ??????");
			} else if (!pagenum.equals("") && res_num != 0) {// ?????? else?????????
				String[] arr = data.split("@");
				System.out.println("arr??????: " + arr.length + "/??????: " + res_num + "\n DAO->->" + data);
				if (pagenum.equals("2")) {// 1??????????????? 2????????? ????????????

					String[] stop = arr[4].split(",");
					String[] enop = arr[6].split(",");

					String[] res = { arr[0], stop[0], stop[1], enop[0], enop[1] };

					// System.out.println(res.length+"//"+arr[0]+"//"+stop[0]+"//"+stop[1]+"//"+enop[0]+"//"+enop[1]);
					int price = 0,SV_price=0,elevator_price=0,parking_price=0;
					sql = "select name, cost from ecategory";
					ptmt = con.prepareStatement(sql);
					rs = ptmt.executeQuery();
					while (rs.next()) {
						int b=0;
						for (String a : res) {
							if (a.equals(rs.getString("name"))) {
								price += rs.getInt("cost");
								if(b==0) {
									SV_price = rs.getInt("cost");
								}else if(b==1 ||b==3) {
									elevator_price +=rs.getInt("cost");
								}else if(b==2 ||b==4) {
									parking_price +=rs.getInt("cost");
								}
								// price = price + rs.getInt("cost");
								// System.out.println(rs.getInt("cost"));
							}
							b++;
						}
					}
					System.out.println("????????? ??????:" + price);
					price += Double.parseDouble(arr[7]) * 1000;
					System.out.println("?????????:" + price);
					
					sql = "update estimate set "
							+ "SV_Type =?, sel_date =?, Start_point =?, Start_OP =?, End_point =?, End_OP =?, price=? "
							+ "where id =? and state =0 and res_num =" + res_num ;
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
					
					sql = "INSERT INTO money (res_num, id, sel_date, start_Point, end_Point, km, km_price, "
							+ "SV_Type, SV_price, elevator, elevator_price, parking, parking_price, state, price) "
							+ "VALUES (?,?,?,?,?,?,?, ?,?,?,?,?,?,0,?)";
					ptmt = con.prepareStatement(sql);
					ptmt.setInt(1, res_num);								ptmt.setString(8, arr[0]);
					ptmt.setString(2, user_id);								ptmt.setInt(9, SV_price);
					ptmt.setString(3, arr[1]);								ptmt.setString(10, stop[0]+","+enop[0]);
					ptmt.setString(4, arr[3]);								ptmt.setInt(11, elevator_price);
					ptmt.setString(5, arr[5]);								ptmt.setString(12, stop[1]+","+enop[1]);
					ptmt.setString(6, arr[7]);								ptmt.setInt(13, parking_price);
					ptmt.setDouble(7, (Double.parseDouble(arr[7]) * 1000));	ptmt.setInt(14, price);
					rs = ptmt.executeQuery();

					System.out.println("?????? ????????? ??????" + pagenum + "// ID:" + user_id + "// date:" + sel_date);
				} else if (pagenum.equals("3")) {// 2??????????????? 3????????? ????????????
					sql = "update estimate set " + "Furniture =?, Home_App =?, Other =? "
							+ "where id =? and state =0 and res_num ="+ res_num;
					ptmt = con.prepareStatement(sql);
					ptmt.setString(1, arr[0]);
					ptmt.setString(2, arr[1]);
					ptmt.setString(3, arr[2]);

					ptmt.setString(4, user_id);
					/* ptmt.setInt(5,0); */
					rs = ptmt.executeQuery();

					System.out.println("?????? ????????? ??????" + pagenum + "// ID:" + user_id + "// date:" + sel_date);
				}else if (pagenum.equals("Res")) {// 3??????????????? Res????????? ????????????
					int price=0,
					Furniture_Price= arr[0].split(",").length*1000, 
					Home_App_Price= arr[1].split(",").length*700, 
					Other_Price= arr[2].split(",").length*500,
					luggage_price= Furniture_Price+Home_App_Price+Other_Price;
					System.err.println("Home_App_Price--------------->"+arr[1].toString());
					System.out.println("??????"+Furniture_Price+"??????"+Home_App_Price+"??????:"+Other_Price+"="+luggage_price);
					
					String luggage_list = "";
					sql = "select Furniture_Det, Home_App_Det, Other_Det, price from estimate "
							+ "where id =? and state =0 and res_num =" + res_num + "";
					ptmt = con.prepareStatement(sql);
					ptmt.setString(1, user_id);
					rs = ptmt.executeQuery();
					while (rs.next()) {
						luggage_list =  rs.getString("Furniture_Det") + "," + rs.getString("Home_App_Det") + "," + rs.getString("Other_Det");
						price	= rs.getInt("price");
					}
					System.out.println("luggage_list"+luggage_list);
					price += luggage_price;
					
					sql = "update estimate set " + "Furniture_Det =?, Home_App_Det =?, Other_Det =?, request =?,  price =? "
							+ "where id =? and state =0 and res_num ="+ res_num;
					ptmt = con.prepareStatement(sql);
					ptmt.setString(1, arr[0]);
					ptmt.setString(2, arr[1]);
					ptmt.setString(3, arr[2]);
					ptmt.setString(4, arr[3]);
					ptmt.setInt(5, price);

					ptmt.setString(6, user_id);
					rs = ptmt.executeQuery();
					
					sql = "update money set luggage_list =?, luggage_price=?, price =? "
							+ "where id =? and state =0 and "+ res_num; 
					ptmt = con.prepareStatement(sql);
					ptmt.setString(1, luggage_list);
					ptmt.setInt(2, luggage_price);
					ptmt.setInt(3, price);
					ptmt.setString(4, user_id);
					rs = ptmt.executeQuery();

					System.out.println("?????? ????????? ??????" + pagenum + "// ID:" + user_id + "// date:" + sel_date);
				}
				/*
				 * else if (pagenum.equals("Res")) {// 4??????????????? ?????? ??????????????? ???????????? int price = 0; sql =
				 * "select price from estimate " + "where id =? and state =0 and res_num ="+
				 * res_num; ptmt = con.prepareStatement(sql); ptmt.setString(1, user_id); rs =
				 * ptmt.executeQuery(); while (rs.next()) { price = rs.getInt("price"); }
				 * 
				 * System.out.println("?????? ?????? ???!!" + price); price += Integer.parseInt(arr[1]);
				 * System.out.println("?????? ?????? ???!!" + price);
				 * 
				 * sql = "update money set shopping_list =?, shopping_price=?, price =? " +
				 * "where id =? and state =0 and "+ res_num; ptmt = con.prepareStatement(sql);
				 * ptmt.setString(1, arr[0]); ptmt.setInt(2, Integer.parseInt(arr[1]));
				 * ptmt.setInt(3, price); ptmt.setString(4, user_id); rs = ptmt.executeQuery();
				 * 
				 * sql = "update estimate set shopping_list =?, price =? " +
				 * "where id =? and state =0 and "+ res_num; ptmt = con.prepareStatement(sql);
				 * ptmt.setString(1, arr[0]); ptmt.setString(2, "" + price); ptmt.setString(3,
				 * user_id); rs = ptmt.executeQuery();
				 * 
				 * System.out.println("?????? ????????? ??????" + pagenum + "// ID:" + user_id + "// date:" +
				 * sel_date); }
				 */

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
