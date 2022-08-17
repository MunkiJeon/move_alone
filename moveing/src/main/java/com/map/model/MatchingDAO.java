package com.map.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
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

	
//	public matchingDTO oneUser(String id) {
//		matchingDTO dto = null;
//		sql = "select * from matching where id = ?";
//		try {
//			ptmt = con.prepareStatement(sql);
//			ptmt.setString(1, id);
//			rs = ptmt.executeQuery();
//			while(rs.next()) {
//				dto = new matchingDTO();
//				dto.setRes_num(rs.getInt("res_num"));
//				dto.setUser_ID(rs.getString("User_ID"));
//				
//				dto.setDriver_ID(rs.getString("driver_ID"));
//				dto.setReservat_date(rs.getDate("Reservat_date"));
//				dto.set(rs.getDate("join_date"));
//				dto.setTel(rs.getString("name"));
//				dto.setState(rs.getInt("state"));
//			}
//		}catch (Exception e) {
//			e.printStackTrace();
//		}finally {
//			close();
//		}
//		
//		return dto;
//	}
	
	public ArrayList<MatchingDTO> allUser() {
		ArrayList<MatchingDTO> res = new ArrayList<MatchingDTO>();
		sql = "select * from matching";
		try {
			ptmt = con.prepareStatement(sql);
			
			rs = ptmt.executeQuery();
			while(rs.next()) {
				MatchingDTO dto = new MatchingDTO();
				
				dto = new MatchingDTO();
				dto.setRes_num(rs.getInt("res_num"));
				dto.setUser_ID(rs.getString("user_ID"));
//				dto.setUser_ID(rs.getString("user_ID"));//이름 대신 임시
				dto.setUser_ID(rs.getString("user_ID"));//전화번호 대신 임시
				dto.setDriver_ID(rs.getString("driver_ID"));
//				dto.setDriver_ID(rs.getString("driver_ID"));//이름 대신 임시
				dto.setDriver_ID(rs.getString("driver_ID"));//전화번호 대신 임시
				dto.setReservat_date(rs.getDate("reservat_date"));
				dto.setStart_point(rs.getString("start_point"));
				dto.setStart_op(rs.getString("start_op"));
				dto.setLuggage_list(rs.getString("luggage_list"));
				dto.setBox(rs.getInt("box"));
				dto.setRequests(rs.getString("requests"));
				dto.setReq_state(rs.getInt("req_state"));
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
	
	public ArrayList<MatchingDTO> oneUserForStaff(String id) {
		ArrayList<MatchingDTO> res = new ArrayList<MatchingDTO>();
		sql = "select * from matching where driver_ID = ?";
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, id);
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
				dto.setBox(rs.getInt("box"));
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
	
	public ArrayList<MatchingDTO> oneUserForGuest(String id) {
		ArrayList<MatchingDTO> res = new ArrayList<MatchingDTO>();
		sql = "select * from matching where user_ID = ?";
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, id);
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
				dto.setBox(rs.getInt("box"));
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
	
	public void close() {
		if(rs!=null)try {rs.close();} catch (SQLException e) {}
		if(ptmt!=null)try {ptmt.close();} catch (SQLException e) {}
		if(con!=null)try {con.close();} catch (SQLException e) {}
	}
}
