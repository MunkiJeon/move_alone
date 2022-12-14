package com.map.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;

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
	
	public ArrayList<MoneyDTO> Saleslist() {
		ArrayList<MoneyDTO> list = new ArrayList<MoneyDTO>();
		try {
			sql ="select * from money WHERE state = 1";
			ptmt = con.prepareStatement(sql);
			rs = ptmt.executeQuery();
			while(rs.next()) {
				MoneyDTO dto = new MoneyDTO();
				
				dto.setNo(rs.getInt("no"));
				dto.setRes_num(rs.getInt("res_num"));
				dto.setId(rs.getString("id"));
				dto.setSel_date(rs.getDate("sel_date"));
				dto.setReq_date(rs.getDate("req_date"));
				dto.setStart_Point(rs.getString("start_Point"));
				dto.setEnd_Point(rs.getString("end_Point"));
				dto.setKm(rs.getDouble("km"));
				dto.setKm_price(rs.getInt("km_price"));
				dto.setSV_Type(rs.getString("SV_Type"));
				dto.setSV_price(rs.getInt("SV_price"));
				dto.setElevator(rs.getString("elevator"));
				dto.setElevator_price(rs.getInt("elevator_price"));
				dto.setParking(rs.getString("parking"));
				dto.setParking_price(rs.getInt("parking_price"));
				dto.setLuggage_list(rs.getString("luggage_list"));
				dto.setLuggage_price(rs.getInt("luggage_price"));
				dto.setState(rs.getInt("state"));
				dto.setPrice(rs.getInt("price"));
				
				list.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return list;
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
	
	public ArrayList<CalculateDTO> monthList(String start,String end,String type) {
		ArrayList<CalculateDTO> list = new ArrayList<CalculateDTO>();

		sql = "select * from calculate ";
		try {
			if((start=="" || end=="") && type != "") {
				sql+="where type = ?";
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1,type);
			}else if(start!="" && end!="" && type != "") {
				sql+="where c_date >= ? and c_date <= ? and po_name = ?";	
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1,start);
				ptmt.setString(2,end);		
				ptmt.setString(3,type);		
			}else if(start != "" && end != "" && type == "") {
				sql+="where c_date >= ? and c_date <= ? ";	
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1,start);
				ptmt.setString(2,end);		
			}else {
				ptmt = con.prepareStatement(sql);				
			}
		
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
	
	public int insert(MultipartRequest multi) {
		sql = "insert into calculate(po_code,c_date,po_wname,po_name,quantity,unit_price,price,cal_type) values('a001',sysdate(),?,?,?,?,?,'??????')";
		try {
			ptmt = con.prepareStatement(sql);
			
			ptmt.setInt(1, Integer.parseInt(multi.getParameter("selLargeCategory")));
//			ptmt.setInt(2, Integer.parseInt(multi.getParameter("selSmallCategory")));
			ptmt.setString(2, multi.getParameter("name"));
			ptmt.setInt(3, Integer.parseInt(multi.getParameter("stock_1")));
			ptmt.setInt(4, Integer.parseInt(multi.getParameter("oriprice")));
			ptmt.setInt(5, Integer.parseInt(multi.getParameter("stock_1")) * Integer.parseInt(multi.getParameter("oriprice")) );
			
			return ptmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return 0;
	}
	//---------------------??????
	public int insert2(CalculateDTO dto){
		sql = "insert into calculate (c_date, po_code, po_wname,po_name,quantity,price,cal_type,res_num ) values(sysdate(),'a001','??????',?,1,?,'??????',?)";
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, dto.getPo_name());
			ptmt.setInt(2, dto.getPrice());
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
	public void close() {
		if(rs!=null)try {rs.close();} catch (SQLException e) {}
		if(ptmt!=null)try {ptmt.close();} catch (SQLException e) {}
		if(con!=null)try {con.close();} catch (SQLException e) {}
	}
}
