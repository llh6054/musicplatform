package com.design.controller;



import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.design.entity.User;
import com.design.service.MusicListService;
import com.design.service.MusicService;
import com.design.util.PageModel;





@Controller
@RequestMapping("/home")
public class HomeController extends ConfigController{
	
	
	

	@Resource(name="listService")
	MusicListService listService;
	

	@Resource(name="musicService")
	MusicService musicService;
	
	/**
	 * 主页
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/index") 
	public String index(HttpServletRequest request) {
		return "index";
	}
	
	/**
	 * 主页展示部分
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/indexList")
	public String indexList(HttpServletRequest request) {
		PageModel listPage = listService.findList(offset, pageSize, null);
		PageModel lateestPage = musicService.findLatestMusic(offset, pageSize);
		PageModel hottestPage = musicService.findHottestMusic(offset, pageSize);
		request.setAttribute("listPage", listPage);
		request.setAttribute("hottestPage", hottestPage);
		request.setAttribute("latestPage", lateestPage);
		return "musicPage/music";
	}
	
	/**
	 * 后台主页
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/admin") 
	public String admin(HttpServletRequest request) {	
		return "admin/admin_menu"; 
	}
	
	
	/**
	 * 登陆
	 * 
	 * @param request
	 * @param response
	 * @param user
	 * @return
	 */
	@RequestMapping("admin_login")
	public String login(HttpServletRequest request, HttpServletResponse response, User user) {
		String action = request.getParameter("action");
		System.out.println(action);
		if(action == "" || action == null) {	//	进入登陆界面
			return "admin/admin_login";
		}else {	//登陆
				if(user.getUserName().equals("lailonghui") && user.getPassword().equals("123456")){
					HttpSession session = request.getSession();
					session.setAttribute("currentAdmin", "lailonghui");
					try {
						response.getWriter().write("1");
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
				else { //登陆失败
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
	 * 清除session
	 */
	@RequestMapping("/destroySession")
	public void destroySession(HttpServletRequest request) {
		String sessionName1 = request.getParameter("sessionName1");
		String sessionName2 = request.getParameter("sessionName2");
		System.out.println(sessionName1);
		HttpSession session = request.getSession();
		session.removeAttribute(sessionName1);
		session.removeAttribute(sessionName2);
	}
	
	
}
