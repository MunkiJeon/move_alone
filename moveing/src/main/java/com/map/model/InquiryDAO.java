package com.map.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class InquiryDAO {
	Connection con;
	PreparedStatement ptmt;
	ResultSet rs;
	String sql;
	
	public InquiryDAO() {
		try {
			InitialContext init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/qwer");
			con = ds.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<InquiryDTO> list() {
		ArrayList<InquiryDTO> res = new ArrayList<InquiryDTO>();
		
		sql = "select * from inquiry";
		try {
			ptmt = con.prepareStatement(sql);
			rs = ptmt.executeQuery();
			while(rs.next()) {
				InquiryDTO dto = new InquiryDTO();
				dto.setId(rs.getString("id"));
				dto.setAnswer(rs.getString("answer"));
				dto.setContents(rs.getString("contents"));
				dto.setTime(rs.getDate("time"));
				dto.setName(rs.getString("name"));
				res.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return res;
	}
	public int modify(InquiryDTO dto) {
		ArrayList<InquiryDTO> res = new ArrayList<InquiryDTO>();
		
		sql = "update inquiry set answer = ? where no = ?";
		
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, dto.getAnswer());
			ptmt.setInt(2, dto.getNo());
			System.out.println(sql);
			return ptmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return 0;
	}
	
	public ArrayList<InquiryDTO> answer() {
		ArrayList<InquiryDTO> res = new ArrayList<InquiryDTO>();
		
		sql = "select * from inquiry";
		try {
			ptmt = con.prepareStatement(sql);
			rs = ptmt.executeQuery();
			while(rs.next()) {
				InquiryDTO dto = new InquiryDTO();
				dto.setId(rs.getString("id"));
				dto.setAnswer(rs.getString("answer"));
				dto.setContents(rs.getString("contents"));
				dto.setTime(rs.getDate("time"));
				dto.setName(rs.getString("name"));
				res.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return res;
	}
	public ArrayList<InquiryDTO> atmosphere(int level) {
		ArrayList<InquiryDTO> res = new ArrayList<InquiryDTO>();
		
		sql = "select * from inquiry where level = ?";
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, level);
			rs = ptmt.executeQuery();
			while(rs.next()) {
				InquiryDTO dto = new InquiryDTO();
				dto.setId(rs.getString("id"));
				dto.setAnswer(rs.getString("answer"));
				dto.setContents(rs.getString("contents"));
				dto.setTime(rs.getDate("time"));
				dto.setName(rs.getString("name"));
				dto.setNo(rs.getInt("no"));
				res.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return res;
	}
	
	public ArrayList<InquiryDTO> idList(String id){
		ArrayList<InquiryDTO> res = new ArrayList<InquiryDTO>();
		sql = "select * from inquiry where id = ?";
		
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, id);
			rs = ptmt.executeQuery();
			while(rs.next()) {
				InquiryDTO dto = new InquiryDTO();
				dto.setId(rs.getString("id"));
				dto.setAnswer(rs.getString("answer"));
				dto.setContents(rs.getString("contents"));
				dto.setTime(rs.getDate("time"));
				dto.setName(rs.getString("name"));
				res.add(dto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return res;
	}
	
	public int insert(InquiryDTO dto) {
		
		sql = "insert into inquiry(id,name,contents,time,level) values(?,?,?,sysdate())";

		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, dto.getId());
			ptmt.setString(2, dto.getName());
			ptmt.setString(3, dto.getContents());
			ptmt.setInt(4, dto.getLevel());
			
			int res = ptmt.executeUpdate();
			return res;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return 0;
	}
	
	public void close() {
		if(rs!=null)try {rs.close();} catch (SQLException e) {}
		if(ptmt!=null)try {ptmt.close();} catch (SQLException e) {}
		if(con!=null)try {con.close();} catch (SQLException e) {}
	}
}
