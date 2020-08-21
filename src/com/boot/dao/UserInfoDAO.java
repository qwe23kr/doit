package com.boot.dao;

import java.util.List;

import com.boot.vo.UserInfoVO;

public interface UserInfoDAO {
	int insertUser(UserInfoVO user);
	int deleteUser(UserInfoVO user);
	int updateUser(UserInfoVO user);
	UserInfoVO selectUser(UserInfoVO user);
	UserInfoVO selectUserById(String uiId);
	UserInfoVO selectUserForLogin(UserInfoVO user);
	List<UserInfoVO> selectUserList(UserInfoVO user);
}