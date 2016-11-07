package com.design.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Iterator;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.design.entity.MusicList;
import com.design.service.MusicListService;
import com.design.util.PageModel;

@Controller
@RequestMapping("musicList")
public class MusicListController extends ConfigController{
	
	
	@Resource(name="listService")
	MusicListService listService;
	
	@Resource(name="musicList")
	MusicList musicList;
	
	/**
	 * 添加歌单
	 * 
	 * @param request
	 * @param list
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping("admin_musiclist_add")
	public String addList(HttpServletRequest request, MusicList list) throws IllegalStateException, IOException {
		if(request.getParameter("action") == null) {	//进入添加歌单页面
			return "admin/admin_musiclist_add";
		}	
		//添加歌单
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
		if(multipartResolver.isMultipart(request)) {
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			Iterator<String> iter = multiRequest.getFileNames();
			while(iter.hasNext()) {
				MultipartFile file = multiRequest.getFile((String)iter.next());
				if(file != null) {
					String fileOriginalName = file.getOriginalFilename();
					long now = new Date().getTime();   
					@SuppressWarnings("deprecation")
					String path = request.getRealPath("/") + "images\\list\\" + fileOriginalName;
					System.out.println(fileOriginalName);
					File localFile = new File(path);
					file.transferTo(localFile);
					String image = "images/list/" + fileOriginalName;
					//insert list record 	
					list.setAddTime(now);
					list.setImage(image);
					listService.addList(list);
				}
			}
		}
		return "redirect:/musicList/admin_musiclist_operate";
	}
	
	
	/**
	 * 歌单操作后台主页
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("admin_musiclist_operate")
	public String admin_musiclist_operate(HttpServletRequest request) {
		String inputInfo = request.getParameter("inputinfo");
		System.out.print(inputInfo);
		int offset = 0;//开始
		int pageSize = 10;// 每页个数
		if (request.getParameter("offset") != null) {
			offset = Integer.parseInt(request.getParameter("offset"));
		}
		PageModel model = this.listService.findList(offset, pageSize, inputInfo);
		request.setAttribute("model", model);
		return "admin/admin_musiclist_operate";
	}
	
	/**
	 * 前台歌单展示
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("list")
	public String list(HttpServletRequest request) {
		int pageSize = 12;
		if(request.getParameter("offset") != null) {
			offset = Integer.parseInt(request.getParameter("offset"));
		}
		PageModel model = this.listService.findList(offset, pageSize, null);
		request.setAttribute("list", model);
		return "musicPage/music_list";
	}
	
	
	/**
	 * 后台删除歌单--逻辑删除
	 * 
	 * @param request
	 * @return
	 */
	
	@RequestMapping("delList")
	public String delList(HttpServletRequest request) {
		listService.delete("MusicList", Integer.parseInt(request.getParameter("id")));
		return "redirect:/musicList/admin_musiclist_operate";
		
	}
	
	
	/**
	 * 后台修改歌单
	 * 
	 * @param request
	 * @param list
	 * @return
	 */
	@RequestMapping("admin_musiclist_update") 
	public String updateList(HttpServletRequest request, MusicList list) {
		if(request.getParameter("action") == null) {
			musicList = (MusicList) listService.findObjectById(MusicList.class, Integer.parseInt(request.getParameter("listid")));
			request.setAttribute("listinfo", musicList);
			return "admin/admin_musiclist_update";
		}
		//String id = request.getParameter("id");
		musicList = (MusicList) listService.findObjectById(MusicList.class, list.getId());
		musicList.setUpdateTime(new Date().getTime());
		musicList.setListDesc(list.getListDesc());
		musicList.setListName(list.getListName());
		musicList.setListType(list.getListType());
		listService.updateObject(musicList);
		return "redirect:/musicList/admin_musiclist_operate";
	}
	
	
	
}	
