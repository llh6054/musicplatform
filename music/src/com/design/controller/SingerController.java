package com.design.controller;


import java.io.IOException;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.design.entity.Singer;
import com.design.service.MusicService;
import com.design.service.SingerService;
import com.design.util.PageModel;

@Controller
@RequestMapping("singer")
public class SingerController extends ConfigController{
	
	@Resource(name="singer")
	Singer singer;
	
	@Resource(name="singerService")
	SingerService singerService;
	

	@Resource(name="musicService")
	MusicService musicService;
	
	
	/**
	 * 后台获取歌手列表
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/admin_singer_operate") 
	public String musicPage(HttpServletRequest request) {
		String inputInfo = request.getParameter("inputinfo");
		//System.out.print(inputInfo);
		if (request.getParameter("offset") != null) {
			offset = Integer.parseInt(request.getParameter("offset"));
			System.out.println(offset);
		}
		int pageSize = 10;
		PageModel model = this.singerService.findSinger(offset, pageSize, inputInfo);
		request.setAttribute("model", model);
//		System.out.println(model.getEntityList().get(0));
		
		return "admin/admin_singer_operate";
	}
	
	
	/**
	 * 完善歌手信息
	 * 
	 * @param request
	 * @param singer
	 * @return
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping("/admin_singer_addinfo")
	public String addMusicInfo(HttpServletRequest request, Singer singerInfo) throws IllegalStateException, IOException {
		String action = request.getParameter("action");
		if(action == "" || action == null) {
			int singerId = Integer.parseInt(request.getParameter("singerid"));	
			singer = (Singer) singerService.findObjectById(Singer.class, singerId);
			request.setAttribute("singerinfo", singer);
			return "admin/admin_singer_addinfo";
		}else {
			String imgUrl = null;
			CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
			if(multipartResolver.isMultipart(request)) {
				@SuppressWarnings("deprecation")
				String path = request.getRealPath("/")+"images\\singer\\";
				imgUrl = singerService.uploadFile(path, request, 1);
				//imgUrl = singerService.uploadFile("E:\\workspace\\GraduateDesign\\WebContent\\images\\singer\\", request);
			}
			singer.setGender(singerInfo.getGender());
			singer.setSingerInfo(singerInfo.getSingerInfo());
			singer.setImg(imgUrl);
			long now = new Date().getTime();
			singer.setUpdateTime(now);
			
			singerService.updateObject(singer);
			return "redirect:/singer/admin_singer_operate";
		}	
	}
	
	/**
	 * 删除歌手--逻辑删除
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("admin_delSinger")
	public String delMusic(HttpServletRequest request) {
		int singerId = Integer.parseInt(request.getParameter("singerid"));
		singerService.delete("Singer", singerId);
		return "redirect:/singer/admin_singer_operate";
	}
	
	
	
	/**
	 * 前台歌手列表
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("singer") 
	public String singer(HttpServletRequest request) {
		if (request.getParameter("offset") != null) {
			offset = Integer.parseInt(request.getParameter("offset"));
		}
		request.setAttribute("singer", singerService.findSinger(offset, 8, null));
		return "musicPage/singer";
	}
	
	/**
	 * 歌手主页
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("singerMain")
	public String singerMain(HttpServletRequest request) {
		int offset = 0;
		int pageSize = 10;
		if (request.getParameter("offset") != null) {
			offset = Integer.parseInt(request.getParameter("offset"));
		}
		singer = (Singer) singerService.findObjectById(Singer.class, Integer.parseInt(request.getParameter("id")));
		request.setAttribute("singerinfo", singer);
		PageModel model = musicService.findMusic(offset, pageSize, singer.getSingerName());
		request.setAttribute("model", model);
		return "/musicPage/singer_main";
	}
}
