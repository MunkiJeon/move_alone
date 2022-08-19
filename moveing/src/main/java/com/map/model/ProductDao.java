package com.map.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;

public class ProductDao {
	private Connection conn = null;
	
	private static ProductDao instance;
	public static ProductDao getInstance() {
		if(instance == null) {
			instance = new ProductDao();
		}
		return instance;
	}
	
	private ProductDao(){
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:comp/env"); // java:comp/env 에 설정 정보가 저장되는건 내가 임의로 수정할 수 없음.
			DataSource ds = (DataSource) envContext.lookup("qwer");
			conn = ds.getConnection(); // 설정 정보를 가지고 계정에 접송해서 Connection 
			System.out.println("생성자에서 conn :" + conn);
		} catch (NamingException e) {
			System.out.println("CategoryDao 생성자에서 컨넥션 객체를 얻다가 오류 발생");
		} catch (SQLException e) {
			System.out.println("CategoryDao 생성자에서 컨넥션 객체를 얻다가 오류 발생");
		}
	}
	
	public ArrayList<ProductBean> getAllProduct() {
		
		ArrayList<ProductBean> list = new ArrayList<ProductBean>();
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			// 3. SQL 작상 및 분석
			String sql = "select pro.NO, pro.LCNAME, scate.name as SCNAME, pro.NAME, pro.ORIPRICE,"
					+ " pro.DISCPRICE, pro.INFO, pro.MAINIMGN \r\n"
					+ "from scategory scate inner join (select pro.NO, lcate.NAME as lcname, pro.SCNO, pro.NAME, "
					+ "pro.ORIPRICE, pro.DISCPRICE, pro.INFO, pro.MAINIMGN \r\n"
					+ "from lcategory lcate inner join product pro\r\n"
					+ "on lcate.no = pro.lcno) pro\r\n"
					+ "on scate.no = pro.scno";
			ps = conn.prepareStatement(sql);
			
			// 4. SQL문 실행
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ProductBean pbean = new ProductBean();
				
				pbean.setNo(rs.getInt("no"));
				pbean.setLcname(rs.getString("lcname"));
				pbean.setScname(rs.getString("scname"));
				pbean.setName(rs.getString("name"));				
				pbean.setOriprice(rs.getInt("oriprice"));				
				pbean.setDiscprice(rs.getInt("discprice"));
				pbean.setInfo(rs.getString("info"));
				pbean.setMainImgN(rs.getString("mainImgN"));
				
				list.add(pbean);
			}

		} catch (SQLException e) {
			System.out.println(e);
			System.out.println("getAllProduct() SQL문 실행중 오류 발생");
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
				System.out.println("접속 종료 실패");
			}
		}
		return list;
	}// getAllProduct()
	
	public ArrayList<ProductBean> getAllProductByLcno(int lcno){
		ArrayList<ProductBean> list = new ArrayList<ProductBean>();
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			// 3. SQL 작상 및 분석
			String sql = "select pro.NO, pro.LCNAME, scate.name as scname, pro.NAME, pro.ORIPRICE, pro.DISCPRICE, pro.INFO, pro.MAINIMGN, pro.DETAILIMGN1, pro.DETAILIMGN2, pro.DETAILIMGN3, pro.DETAILIMGN4 \r\n"
					+ "from scategory scate inner join \r\n"
					+ "(select pro.NO, lcate.NAME as lcname, pro.SCNO, pro.NAME, pro.ORIPRICE, pro.DISCPRICE, pro.INFO, pro.MAINIMGN, pro.DETAILIMGN1, pro.DETAILIMGN2, pro.DETAILIMGN3, pro.DETAILIMGN4\r\n"
					+ "from lcategory lcate inner join product pro\r\n"
					+ "on lcate.no = pro.lcno where lcate.no=? ) pro\r\n"
					+ "on scate.no = pro.scno";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, lcno);
			
			// 4. SQL문 실행
			rs = ps.executeQuery();
			System.out.println("여기까지 잘 옴");
			
			while(rs.next()) {
				ProductBean pbean = new ProductBean();
				
				pbean.setNo(rs.getInt("no"));
				pbean.setLcname(rs.getString("lcname"));
				pbean.setScname(rs.getString("scname"));
				pbean.setName(rs.getString("name"));				
				pbean.setOriprice(rs.getInt("oriprice"));				
				pbean.setDiscprice(rs.getInt("discprice"));
				pbean.setInfo(rs.getString("info"));
				pbean.setMainImgN(rs.getString("mainImgN"));				
				pbean.setDetailImgN1(rs.getString("detailImgN1"));
				pbean.setDetailImgN2(rs.getString("detailImgN2"));
				pbean.setDetailImgN3(rs.getString("detailImgN3"));
				pbean.setDetailImgN4(rs.getString("detailImgN4"));
				
				list.add(pbean);
			}

		} catch (SQLException e) {
			System.out.println(e);
			System.out.println("getAllProductByLcno() SQL문 실행중 오류 발생");
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
				System.out.println("접속 종료 실패");
			}
		}
		return list;
	}
	
	public ArrayList<ProductBean> getAllProductByScno(int scno){
		ArrayList<ProductBean> list = new ArrayList<ProductBean>();
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			// 3. SQL 작상 및 분석
			String sql = "select pro.NO, pro.LCNAME, scate.name as scname, pro.NAME, pro.ORIPRICE, pro.DISCPRICE, pro.INFO, pro.MAINIMGN, pro.DETAILIMGN1, pro.DETAILIMGN2, pro.DETAILIMGN3, pro.DETAILIMGN4 \r\n"
					+ "from scategory scate inner join \r\n"
					+ "(select pro.NO, lcate.NAME as lcname, pro.SCNO, pro.NAME, pro.ORIPRICE, pro.DISCPRICE, pro.INFO, pro.MAINIMGN, pro.DETAILIMGN1, pro.DETAILIMGN2, pro.DETAILIMGN3, pro.DETAILIMGN4\r\n"
					+ "from lcategory lcate inner join product pro\r\n"
					+ "on lcate.no = pro.lcno) pro\r\n"
					+ "on scate.no = pro.scno where scate.no=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, scno);
			
			// 4. SQL문 실행
			rs = ps.executeQuery();
			System.out.println("여기까지 잘 옴");
			
			while(rs.next()) {
				ProductBean pbean = new ProductBean();
				
				pbean.setNo(rs.getInt("no"));
				pbean.setLcname(rs.getString("lcname"));
				pbean.setScname(rs.getString("scname"));
				pbean.setName(rs.getString("name"));				
				pbean.setOriprice(rs.getInt("oriprice"));				
				pbean.setDiscprice(rs.getInt("discprice"));
				pbean.setInfo(rs.getString("info"));
				pbean.setMainImgN(rs.getString("mainImgN"));				
				pbean.setDetailImgN1(rs.getString("detailImgN1"));
				pbean.setDetailImgN2(rs.getString("detailImgN2"));
				pbean.setDetailImgN3(rs.getString("detailImgN3"));
				pbean.setDetailImgN4(rs.getString("detailImgN4"));
				
				list.add(pbean);
			}

		} catch (SQLException e) {
			System.out.println(e);
			System.out.println("getAllProductByScno() SQL문 실행중 오류 발생");
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
				System.out.println("접속 종료 실패");
			}
		}
		return list;
	}
	
	public ArrayList<ProductBean> getAllProductByName(String search){
		
		ArrayList<ProductBean> list = new ArrayList<ProductBean>();
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			// 3. SQL 작상 및 분석
			String sql = "select * from\r\n"
					+ "(select pro.NO, pro.LCNAME, scate.name as scname, pro.NAME, pro.ORIPRICE, pro.DISCPRICE, pro.INFO, pro.MAINIMGN, pro.DETAILIMGN1, pro.DETAILIMGN2, pro.DETAILIMGN3, pro.DETAILIMGN4 \r\n"
					+ "from scategory scate inner join \r\n"
					+ "(select pro.NO, lcate.NAME as lcname, pro.SCNO, pro.NAME, pro.ORIPRICE, pro.DISCPRICE, pro.INFO, pro.MAINIMGN, pro.DETAILIMGN1, pro.DETAILIMGN2, pro.DETAILIMGN3, pro.DETAILIMGN4\r\n"
					+ "from lcategory lcate inner join product pro\r\n"
					+ "on lcate.no = pro.lcno) pro\r\n"
					+ "on scate.no = pro.scno)\r\n"
					+ "where upper(lcname) like ? or upper(scname) like ? or upper(name) like ?";
			ps = conn.prepareStatement(sql);
			
			search = search.toUpperCase(); // 대문자로 변환
			
			ps.setString(1, "%" + search + "%");
			ps.setString(2, "%" + search + "%");
			ps.setString(3, "%" + search + "%");
			
			// 4. SQL문 실행
			rs = ps.executeQuery();
			System.out.println("여기까지 잘 옴");
			
			while(rs.next()) {
				ProductBean pbean = new ProductBean();
				
				pbean.setNo(rs.getInt("no"));
				pbean.setLcname(rs.getString("lcname"));
				pbean.setScname(rs.getString("scname"));
				pbean.setName(rs.getString("name"));				
				pbean.setOriprice(rs.getInt("oriprice"));				
				pbean.setDiscprice(rs.getInt("discprice"));
				pbean.setInfo(rs.getString("info"));
				pbean.setMainImgN(rs.getString("mainImgN"));				
				pbean.setDetailImgN1(rs.getString("detailImgN1"));
				pbean.setDetailImgN2(rs.getString("detailImgN2"));
				pbean.setDetailImgN3(rs.getString("detailImgN3"));
				pbean.setDetailImgN4(rs.getString("detailImgN4"));
				
				list.add(pbean);
			}

		} catch (SQLException e) {
			System.out.println(e);
			System.out.println("getAllProductByName() SQL문 실행중 오류 발생");
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
				System.out.println("접속 종료 실패");
			}
		}
		return list;
	}
	
	public int insertProduct(MultipartRequest multi) {
		
		int cnt = -1;

		PreparedStatement ps = null;

		try {
			// 3. SQL 작상 및 분석
			String sql = "insert into product values(nextval(prodseq),?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, Integer.parseInt(multi.getParameter("selLargeCategory")));
			ps.setInt(2, Integer.parseInt(multi.getParameter("selSmallCategory")));
			ps.setString(3, multi.getParameter("name"));
			ps.setInt(4, Integer.parseInt(multi.getParameter("oriprice")));
			ps.setInt(5, Integer.parseInt(multi.getParameter("discprice")));
			ps.setString(6, multi.getParameter("info"));
			ps.setString(7, multi.getFilesystemName("mainImg"));
			
			
			// 4. SQL문 실행
			cnt = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e);
			System.out.println(e.getMessage());
			System.out.println("insertProduct() SQL문 실행중 오류 발생");
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
				System.out.println("접속 종료 실패");
			}
		}
		return cnt;
	}
	
	public ProductBean getProduct(int no) {
		
		ProductBean pbean = null;

		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			// 3. SQL 작상 및 분석
			String sql = "select pro.NO, pro.LCNAME, scate.name as scname, pro.NAME, pro.ORIPRICE, pro.DISCPRICE, pro.INFO, pro.MAINIMGN \r\n"
					+ "from scategory scate inner join \r\n"
					+ "(select pro.NO, lcate.NAME as lcname, pro.SCNO, pro.NAME, pro.ORIPRICE, pro.DISCPRICE, pro.INFO, pro.MAINIMGN \r\n"
					+ "from lcategory lcate inner join product pro\r\n"
					+ "on lcate.no = pro.lcno where pro.no=?) pro\r\n"
					+ "on scate.no = pro.scno";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			
			// 4. SQL문 실행
			rs = ps.executeQuery();

			if (rs.next()) {
				pbean = new ProductBean();

				pbean.setNo(rs.getInt("no"));
				pbean.setLcname(rs.getString("lcname"));
				pbean.setScname(rs.getString("scname"));
				pbean.setName(rs.getString("name"));
				pbean.setOriprice(rs.getInt("oriprice"));
				pbean.setDiscprice(rs.getInt("discprice"));
				pbean.setInfo(rs.getString("info"));
				pbean.setMainImgN(rs.getString("mainImgN"));
			}

		} catch (SQLException e) {
			System.out.println(e);
			System.out.println("getProduct() SQL문 실행중 오류 발생");
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
				System.out.println("접속 종료 실패");
			}
		}
		return pbean;
	}
	
	public int deleteProduct(int pno) {
		
		int cnt = -1;

		PreparedStatement ps = null;

		try {
			// 3. SQL 작상 및 분석
			String sql = "delete from product where no=" + pno;
			ps = conn.prepareStatement(sql);
			
			// 4. SQL문 실행
			cnt = ps.executeUpdate();

		} catch (SQLException e) {
			System.out.println(e);
			System.out.println("deleteProduct() SQL문 실행중 오류 발생");
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
				System.out.println("접속 종료 실패");
			}
		}
		return cnt;
	}
	
	public int updateProduct(MultipartRequest multi) {
		int cnt = -1;

		PreparedStatement ps = null;

		try {
			// 3. SQL 작상 및 분석
			String sql = "update product set lcno=?, scno=?, name=?, oriprice=?, discprice=?, info=?, mainimgn=? where no=?";
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, Integer.parseInt(multi.getParameter("selLargeCategory")));
			ps.setInt(2, Integer.parseInt(multi.getParameter("selSmallCategory")));
			ps.setString(3, multi.getParameter("name"));
			ps.setInt(4, Integer.parseInt(multi.getParameter("oriprice")));
			ps.setInt(5, Integer.parseInt(multi.getParameter("discprice")));
			ps.setString(6, multi.getParameter("info"));
			
			if(multi.getFilesystemName("mainImg") == null) {
				ps.setString(7, multi.getParameter("beforeMainImg"));
			}else {
				ps.setString(7, multi.getFilesystemName("mainImg"));
			}
			
			
			ps.setInt(8, Integer.parseInt(multi.getParameter("pno")));

			// 4. SQL문 실행
			cnt = ps.executeUpdate();

		} catch (SQLException e) {
			System.out.println(e);
			System.out.println("updateProduct() SQL문 실행중 오류 발생");
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
				System.out.println("접속 종료 실패");
			}
		}
		return cnt;
	}
}
