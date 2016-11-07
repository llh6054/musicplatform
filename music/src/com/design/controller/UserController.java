package com.design.controller;

import java.io.IOException;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.design.entity.User;
import com.design.entity.UserMusic;
import com.design.service.UserService;
import com.design.util.PageModel;

@Controller
@RequestMapping("user")
public class UserController extends ConfigController{
	
	@Resource(name="userService")
	UserService userService;
	
	@Resource(name="userMusic")
	UserMusic userMusic;
	
	/**
	 * 注册
	 * 
	 * @param request
	 * @param user
	 * @return
	 */
	@RequestMapping("register")
	public String register(HttpServletRequest request, User user) {
		System.out.println("enter register");
		String action = request.getParameter("action");
		if(action == null || action =="") {  //进入注册页面
			return "musicPage/register";
		}
		if(userService.addUser(user)) { //注册成功
			request.setAttribute("result", 1);
			return "redirect:/home/indexList";
		}else{ //注册失败
			request.setAttribute("result", 0);
			return "musicPage/failed";
		}
	}
	
	
	/**
	 * 登陆
	 * 
	 * @param request
	 * @param response
	 * @param user
	 * @return
	 */
	@RequestMapping("login")
	public String login(HttpServletRequest request, HttpServletResponse response, User user) {
		String action = request.getParameter("action");
		System.out.println(action);
		if(action == "" || action == null) {	//	进入登陆界面
			return "musicPage/user_login";
		}else {	//登陆
			User currentUser = userService.userLogin(user.getUserName(), user.getPassword());
			
			if( currentUser != null){	//登陆成功			
				HttpSession session = request.getSession();
				session.setAttribute("currentUserName", currentUser.getUserName());
				session.setAttribute("currentUserId", currentUser.getId());
				try {
					response.getWriter().write("1");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else { //登陆失败
				try {
					response.getWriter().write("0");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return null;
		
	}
	
	/**
	 * 注销
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("logout")
	public String logout(HttpServletRequest request) {	
		HttpSession session = request.getSession();
		session.removeAttribute("currentUserName");
		return "redirect:/home/index";
	}
	
	
	/**
	 * 后台用户操作
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("admin_user_operate")
	public String userOperate(HttpServletRequest request) {
		String inputInfo = request.getParameter("inputinfo");
		System.out.print(inputInfo);
		int offset = 0;//开始
		int pageSize = 10;// 每页个数
		if (request.getParameter("offset") != null) {
			offset = Integer.parseInt(request.getParameter("offset"));
		}
		PageModel model = userService.findUser(offset, pageSize, inputInfo);
		request.setAttribute("model", model);
		
		return "admin/admin_user_operate";
	}
	
	/**
	 * 后台禁用用户
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("delUser")
	public String delList(HttpServletRequest request) {
		userService.delete("User", Integer.parseInt(request.getParameter("id")));
		return "redirect:/user/admin_user_operate";
		
	}
	
	/**
	 * 后台启用用户
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("awakeUser")
	public String awakeUser(HttpServletRequest request) {
		userService.awakeUser(Integer.parseInt(request.getParameter("id")));
		return "redirect:/user/admin_user_operate";
	}
	
	/**
	 * 收藏歌曲
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("collectMusic")
	public String collectMusic(HttpServletRequest request) {
		userMusic.setAddTime(new Date());
		userMusic.setSongId(Integer.parseInt(request.getParameter("musicid")));
		userMusic.setUserid(Integer.parseInt(request.getParameter("userid")));
		userService.saveUserMusic(userMusic);
		return null;
	}
	
	/**
	 * 取消收藏歌曲
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("cancelCollectMusic")
	public String cancelCollectMusic(HttpServletRequest request) {
		userMusic = userService.getSingletonUserMusic(Integer.parseInt(request.getParameter("musicid")), Integer.parseInt(request.getParameter("userid")));
		userService.delete("UserMusic", userMusic.getId());
		return null;
	}
}
