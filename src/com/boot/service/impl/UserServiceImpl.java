package com.boot.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.boot.dao.UserInfoDAO;
import com.boot.dao.impl.UserInfoDAOImpl;
import com.boot.listener.SessionListener;
import com.boot.service.UserService;
import com.boot.servlet.InitServlet;
import com.boot.vo.UserInfoVO;

public class UserServiceImpl implements UserService {
	private UserInfoDAO udao = new UserInfoDAOImpl();
	
	@Override
	public int insertUser(UserInfoVO user) {
		if(udao.selectUserById(user.getUiId())!=null) {
			return -1;
		}
		return udao.insertUser(user);
	}

	@Override
	public int deleteUser(UserInfoVO user,HttpSession hs) {
		UserInfoVO sUser = (UserInfoVO)hs.getAttribute("user");
		if(sUser.getUiPassword().equals(user.getUiPassword())) {
			int cnt = udao.deleteUser(sUser);
			if(cnt==1) {
				hs.invalidate();
			}
			return cnt;
		}
		return -1;
	}

	@Override
	public int updateUser(UserInfoVO user,HttpSession hs) {
		int cnt = udao.updateUser(user);
		if(cnt==1) {
			hs.setAttribute("user", udao.selectUser(user));
		}
		return cnt;
	}

	@Override
	public UserInfoVO selectUser(UserInfoVO user) {
		return udao.selectUser(user);
	}


	@Override
	public List<UserInfoVO> selectUserList(UserInfoVO user) {
		return udao.selectUserList(user);
	}

	@Override
	public boolean doLogin(UserInfoVO user, HttpSession hs) {
		user = udao.selectUserForLogin(user);
		if(user!=null) {
			SessionListener.checkUserId(user.getUiId());
			hs.setAttribute("user", user);
			return true;
		}
		return false;
	}
	@Override
	public boolean checkUserId(String uiId) {
		UserInfoVO user = udao.selectUserById(uiId);
		if(user==null) {
			return true;
		}
		return false;
	}
	public static void main(String[] args) {
		InitServlet is = new InitServlet();
		is.init();
		UserService us = new UserServiceImpl();
		System.out.println(us.selectUserList(null));
	}

	@Override
	public int deleteUsers(int[] uiNums) {
		for(int uiNum:uiNums) {
			UserInfoVO ui = new UserInfoVO();
			ui.setUiNum(uiNum);
			udao.deleteUser(ui);
		}
		return uiNums.length;
	}
}
