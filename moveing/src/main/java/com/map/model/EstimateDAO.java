package com.map.model;

import java.sql.Connection;
import java.sql.Date;
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
	public int detailToOrderNum(String user_id) {
		int orderNum = 0;
			sql = "select user_order from estimate where id = '"+user_id+"'";
		return orderNum;
	}
	public void addEstimate(String pagenum,String user_id, String sel_date,String data) {
		
		System.out.println("addEstiate들어옴"+pagenum+"// ID:"+user_id+"// date:"+sel_date);
		
		try {
			sql = "select id from estimate where id = '"+user_id+"'";
			ptmt = con.prepareStatement(sql);
			rs = ptmt.executeQuery();
			
			if(pagenum.equals("") || data.equals(null)) {
				sql = "INSERT INTO estimate (user_order,id,state) VALUES (?, ?, 0)";
				int orderNum = (int)(Math.random()*10000)*2022;
				ptmt = con.prepareStatement(sql);
				ptmt.setInt(1,orderNum);
				ptmt.setString(2,user_id);
				rs = ptmt.executeQuery();
				System.out.println(orderNum+"//"+user_id+"데이터 생성");
			}else {
				String[] arr= data.split("@");
				System.out.println("arr길이: "+arr.length+"\n---"+data);
				if(pagenum.equals("2")) {//1페이지에서 2페이지 넘어갈때
					sql = "update estimate set "
							+ "SV_Type =?, sel_date =?, Start_point =?, Start_OP =?, End_point =?, End_OP =? "
							+ "where id =? and state =? ";
					ptmt = con.prepareStatement(sql);
					ptmt.setString(1,arr[0]);
					ptmt.setString(2,arr[1]);
					ptmt.setString(3,arr[3]);
					ptmt.setString(4,arr[4]);
					ptmt.setString(5,arr[5]);
					ptmt.setString(6,arr[6]);
					ptmt.setString(7,user_id);
					ptmt.setInt(8,0);
					rs = ptmt.executeQuery();
					
					System.out.println("개인 데이터 넣음"+pagenum+"// ID:"+user_id+"// date:"+sel_date);
				}else if(pagenum.equals("3")) {//2페이지에서 3페이지 넘어갈때
					sql = "update estimate set "
							+ "Furniture =?, Home_App =?, Other =? "
							+ "where id =? and state =? ";
					ptmt = con.prepareStatement(sql);
					ptmt.setString(1,arr[0]);
					ptmt.setString(2,arr[1]);
					ptmt.setString(3,arr[2]);

					ptmt.setString(4,user_id);
					ptmt.setInt(5,0);
					rs = ptmt.executeQuery();
					
					System.out.println("개인 데이터 넣음"+pagenum+"// ID:"+user_id+"// date:"+sel_date);
				}
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}

	public void close() {
		if(rs!=null)try {rs.close();} catch (SQLException e) {}
		if(ptmt!=null)try {ptmt.close();} catch (SQLException e) {}
		if(con!=null)try {con.close();} catch (SQLException e) {}
	}
}
