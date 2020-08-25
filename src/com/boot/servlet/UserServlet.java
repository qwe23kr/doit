package com.boot.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boot.service.UserService;
import com.boot.service.impl.UserServiceImpl;
import com.boot.vo.UserInfoVO;
import com.google.gson.Gson;

@WebServlet("/ajax/user")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private Gson gson = new Gson();   
    private UserService userService = new UserServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getParameter("cmd");
		Map<String,Object> result = new HashMap<>();
		if("checkID".equals(cmd)) {
			String uiId = request.getParameter("uiId");
			result.put("result", userService.checkUserId(uiId));
		}else if("list".equals(cmd)) {
			result.put("list", userService.selectUserList(null));
		}
		PrintWriter pw = response.getWriter();
		pw.println(gson.toJson(result));
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BufferedReader br = request.getReader();
		String str;
		StringBuffer sb = new StringBuffer();
		while((str=br.readLine())!=null) {
			sb.append(str);
		}
		UserInfoVO user = gson.fromJson(sb.toString(), UserInfoVO.class);
		System.out.println(user);
		Map<String,Object> result = new HashMap<>();
		
		if("login".equals(user.getCmd())) {
			result.put("result", userService.doLogin(user, request.getSession()));
		}else if("signup".equals(user.getCmd())) {
			result.put("result", userService.insertUser(user));
		}else if("logout".equals(user.getCmd())) {
			request.getSession().invalidate();
			result.put("result", true);
		}else if("modify".equals(user.getCmd())) {
			result.put("result", userService.updateUser(user, request.getSession()));
		}else if("deleteAccount".equals(user.getCmd())) {
			result.put("result", userService.deleteUser(user, request.getSession()));
		}else if("deleteUsers".equals(user.getCmd())) {
			result.put("result", userService.deleteUsers(user.getUiNums()));
		}
		
		String json = gson.toJson(result);
		PrintWriter pw = response.getWriter();
		pw.println(json);
	}

}



