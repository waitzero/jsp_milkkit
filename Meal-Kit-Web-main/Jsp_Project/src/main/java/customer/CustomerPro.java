package customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import customer.CustomerBean;
import manager.KitBean;

public class CustomerPro {
	private static CustomerPro instance = new CustomerPro();
	public static CustomerPro getInstance() {
		return instance;
	}
	private CustomerPro() {}
	
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/teamProject");
		return ds.getConnection();
	}
	
	public static void resourceClose(ResultSet rset, Statement stmt, Connection conn) {
		try {
			if (rset != null) rset.close();
			if (stmt != null) stmt.close();
			if (conn != null) conn.close();
		} catch (SQLException sqlerr) {
			System.out.println("데이터베이스 종료 오류!" + sqlerr.getMessage());
		}	   
	}
	
	public static void resourceClose(Statement stmt, Connection conn) {
		try {
			if (stmt != null) stmt.close();
			if (conn != null) conn.close();
		} catch (SQLException sqlerr) {
			System.out.println("데이터베이스 종료 오류!" + sqlerr.getMessage());
		}	  
	}
	
	public void insertMember(CustomerBean customer) {
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "";
		try {
			sql = "insert into member values(?, ?, ?, ?, ?, ?, ?)";
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, customer.getId());
			ps.setString(2, customer.getPasswd());
			ps.setString(3, customer.getName());
			ps.setTimestamp(4, customer.getReg_date());
			ps.setString(5, customer.getAddress());
			ps.setString(6, customer.getTel());
			ps.setString(7, customer.getAllergy());
			ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			resourceClose(ps, conn);
		}
	}
	
	public int userCheck(String id, String passwd) {
		int x = -1;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "";
		try {
			sql = "select passwd from member where id = ?";
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				if(rs.getString("passwd").equals(passwd)) {
					x = 1; // 인증 성공
				} else {
					x = 0; // 인증 실패(비밀번호 오류)
				}
			} else {
				x = -1; // 아이디 없음
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			resourceClose(rs, ps, conn);
		}
		return x;
	}
	
	public CustomerBean getMember(String id) {
		CustomerBean member = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = null;
		try {
			conn = getConnection();
			sql = "select * from member where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1,  id);
			rs = ps.executeQuery();
			if(rs.next()){
				member = new CustomerBean();
				member.setId(rs.getString("id"));
				member.setPasswd(rs.getString("passwd"));
				member.setName(rs.getString("name"));
				member.setAddress(rs.getString("address"));
				member.setTel(rs.getString("tel"));
				member.setAllergy(rs.getString("allergy"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			resourceClose(rs, ps, conn);
		}
		return member;
	}
	
	public void deleteUser(String userId)throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;		
		
		try {
			conn = getConnection();		
			ps = conn.prepareStatement("delete from member where id=?");
			ps.setString(1, userId);	
			ps.executeUpdate();		
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			resourceClose(ps, conn);
		}
	}
	
	public void updateUser(CustomerBean customer, String id) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		String sql;
		
		try {
			conn = getConnection();
			
			sql = "update member set id=?, passwd=?, name=?, address=?, tel=?, allergy=? where id=?";
			
			ps = conn.prepareStatement(sql);			
			ps.setString(1, customer.getId());
			ps.setString(2, customer.getPasswd());
			ps.setString(3, customer.getName());
			ps.setString(4, customer.getAddress());
			ps.setString(5, customer.getTel());
			ps.setString(6, customer.getAllergy());
			ps.setString(7, id);
			ps.executeUpdate();		
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			resourceClose(ps, conn);
		}
	}
	
	public void insertAccount(String account, String bank, String name) {
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "";
		try {
			sql = "insert into bank values(?, ?, ?)";
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, account);
			ps.setString(2, bank);
			ps.setString(3, name);
			ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			resourceClose(ps, conn);
		}
	}
}
