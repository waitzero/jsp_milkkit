package cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CartPro {
	private static CartPro instance = new CartPro();
	public static CartPro getInstance() {
		return instance;
	}
	private CartPro() {}
	
	
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
	
	public void insertCart(CartBean cart) {
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "";
		try {
			sql = "insert into cart values(null, ?, ?, ?, ?, ?, ?)";
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, cart.getBuyer());
			ps.setInt(2, cart.getKit_id());
			ps.setString(3, cart.getKit_title());
			ps.setInt(4, cart.getBuy_price());
			ps.setByte(5, cart.getBuy_count());
			ps.setString(6, cart.getKit_img());
			ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			resourceClose(ps, conn);
		}
	}
	
	public int getListCount(String buyer) {
		int x = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "";
		try {
			sql = "select count(*) from cart where buyer = ?";
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, buyer);
			rs = ps.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			resourceClose(rs, ps, conn);
		}
		return x;
	}
	
	public List<CartBean> getCart(String id) {
		List<CartBean> lists = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "";
		CartBean cart = null;
		
		try {
			sql = "select * from cart where buyer = ?";
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			lists = new ArrayList<CartBean>();
			while(rs.next()) {
				cart = new CartBean();
				cart.setCart_id(rs.getInt("cart_id"));
				cart.setKit_id(rs.getInt("kit_id"));
				cart.setKit_title(rs.getString("kit_title"));
				cart.setBuy_price(rs.getInt("buy_price"));
				cart.setBuy_count(rs.getByte("buy_count"));
				cart.setKit_img(rs.getString("kit_img"));
				lists.add(cart);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			resourceClose(rs, ps, conn);
		}
		return lists;
	}
	
	public void updateCount(int cart_id, byte count) {
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "";
		try {
			conn = getConnection();
			sql = "update cart set buy_count=? where cart_id=?";
			ps = conn.prepareStatement(sql);
			ps.setByte(1, count);
			ps.setInt(2, cart_id);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			resourceClose(ps, conn);
		}
	}
	
	public void deleteAll(String buyer) {
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "";
		try {
			conn = getConnection();
			sql = "delete from cart where buyer = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1,  buyer);
			ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			resourceClose(ps, conn);
		}
	}
	
	public void deleteList(int cart_id) { 
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "";
		try {
			conn = getConnection();
			sql = "delete from cart where cart_id = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1,  cart_id);
			ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			resourceClose(ps, conn);
		}
	}
}
