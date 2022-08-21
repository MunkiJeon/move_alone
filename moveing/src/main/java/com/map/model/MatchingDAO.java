package com.map.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

public class MatchingDAO {
	Connection con;
	PreparedStatement ptmt;
	ResultSet rs;
	String sql;
	
	public MatchingDAO() {
		try {
			InitialContext init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/qwer");
			con = ds.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	
	public ArrayList<MatchingDTO> allUser(HttpServletRequest request) {
		ArrayList<MatchingDTO> res = new ArrayList<MatchingDTO>();
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
				MatchingDTO dto = new MatchingDTO();
				
				dto = new MatchingDTO();
				dto.setRes_num(rs.getInt("res_num"));
				dto.setUser_ID(rs.getString("user_ID"));
				dto.setDriver_ID(rs.getString("driver_ID"));
				dto.setReservat_date(rs.getDate("reservat_date"));
				dto.setStart_point(rs.getString("start_point"));
				dto.setStart_op(rs.getString("start_op"));
				dto.setEnd_point(rs.getString("end_point"));
				dto.setEnd_op(rs.getString("end_op"));
				dto.setLuggage_list(rs.getString("luggage_list"));
				dto.setShopping_list(rs.getString("shopping_list"));
				dto.setRequests(rs.getString("requests"));
				dto.setReq_date(rs.getDate("req_date"));
				dto.setCost(rs.getInt("cost"));
				
				res.add(dto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return res;
	}
	
	public ArrayList<MatchingDTO> oneUserForGuest(String id,int req_state ) {
		ArrayList<MatchingDTO> res = new ArrayList<MatchingDTO>();
		sql = "select * from matching where user_ID = ? and req_state = ?";
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, id);
			ptmt.setInt(2, req_state);
			rs = ptmt.executeQuery();
			while(rs.next()) {
				MatchingDTO dto = new MatchingDTO();
				
				dto = new MatchingDTO();
				dto.setRes_num(rs.getInt("res_num"));
				dto.setUser_ID(rs.getString("user_ID"));
				dto.setDriver_ID(rs.getString("driver_ID"));
				dto.setReservat_date(rs.getDate("reservat_date"));
				dto.setStart_point(rs.getString("start_point"));
				dto.setStart_op(rs.getString("start_op"));
				dto.setEnd_point(rs.getString("end_point"));
				dto.setEnd_op(rs.getString("end_op"));
				dto.setLuggage_list(rs.getString("luggage_list"));
				dto.setShopping_list(rs.getString("shopping_list"));
				dto.setRequests(rs.getString("requests"));
				dto.setReq_state(rs.getInt("req_state"));
				dto.setReq_date(rs.getDate("req_date"));
				dto.setCost(rs.getInt("cost"));
				res.add(dto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return res;
	}
	
	public ArrayList<MatchingDTO> workList(String id,int req_state) {
		ArrayList<MatchingDTO> res = new ArrayList<MatchingDTO>();
		sql = "select * from matching where driver_ID = ? AND req_state = ?";
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, id);
			ptmt.setInt(2, req_state);
			
			rs = ptmt.executeQuery();
			while(rs.next()) {
				MatchingDTO dto = new MatchingDTO();
				
				dto = new MatchingDTO();
				dto.setRes_num(rs.getInt("res_num"));
				dto.setUser_ID(rs.getString("user_ID"));
				dto.setDriver_ID(rs.getString("driver_ID"));
				dto.setReservat_date(rs.getDate("reservat_date"));
				dto.setStart_point(rs.getString("start_point"));
				dto.setStart_op(rs.getString("start_op"));
				dto.setEnd_point(rs.getString("end_point"));
				dto.setEnd_op(rs.getString("end_op"));
				dto.setLuggage_list(rs.getString("luggage_list"));
				dto.setShopping_list(rs.getString("shopping_list"));
				dto.setRequests(rs.getString("requests"));
				dto.setReq_state(rs.getInt("req_state"));
				dto.setReq_date(rs.getDate("req_date"));
				dto.setCost(rs.getInt("cost"));
				res.add(dto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return res;
	}
	
	public ArrayList<MatchingDTO> afterWork(String id,int req_state) {
		ArrayList<MatchingDTO> res = new ArrayList<MatchingDTO>();
		sql = "select * from matching where driver_ID = ? and req_state = ?";
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, id);
			ptmt.setInt(2, req_state);
			rs = ptmt.executeQuery();
			while(rs.next()) {
				MatchingDTO dto = new MatchingDTO();
				
				dto = new MatchingDTO();
				dto.setRes_num(rs.getInt("res_num"));
				dto.setUser_ID(rs.getString("user_ID"));
				dto.setDriver_ID(rs.getString("driver_ID"));
				dto.setReservat_date(rs.getDate("reservat_date"));
				dto.setStart_point(rs.getString("start_point"));
				dto.setStart_op(rs.getString("start_op"));
				dto.setEnd_point(rs.getString("end_point"));
				dto.setEnd_op(rs.getString("end_op"));
				dto.setLuggage_list(rs.getString("luggage_list"));
				dto.setShopping_list(rs.getString("shopping_list"));
				dto.setRequests(rs.getString("requests"));
				dto.setReq_state(rs.getInt("req_state"));
				dto.setReq_date(rs.getDate("req_date"));
				dto.setCost(rs.getInt("cost"));
				res.add(dto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return res;
	}
	
	//예약번호 검색
	
	//이름으로 검색
	
	//아이디로 검색
	
	//이사날짜로 검색
	

	public ArrayList<MatchingDTO> applyList(String id,int req_state) {
		ArrayList<MatchingDTO> res = new ArrayList<MatchingDTO>();
		sql = "select * from matching where driver_ID = ? and req_state = ?";
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, id);
			ptmt.setInt(2, req_state);
			rs = ptmt.executeQuery();
			while(rs.next()) {
				MatchingDTO dto = new MatchingDTO();
				
				dto = new MatchingDTO();
				dto.setRes_num(rs.getInt("res_num"));
				dto.setUser_ID(rs.getString("user_ID"));
				dto.setDriver_ID(rs.getString("driver_ID"));
				dto.setReservat_date(rs.getDate("reservat_date"));
				dto.setStart_point(rs.getString("start_point"));
				dto.setStart_op(rs.getString("start_op"));
				dto.setEnd_point(rs.getString("end_point"));
				dto.setEnd_op(rs.getString("end_op"));
				dto.setLuggage_list(rs.getString("luggage_list"));
				dto.setShopping_list(rs.getString("shopping_list"));
				dto.setRequests(rs.getString("requests"));
				dto.setReq_state(rs.getInt("req_state"));
				dto.setReq_date(rs.getDate("req_date"));
				dto.setCost(rs.getInt("cost"));
				res.add(dto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return res;
	}
	
	public int update(MatchingDTO dto){
		sql = "update matching set req_state = ?, driver_ID = ? where res_num = ? ";
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, dto.getReq_state());
			ptmt.setString(2, dto.getDriver_ID());
			ptmt.setInt(3, dto.getRes_num());
			
			
			
			return ptmt.executeUpdate();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}finally {
			close();
		}
		
		return 0;
	}
	public int managerUpdate(MatchingDTO dto){
		sql = "update matching set start_point = ? , end_point = ? where res_num = ? ";
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, dto.getStart_point());
			ptmt.setString(2, dto.getEnd_point());
			ptmt.setInt(3, dto.getRes_num());
			
			System.out.println(dto.getStart_point());
			System.out.println(dto.getEnd_point());
			System.out.println(dto.getRes_num());
			
			return ptmt.executeUpdate();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}finally {
			close();
		}
		
		return 0;
	}
	
	public MatchingDTO res_num(int num) {
		MatchingDTO dto = null;
		sql = "select * from matching where res_num = ?";
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, num);
			rs = ptmt.executeQuery();
			if(rs.next()) {
				dto = new MatchingDTO();
				
				dto = new MatchingDTO();
				dto.setRes_num(rs.getInt("res_num"));
				dto.setUser_ID(rs.getString("user_ID"));
				dto.setDriver_ID(rs.getString("driver_ID"));
				dto.setReservat_date(rs.getDate("reservat_date"));
				dto.setStart_point(rs.getString("start_point"));
				dto.setStart_op(rs.getString("start_op"));
				dto.setEnd_point(rs.getString("end_point"));
				dto.setEnd_op(rs.getString("end_op"));
				dto.setLuggage_list(rs.getString("luggage_list"));
				dto.setShopping_list(rs.getString("shopping_list"));
				dto.setRequests(rs.getString("requests"));
				dto.setReq_state(rs.getInt("req_state"));
				dto.setReq_date(rs.getDate("req_date"));
				dto.setCost(rs.getInt("cost"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return dto;
	}
	
	public void close() {
		if(rs!=null)try {rs.close();} catch (SQLException e) {}
		if(ptmt!=null)try {ptmt.close();} catch (SQLException e) {}
		if(con!=null)try {con.close();} catch (SQLException e) {}
	}
}
