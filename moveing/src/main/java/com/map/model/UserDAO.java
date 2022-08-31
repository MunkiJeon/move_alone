package com.map.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

public class UserDAO {
	Connection con;
	PreparedStatement ptmt;
	ResultSet rs;
	String sql;
	
	private static UserDAO instance;

	public static UserDAO getInstance() {
		if (instance == null) {
			instance = new UserDAO();
		}
		return instance;
	}
	
	public UserDAO() {
		try {
			InitialContext init = new InitialContext();
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:comp/env"); 
			DataSource ds = (DataSource) envContext.lookup("qwer");
			con = ds.getConnection(); 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("생성자에서 conn :" + con);
		}
		
	}
	
	public UserDTO oneUser(String id) {
		UserDTO dto = null;
		try {
			sql = "select * from user where id = ?";
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, id);
			rs = ptmt.executeQuery();
		if(rs.next()) {
				dto = new UserDTO();
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setJoin_date(rs.getDate("join_date"));
				dto.setTel(rs.getString("tel"));
				dto.setState(rs.getInt("state"));
				dto.setLevel(rs.getInt("level"));
			}
		} catch (Exception e) {
			System.out.println("getMemberById() 실행중 에러");
			e.printStackTrace();
		}finally {
			close();
		}
		
		return dto;
	}
	
	public UserDTO oneStaff(String id) {
		UserDTO dto = null;
		sql = "select * from user where id = ?";
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, id);
			rs = ptmt.executeQuery();
			while(rs.next()) {
				dto = new UserDTO();
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setJoin_date(rs.getDate("join_date"));
				dto.setTel(rs.getString("tel"));
				dto.setPic(rs.getString("pic"));
				dto.setState(rs.getInt("state"));
				dto.setLevel(rs.getInt("level"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return dto;
	}
	//---------------------------------------------찬희
	public ArrayList<UserDTO> allStaff(String id) {
		ArrayList<UserDTO> res = new ArrayList<UserDTO>();
		sql = "select * from user where id = ?";
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, id);
			rs = ptmt.executeQuery();
			while(rs.next()) {
				UserDTO dto = new UserDTO();
				
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setJoin_date(rs.getDate("join_date"));
				dto.setTel(rs.getString("tel"));
				dto.setState(rs.getInt("state"));
				dto.setLevel(rs.getInt("level"));
				
				res.add(dto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return res;
	}
	
	public ArrayList<UserDTO> allUser() {
		ArrayList<UserDTO> res = new ArrayList<UserDTO>();
		sql = "select * from user";
		try {
			ptmt = con.prepareStatement(sql);
			
			rs = ptmt.executeQuery();
			while(rs.next()) {
				UserDTO dto = new UserDTO();
				
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setJoin_date(rs.getDate("join_date"));
				dto.setTel(rs.getString("tel"));
				dto.setState(rs.getInt("state"));
				dto.setLevel(rs.getInt("level"));
				
				res.add(dto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return res;
	}
	
	public ArrayList<UserDTO> searUser(HttpServletRequest request) {
		ArrayList<UserDTO> res = new ArrayList<UserDTO>();
		String searchName   = request.getParameter("search_name");   
		String searchId     = request.getParameter("search_id");     
		String searchDate   = request.getParameter("search_date");   
		int level   = Integer.parseInt(request.getParameter("level"));   
		sql = "select * from user where level = ? ";
		
		if(searchName != "" && searchName != null) {
			//sql	+= " and user_ID = '" + searchName + "'"; //전체검색
			sql	+= "AND NAME LIKE '%" + searchName + "%'"; //특정검색
		}
		if(searchId != "" && searchId != null) {
			sql	+= "AND ID = '" + searchId +"'";
		}
		if(searchDate != "" && searchDate != null) {
			sql	+= "AND DATE(JOIN_DATE) = '" + searchDate +"'";
		}
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, level);
			rs = ptmt.executeQuery();
			while(rs.next()) {
				UserDTO dto = new UserDTO();
				
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setJoin_date(rs.getDate("join_date"));
				dto.setTel(rs.getString("tel"));
				dto.setState(rs.getInt("state"));
				dto.setLevel(rs.getInt("level"));
				
				res.add(dto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return res;
	}
	
	
	
	public ArrayList<UserDTO> levelUser(int level) {
		ArrayList<UserDTO> res = new ArrayList<UserDTO>();
		sql = "select * from user where level = ?";
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, level);
			rs = ptmt.executeQuery();
			while(rs.next()) {
				UserDTO dto = new UserDTO();
				
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setJoin_date(rs.getDate("join_date"));
				dto.setTel(rs.getString("name"));
				dto.setState(rs.getInt("state"));
				dto.setLevel(rs.getInt("level"));
				
				res.add(dto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return res;
	}

	public int insert(UserDTO dto){
		sql = "insert into user (id, pw, name,email,join_date,tel,state,level ) values(?,?,?,?,sysdate(),?,0,2)";
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, dto.getId());
			ptmt.setString(2, dto.getPw());
			ptmt.setString(3, dto.getName());
			ptmt.setString(4, dto.getEmail());
			ptmt.setString(5, dto.getTel());
			
			return ptmt.executeUpdate();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}finally {
			close();
		}
		
		
		return 0;
	}
	
	public int managerInsert(UserDTO dto){
		sql = "insert into user (id, pw, name,email,join_date,tel,state,level ) values(?,?,?,?,sysdate(),?,0,?)";
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, dto.getId());
			ptmt.setString(2, dto.getPw());
			ptmt.setString(3, dto.getName());
			ptmt.setString(4, dto.getEmail());
			ptmt.setString(5, dto.getTel());
			ptmt.setInt(6, dto.getLevel());
			
			return ptmt.executeUpdate();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}finally {
			close();
		}
		
		
		return 0;
	}
	public int update(UserDTO dto){
		sql = "update user set pw = ? ,name = ? ,email = ?, tel = ? where id = ?";
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, dto.getPw());
			ptmt.setString(2, dto.getName());
			ptmt.setString(3, dto.getEmail());
			ptmt.setString(4, dto.getTel());
			ptmt.setString(5, dto.getId());
			
			return ptmt.executeUpdate();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}finally {
			close();
		}
		
		return 0;
	}
	
	public  int modify(UserDTO dto) {
		   try {
			sql = "update user set  email = ? , tel = ?, name = ? where id = ?";
		
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, dto.email);
			ptmt.setString(2, dto.tel);
			ptmt.setString(3, dto.name);
			ptmt.setString(4, dto.id);
			return ptmt.executeUpdate();
		   } catch (Exception e) {
			   e.printStackTrace();
		}finally {
			close();
		}
		   return 0;
	}
	
	public int delete(UserDTO dto) {
		
		try {
			sql = "delete from user where id = ? and pw = ?";
			
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1,dto.id);
			System.out.println(dto.id+"------------------");
			ptmt.setString(2, dto.pw);
			System.out.println(dto.pw+"------------------");
			
			return ptmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return 0;
	}
	public int managerDelete(String id) {
		
		try {
			sql = "delete from user where id = ?";
			
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1,id);
			
			return ptmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return 0;
	}
	
	public int staffState(UserDTO dto){
		sql = "update user set state = ? where id = ?";
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, dto.getState());
			ptmt.setString(2, dto.getId());
			
			return ptmt.executeUpdate();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}finally {
			close();
		}
		
		return 0;
	}
	
	public  int pwModify(UserDTO dto) {
		   try {
			sql = "update user set pw = ? where id = ?";
		
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, dto.pw);
			ptmt.setString(2, dto.id);
			return ptmt.executeUpdate();
		   } catch (Exception e) {
			   e.printStackTrace();
		}finally {
			close();
		}
		   return 0;
	  }
	   public String findId(String name, String tel) {
		      String id = null;

		      try {
		         String sql = "select id from user where name=? and tel=? ";
		         ptmt = con.prepareStatement(sql);
		         ptmt.setString(1, name);
		         ptmt.setString(2, tel);

		         rs = ptmt.executeQuery();

		         if (rs.next()) {
		            id = rs.getString("id");
		         }

		      } catch (Exception e) {
		         e.printStackTrace();
		      } finally {
		         close();
		      }
		      return id;
		   }
	   public String findPw(String id, String tel) {
		      String pw = null;

		      try {
		         String sql = "select pw from user where id=? and tel=? ";
		         ptmt = con.prepareStatement(sql);
		         ptmt.setString(1, id);
		         ptmt.setString(2, tel);

		         rs = ptmt.executeQuery();

		         if (rs.next()) {
		            pw = rs.getString("pw");
		         }

		      } catch (Exception e) {
		         e.printStackTrace();
		      } finally {
		         close();
		      }
		      return pw;
		   }

	public int staffLength() {
		int res = 0;
		try {
			sql = "select count(level) from user where level = 1;";
		
			ptmt = con.prepareStatement(sql);
			rs = ptmt.executeQuery();
			rs.next();
			res = rs.getInt("count(level)");
		   } catch (Exception e) {
			   e.printStackTrace();
		}finally {
			close();
		}
	   return res;
	}
	
	
	public void close() {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
			}
		}
		if (ptmt != null) {
			try {
				ptmt.close();
			} catch (SQLException e) {
			}
		}
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
			}
		}
	}
}
