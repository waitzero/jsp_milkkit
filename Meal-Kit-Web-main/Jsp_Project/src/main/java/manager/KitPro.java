package manager;

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

public class KitPro {
	private static KitPro instance = new KitPro();
	public static KitPro getInstance() {
		return instance;
	}
	private KitPro() {}
	
	
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
	
	public int managerCheck(String id, String passwd) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = -1;
		
		try {
			conn = getConnection();
			String sql = "select managerPassword from manager where managerId = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				dbpasswd = rs.getString("managerPassword");
				if (dbpasswd.equals(passwd))
					x = 1; // 패스워드와 일치하는 아이디가 있음
				else
					x = 0; // 패스워드와 일치하는 아이디가 없음
			}
			else
				x = -1;    // 해당하는 아이디가 없다
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			resourceClose(rs, ps, conn);
		}
		return x;
	}
	
	public void insertKit(KitBean kit) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = getConnection();
			String sql = "insert into kit values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, kit.getKit_id());
			ps.setString(2, kit.getKit_kind());
			ps.setString(3, kit.getKit_title());
			ps.setInt(4, kit.getKit_price());
			ps.setInt(5, kit.getKit_count());
			ps.setString(6, kit.getKit_img());
			ps.setString(7, kit.getKit_material());
			ps.setString(8, kit.getKit_how());
			ps.setString(9, kit.getKit_allergy());
			ps.setByte(10, kit.getDiscount_rate());
			ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			resourceClose(ps, conn);
		}
	}
	
	public int getkitCount() throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		int x = 0;
		try {
			conn = getConnection();
			ps = conn.prepareStatement("select count(*) from kit");
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
	
	public KitBean[] getKits(String kit_kind, int count) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		KitBean kitList[] = null;
		int i = 0;
		try {
			conn = getConnection();
			String sql = "select * from kit where kit_kind = ? order by kit_id limit ?, ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1,  kit_kind);
			ps.setInt(2,  0);
			ps.setInt(3,  count);
			rs = ps.executeQuery();
			if(rs.next()) {
				kitList = new KitBean[count];
				do {
					KitBean kit= new KitBean();			
					kit.setKit_id(rs.getInt("kit_id"));
					kit.setKit_kind(rs.getString("kit_kind"));
					kit.setKit_title(rs.getString("kit_title"));
					kit.setKit_price(rs.getInt("kit_price"));
					kit.setKit_count(rs.getInt("kit_count"));
					kit.setKit_img(rs.getString("kit_img"));
					kit.setKit_material(rs.getString("kit_material"));
					kit.setKit_how(rs.getString("kit_how"));
					kit.setKit_allergy(rs.getString("kit_allergy"));
					kit.setDiscount_rate(rs.getByte("discount_rate"));					
					kitList[i] = kit;
					i++;
				} while(rs.next());
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			resourceClose(rs, ps, conn);
		}
		return kitList;
	}
	
	public List<KitBean> getKits(String kit_kind) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<KitBean> kitList=null;
		try {
			conn = getConnection();			
			String sql1 = "select * from kit";
			String sql2 = "select * from kit where kit_kind = ? order by kit_price desc";
			if(kit_kind.equals("all")){
				ps = conn.prepareStatement(sql1);
			}else{
				ps = conn.prepareStatement(sql2);
				ps.setString(1, kit_kind);
			}
			rs = ps.executeQuery();
			if (rs.next()) {
				kitList = new ArrayList<KitBean>();
				do {
					KitBean kit= new KitBean();			
					kit.setKit_id(rs.getInt("kit_id"));
					kit.setKit_kind(rs.getString("kit_kind"));
					kit.setKit_title(rs.getString("kit_title"));
					kit.setKit_price(rs.getInt("kit_price"));
					kit.setKit_count(rs.getInt("kit_count"));
					kit.setKit_img(rs.getString("kit_img"));
					kit.setKit_material(rs.getString("kit_material"));
					kit.setKit_how(rs.getString("kit_how"));
					kit.setKit_allergy(rs.getString("kit_allergy"));
					kit.setDiscount_rate(rs.getByte("discount_rate"));					
					kitList.add(kit);
				} while(rs.next());
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			resourceClose(rs, ps, conn);
		}
		return kitList;
	}
	
	public List<KitBean> getKits(String kit_kind, int startRow, int endRow) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<KitBean> kitList=null;
		try {
			conn = getConnection();
			String sql1 = "select * from (select @rownum:=@rownum+1 as rn, a.* from (select * from kit order by kit_id desc) a, (select @rownum:=0) tmp) a where rn between ? and ?";
			String sql2 = "select * from (select @rownum:=@rownum+1 as rn, a.* from (select * from kit order by kit_id desc) a, (select @rownum:=0) tmp) a where rn between ? and ? and kit_kind = ?";
			if(kit_kind.equals("all")){
				ps = conn.prepareStatement(sql1);
				ps.setInt(1, startRow);
				ps.setInt(2, endRow);
			}else{
				ps = conn.prepareStatement(sql2);
				ps.setInt(1, startRow);
				ps.setInt(2, endRow);
				ps.setString(3, kit_kind);
			}
			rs = ps.executeQuery();
			if (rs.next()) {
				kitList = new ArrayList<>();
				do {
					KitBean kit= new KitBean();			
					kit.setKit_id(rs.getInt("kit_id"));
					kit.setKit_kind(rs.getString("kit_kind"));
					kit.setKit_title(rs.getString("kit_title"));
					kit.setKit_price(rs.getInt("kit_price"));
					kit.setKit_count(rs.getInt("kit_count"));
					kit.setKit_img(rs.getString("kit_img"));
					kit.setKit_material(rs.getString("kit_material"));
					kit.setKit_how(rs.getString("kit_how"));
					kit.setKit_allergy(rs.getString("kit_allergy"));
					kit.setDiscount_rate(rs.getByte("discount_rate"));					
					kitList.add(kit);
				} while(rs.next());
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			resourceClose(rs, ps, conn);
		}
		return kitList;
	}
	
	public KitBean getKit(int kitId) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		KitBean kit = null;
		try {
			conn = getConnection();
			ps = conn.prepareStatement("select * from kit where kit_id = ?");
			ps.setInt(1,  kitId);
			rs= ps.executeQuery();
			
			if(rs.next()) {
				kit = new KitBean();					
				kit.setKit_id(rs.getInt("kit_id"));
				kit.setKit_kind(rs.getString("kit_kind"));
				kit.setKit_title(rs.getString("kit_title"));
				kit.setKit_price(rs.getInt("kit_price"));
				kit.setKit_count(rs.getInt("kit_count"));
				kit.setKit_img(rs.getString("kit_img"));
				kit.setKit_material(rs.getString("kit_material"));
				kit.setKit_how(rs.getString("kit_how"));
				kit.setKit_allergy(rs.getString("kit_allergy"));
				kit.setDiscount_rate(rs.getByte("discount_rate"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			resourceClose(rs,  ps, conn);
		}
		return kit;
	}
	
	public void updateKit(KitBean kit, int kitId) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		String sql;
		
		try {
			conn = getConnection();
			
			sql = "update kit set kit_kind=?,kit_title=?";
			sql += ",kit_price=?,kit_count=?,kit_img=?,kit_material=?";
			sql += ",kit_how=?,kit_allergy=?,discount_rate=?";
			sql += " where kit_id=?";
			
			System.out.println(kit.getKit_img());
			ps = conn.prepareStatement(sql);			
			ps.setString(1, kit.getKit_kind());
			ps.setString(2, kit.getKit_title());
			ps.setInt(3, kit.getKit_price());
			ps.setInt(4, kit.getKit_count());
			ps.setString(5, kit.getKit_img());
			ps.setString(6, kit.getKit_material());
			ps.setString(7, kit.getKit_how());
			ps.setString(8, kit.getKit_allergy());
			ps.setByte(9, kit.getDiscount_rate());
			ps.setInt(10, kitId);			
			ps.executeUpdate();		
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			resourceClose(ps, conn);
		}
	}
	
	public void deleteKit(int kitId)throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;		
		
		try {
			conn = getConnection();		
			ps = conn.prepareStatement("delete from kit where kit_id=?");
			ps.setInt(1, kitId);			
			ps.executeUpdate();		
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			resourceClose(ps, conn);
		}
	}
}
