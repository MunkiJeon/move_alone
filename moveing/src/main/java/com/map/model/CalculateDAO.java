package com.map.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CalculateDAO {
	Connection con;
	PreparedStatement ptmt;
	ResultSet rs;
	String sql;
	
	public CalculateDAO() {
		try {
			InitialContext init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/qwer");
			con = ds.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<CalculateDTO> list() {
		ArrayList<CalculateDTO> list = new ArrayList<CalculateDTO>();
		sql = "select * from calculate";
		try {
			ptmt = con.prepareStatement(sql);

			rs = ptmt.executeQuery();
			while(rs.next()) {
				CalculateDTO dto = new CalculateDTO();
				dto.setC_date(rs.getDate("c_date"));
				dto.setPo_code(rs.getString("po_code"));
				dto.setPo_wname(rs.getString("po_wname"));
				dto.setPo_name(rs.getString("po_name"));
				dto.setQuantity(rs.getInt("quantity"));
				dto.setUnit_price(rs.getInt("unit_price"));
				dto.setPrice(rs.getInt("price"));
				dto.setCal_type(rs.getString("cal_type"));
				list.add(dto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return list;
	}
	
	public ArrayList<CalculateDTO> monthList(String start,String end) {
		ArrayList<CalculateDTO> list = new ArrayList<CalculateDTO>();
		sql = "select * from calculate where c_date > ? and c_date < ?";
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1,start);
			ptmt.setString(2,end);
			rs = ptmt.executeQuery();
			while(rs.next()) {
				CalculateDTO dto = new CalculateDTO();
				dto.setC_date(rs.getDate("c_date"));
				dto.setPo_code(rs.getString("po_code"));
				dto.setPo_wname(rs.getString("po_wname"));
				dto.setPo_name(rs.getString("po_name"));
				dto.setQuantity(rs.getInt("quantity"));
				dto.setUnit_price(rs.getInt("unit_price"));
				dto.setPrice(rs.getInt("price"));
				dto.setCal_type(rs.getString("cal_type"));
				list.add(dto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return list;
	}

	public void close() {
		if(rs!=null)try {rs.close();} catch (SQLException e) {}
		if(ptmt!=null)try {ptmt.close();} catch (SQLException e) {}
		if(con!=null)try {con.close();} catch (SQLException e) {}
	}
}
