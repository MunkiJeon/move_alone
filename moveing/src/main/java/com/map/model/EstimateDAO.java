package com.map.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;
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
	
	public void addEstiate(String pagenum,String user_id) {
		
		System.out.println(pagenum+"ID:"+user_id);
		if(pagenum.equals("2")) {//1페이지에서 2페이지 넘어갈때
			System.out.println("------------ID:"+user_id);
		}else if(pagenum.equals("3")) {//2페이지에서 3페이지 넘어갈때
			System.out.println("------------ID:"+user_id);
		}
		
//		sql = "insert into estiate()";
//		-- 다중 입력
//		insert into member(id, name, birth) values 
//		(2,'최한별','1996-01-05'),
//		(3,'최두별','1998-07-05'),
//		(4,'최세별','1991-06-24'),
//		(5,'최네별','2002-06-02');
//
//		-- 수정
//		update member set height = 185.3, reg_date = '2022-03-25';
//
//		/*
//		update member set birth = '1995-11-18'
//		where name = '송지은';
//		*/
	}

	public void close() {
		if(rs!=null)try {rs.close();} catch (SQLException e) {}
		if(ptmt!=null)try {ptmt.close();} catch (SQLException e) {}
		if(con!=null)try {con.close();} catch (SQLException e) {}
	}
}
