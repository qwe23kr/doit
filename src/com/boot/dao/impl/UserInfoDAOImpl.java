package com.boot.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.eclipse.jdt.internal.compiler.batch.Main;

import com.boot.dao.UserInfoDAO;
import com.boot.servlet.InitServlet;
import com.boot.vo.UserInfoVO;

public class UserInfoDAOImpl implements UserInfoDAO {


	@Override
	public int insertUser(UserInfoVO user) {
		String sql = "insert into user_info(UI_NUM,\r\n" + 
				"UI_NAME,\r\n" + 
				"UI_AGE,\r\n" + 
				"UI_BIRTH,\r\n" + 
				"UI_ID,\r\n" + 
				"UI_PASSWORD,\r\n" + 
				"UI_PHONE,\r\n" + 
				"UI_EMAIL,\r\n" + 
				"UI_CREDAT,\r\n" + 
				"UI_NICKNAME)VALUES(\r\n" + 
				"seq_ui_num.nextval,?,?,?,?,?,?,?,\r\n" + 
				"sysdate,?)";
		
		Connection con=null;
		PreparedStatement ps= null;
		
		
		try {
			con=InitServlet.getConnection();
			ps= con.prepareStatement(sql);
			ps.setString(1,user.getUiName());
			ps.setInt(2,user.getUiAge());
			ps.setString(3,user.getUiBirth().replace("-",""));
			ps.setString(4,user.getUiId());
			ps.setString(5,user.getUiPassword());
			ps.setString(6,user.getUiPhone());
			ps.setString(7,user.getUiEmail());
			ps.setString(8,user.getUiNickname());
			int cnt= ps.executeUpdate();
			con.commit();
			return cnt;
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			InitServlet.close(ps, con);
		}
		return 0;
	}

	@Override
	public int deleteUser(UserInfoVO user) {
		String sql = "delete from user_info where ui_num=?";
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = InitServlet.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, user.getUiNum());
			int cnt = ps.executeUpdate();
			con.commit();
			return cnt;
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			InitServlet.close(ps, con);
		}
		return 0;
	}

	@Override
	public int updateUser(UserInfoVO user) {
		String sql="update user_info\r\n" + 
				"set ui_name=?,\r\n" + 
				"UI_AGE=?,\r\n" + 
				"UI_BIRTH=?,\r\n" + 
				"UI_PASSWORD=?,\r\n" + 
				"UI_PHONE=?,\r\n" + 
				"UI_EMAIL=?,\r\n" + 
				"UI_NICKNAME=?\r\n" + 
				"where UI_NUM=?";
	
		Connection con=null;
		PreparedStatement ps= null;
		
		
		try {
			con=InitServlet.getConnection();
			ps= con.prepareStatement(sql);
			ps.setString(1,user.getUiName());
			ps.setInt(2,user.getUiAge());
			ps.setString(3,user.getUiBirth().replace("-",""));
			ps.setString(4,user.getUiPassword());
			ps.setString(5,user.getUiPhone());
			ps.setString(6,user.getUiEmail());
			ps.setString(7,user.getUiNickname());
			ps.setInt(8,user.getUiNum());
			
			int cnt= ps.executeUpdate();
			con.commit();
			return cnt;
			} catch (SQLException e) {
				
				e.printStackTrace();
			}finally {
				InitServlet.close(ps, con);
			}
			return 0;
		}
	@Override
	public UserInfoVO selectUser(UserInfoVO user) {
		String sql = "select * from user_info where ui_num=?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = InitServlet.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, user.getUiNum());
			rs = ps.executeQuery();
			if (rs.next()) {
				UserInfoVO ui = new UserInfoVO();
				ui.setUiNum(rs.getInt("ui_num"));
				ui.setUiName(rs.getString("ui_name"));
				ui.setUiAge(rs.getInt("ui_age"));
				ui.setUiId(rs.getString("ui_id"));
				ui.setUiBirth(rs.getString("ui_birth"));
				ui.setUiPhone(rs.getString("ui_phone"));
				ui.setUiNickname(rs.getString("ui_nickname"));
				ui.setUiCredat(rs.getString("ui_credat"));
				ui.setUiEmail(rs.getString("ui_email"));
				ui.setUiAdmin(rs.getString("ui_admin"));
				return ui;
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			InitServlet.close(rs, ps, con);
		}
		return null;
	}

	@Override
	public List<UserInfoVO> selectUserList(UserInfoVO user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserInfoVO selectUserForLogin(UserInfoVO user) {
		String sql = "select * from user_info where ui_id=? and ui_password=?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = InitServlet.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, user.getUiId());
			ps.setString(2, user.getUiPassword());
			rs = ps.executeQuery();
			if (rs.next()) {
				UserInfoVO ui = new UserInfoVO();
				ui.setUiNum(rs.getInt("ui_num"));
				ui.setUiName(rs.getString("ui_name"));
				ui.setUiAge(rs.getInt("ui_age"));
				ui.setUiId(rs.getString("ui_id"));
				ui.setUiBirth(rs.getString("ui_birth"));
				ui.setUiPhone(rs.getString("ui_phone"));
				ui.setUiNickname(rs.getString("ui_nickname"));
				ui.setUiCredat(rs.getString("ui_credat"));
				ui.setUiEmail(rs.getString("ui_email"));
				ui.setUiAdmin(rs.getString("ui_admin"));
				ui.setUiPassword(rs.getString("ui_password"));
					
				return ui;
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			InitServlet.close(rs, ps, con);
		}
		return null;
	}

	@Override
	public UserInfoVO selectUserById(String uiId) {
		String sql = "select * from user_info where ui_id=?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = InitServlet.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, uiId);
			rs = ps.executeQuery();
			if (rs.next()) {
				UserInfoVO ui = new UserInfoVO();
				ui.setUiNum(rs.getInt("ui_num"));
				ui.setUiName(rs.getString("ui_name"));
				ui.setUiAge(rs.getInt("ui_age"));
				ui.setUiId(rs.getString("ui_id"));
				ui.setUiBirth(rs.getString("ui_birth"));
				ui.setUiPhone(rs.getString("ui_phone"));
				ui.setUiNickname(rs.getString("ui_nickname"));
				ui.setUiCredat(rs.getString("ui_credat"));
				ui.setUiEmail(rs.getString("ui_email"));
				return ui;
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			InitServlet.close(rs, ps, con);
		}
		return null;
	}

}