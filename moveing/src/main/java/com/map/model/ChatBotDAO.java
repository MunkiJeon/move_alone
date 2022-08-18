package com.map.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ChatBotDAO {
	Connection con;
	PreparedStatement ptmt;
	ResultSet rs;
	String sql;
	
	public ChatBotDAO() {
		try {
			InitialContext init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/qwer");
			con = ds.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<ChatBotDTO> list() {
		ArrayList<ChatBotDTO> res = new ArrayList<ChatBotDTO>();
		
		sql = "select * from chatbot";
		try {
			ptmt = con.prepareStatement(sql);
			rs = ptmt.executeQuery();
			while(rs.next()) {
				ChatBotDTO dto = new ChatBotDTO();
				dto.setNo(rs.getInt("no"));
				dto.setAnswer(rs.getString("answer"));
				dto.setQuestions(rs.getString("questions"));
				dto.setType(rs.getString("type"));
				res.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return res;
	}
	
	public int insert(ChatBotDTO dto) {
		
		sql = "insert into chatbot(type,questions,answer) values(?,?,?)";
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, dto.getType());
			ptmt.setString(2, dto.getQuestions());
			ptmt.setString(3, dto.getAnswer());
			return ptmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return 0;
	}
	public ChatBotDTO oneAnswer(String no) {
		ChatBotDTO dto = null;
		sql = "select * from chatbot where no = ?";
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, no);
			rs = ptmt.executeQuery();
			if(rs.next()) {
				dto = new ChatBotDTO();
				dto.setNo(rs.getInt("no"));
				dto.setType(rs.getString("type"));
				dto.setQuestions(rs.getString("questions"));
				dto.setAnswer(rs.getString("answer"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return dto;
	}

	public int modify(ChatBotDTO dto) {
		   try {
			sql = "update chatbot set type = ? ,  questions = ? , answer = ? where no = ?";
		
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, dto.type);
			ptmt.setString(2, dto.getQuestions());
			ptmt.setString(3, dto.getAnswer());
			ptmt.setInt(4, dto.getNo());
			return ptmt.executeUpdate();
		   } catch (Exception e) {
			   e.printStackTrace();
		}finally {
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
