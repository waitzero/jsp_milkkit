package buy;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import cart.CartBean;

public class BuyPro {
	private static BuyPro instance = new BuyPro();
	public static BuyPro getInstance() {
		return instance;
	}
	private BuyPro() {}
	
	
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
	
	public int getListCount() {
		int x = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "";
		try {
			conn = getConnection();
			sql = "select count(*) from buy";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1);				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			resourceClose(rs, ps, conn);
		}
		return x;
	}
	
	public List<BuyBean> getBuyList() {
		List<BuyBean> lists = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		BuyBean buy = null;
		String sql = "";
		try {
			conn = getConnection();
			sql = "select * from buy";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			lists = new ArrayList<BuyBean>();
			
			while(rs.next()) {
				buy = new BuyBean();
				buy.setBuy_id(rs.getLong("buy_id"));
				buy.setBuyer(rs.getString("buyer"));
				buy.setKit_id(rs.getInt("kit_id"));
				buy.setKit_title(rs.getString("kit_title"));
				buy.setBuy_price(rs.getInt("buy_price"));
				buy.setBuy_count(rs.getByte("buy_count"));
				buy.setKit_img(rs.getString("kit_img"));
				buy.setBuy_date(rs.getTimestamp("buy_date"));
				buy.setAccount(rs.getString("account"));
				buy.setDeliveryName(rs.getString("deliveryName"));
				buy.setDeliveryTel(rs.getString("deliveryTel"));
				buy.setDeliveryAddress(rs.getString("deliveryAddress"));
				buy.setSanction(rs.getString("sanction"));
				lists.add(buy);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			resourceClose(rs, ps, conn);
		}
		
		return lists;
	}
	
	public List<String> getAccount(){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = null;
		List<String> accountList = null;
		try {
			conn = getConnection();
			sql = "select * from bank";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			accountList = new ArrayList<String>();
			while(rs.next()) {
				String account = new String(rs.getString("account") + " " + rs.getString("bank") + " " + rs.getString("name"));
				accountList.add(account);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			resourceClose(rs, ps, conn);
		}
		return accountList;
	}
	
	public void insertBuy(List<CartBean> lists, String id , String account, String deliveryName, String deliveryTel, String deliveryAddress) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = null;
		Timestamp reg_date = null;
		String todayDate;
		String tempDate;
		String maxDate = null;
		String number = null;
		long buyId = 0;
		int nowCount;
		
		try {
			conn = getConnection();
			reg_date = new Timestamp(System.currentTimeMillis());
			tempDate = reg_date.toString();
			todayDate = tempDate.substring(0, 4) + tempDate.substring(5, 7) + tempDate.substring(8, 10);
			sql = "select max(buy_id) from buy";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			if(rs.getLong(1) > 0) {
				Long val = rs.getLong(1);
				maxDate = val.toString().substring(0, 8); // 년도월일
				number = val.toString().substring(8); // 일련번호
				if(todayDate.equals(maxDate)) {
					if(Integer.parseInt(number)+1 < 10000) {
						buyId = Long.parseLong(maxDate + (Integer.parseInt(number)+1 + 10000));
					} else {
						buyId = Long.parseLong(maxDate + (Integer.parseInt(number)+1));
					}
				} else {
					todayDate += "00001";
					buyId = Long.parseLong(todayDate);
				}
			} else {
				todayDate += "00001";
				buyId = Long.parseLong(todayDate);
			} 
			
			conn.setAutoCommit(false);
			for (int i = 0; i < lists.size(); i++) {
				CartBean cart = lists.get(i);
				sql = "insert into buy values (?,?,?,?,?,?,?,?,?,?,?,?, null)";
				ps= conn.prepareStatement(sql);
				ps.setLong(1, buyId);
				ps.setString(2, id);
				ps.setInt(3, cart.getKit_id());
			    ps.setString(4, cart.getKit_title());
	            ps.setInt(5, cart.getBuy_price());
	            ps.setInt(6, cart.getBuy_count());
	            ps.setString(7, cart.getKit_img());
	            ps.setTimestamp(8, reg_date);
	            ps.setString(9, account);
                ps.setString(10, deliveryName);
                ps.setString(11, deliveryTel);
                ps.setString(12, deliveryAddress);
                ps.executeUpdate();
                ps.close();
                
                ps = conn.prepareStatement("select kit_count from kit where kit_id=?");
                ps.setInt(1, cart.getKit_id());
                rs = ps.executeQuery();
                rs.next();
                nowCount = (int)(rs.getInt(1) - cart.getBuy_count());
                ps.close();
                
                sql = "update kit set kit_count=? where kit_id=?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, nowCount);
                ps.setInt(2, cart.getKit_id());
                ps.executeUpdate(); 
			}
			
			// 장바구니 비우기
			ps = conn.prepareStatement("delete from cart where buyer=?");
			ps.setString(1, id);
			ps.executeUpdate();
			conn.commit();
			conn.setAutoCommit(true);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			resourceClose(rs, ps, conn);
		}
	}	
	
	public int getListCount(String id) {
		int x = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "";
		try {
			conn = getConnection();
			sql = "select count(*) from buy where buyer = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1);				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			resourceClose(rs, ps, conn);
		}
		return x;
	}
	
	public List<BuyBean> getBuyList(String id) {
		List<BuyBean> lists = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		BuyBean buy = null;
		String sql = "";
		try {
			conn = getConnection();
			sql = "select * from buy where buyer = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			lists = new ArrayList<BuyBean>();
			
			while(rs.next()) {
				buy = new BuyBean();
				buy.setBuy_id(rs.getLong("buy_id"));
				buy.setKit_id(rs.getInt("kit_id"));
				buy.setKit_title(rs.getString("kit_title"));
				buy.setBuy_price(rs.getInt("buy_price"));
				buy.setBuy_count(rs.getByte("buy_count"));
				buy.setKit_img(rs.getString("kit_img"));
				buy.setSanction(rs.getString("sanction"));
				lists.add(buy);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			resourceClose(rs, ps, conn);
		}
		
		return lists;
	}
}