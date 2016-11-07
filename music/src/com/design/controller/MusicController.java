package com.design.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.design.entity.Music;
import com.design.entity.Singer;
import com.design.service.MusicService;
import com.design.service.SingerService;
import com.design.util.PageModel;



@Controller
@RequestMapping("/music")
public class MusicController extends ConfigController{
	
	
	@Resource(name="musicService")
	MusicService musicService;
	
	@Resource(name="music")
	Music music;
	
	@Resource(name="singer")
	Singer singer;
	
	@Resource(name="singerService")
	SingerService singerService;
	
	
	/**
	 * 获取歌曲列表
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("admin_music_operate") 
	public String musicPage(HttpServletRequest request) {
		String inputInfo = request.getParameter("inputinfo");
		//System.out.print(inputInfo);
		if (request.getParameter("offset") != null) {
			offset = Integer.parseInt(request.getParameter("offset"));
			System.out.println(offset);
		}
		int pageSize = 10;
		PageModel model = this.musicService.findMusic(offset, pageSize, inputInfo);
		request.setAttribute("model", model);
		return "admin/admin_music_operate";
	}
	
	
	/**
	 * 添加、修改歌曲
	 * 
	 * @param request
	 * @param music
	 * @return
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping("/admin_add_music")
	public String addMusicInfo(HttpServletRequest request, Music musicInfo) throws IllegalStateException, IOException {
		String action = request.getParameter("action");
		if(action == "" || action == null) {	//进入添加、修改页面
			if(request.getParameter("musicid") != null) {	//进入修改页面
				int musicId = Integer.parseInt(request.getParameter("musicid"));
				music = (Music) musicService.findObjectById(Music.class, musicId);
				request.setAttribute("musicinfo", music);
				return "admin/admin_music_update";
			}	
			return "admin/admin_music_add";
		}else if(action.equals("add")){	//	添加
			musicService.uploadMusic(request, musicInfo);
		}else if(action.equals("update")) {
			music = (Music) musicService.findObjectById(Music.class, musicInfo.getId());	//找出当前music
			music.setAblum(musicInfo.getAblum());	//替换修改项
			music.setMusicInfo(musicInfo.getMusicInfo());
			music.setUpdateTime(new Date().getTime());
			musicService.updateObject(music);
		}
		return "redirect:/music/admin_music_operate";
	}
	
	/**
	 * 删除歌曲--逻辑删除
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("delMusic")
	public String delMusic(HttpServletRequest request) {
		int musicId = Integer.parseInt(request.getParameter("musicid"));
		musicService.delete("Music", musicId);
		return "redirect:/music/musicPage";
	}
	
	
	/**
	 * 主页新歌
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/lateMusic")
	public String lateMusic(HttpServletRequest request) {
		if (request.getParameter("offset") != null) {
			offset = Integer.parseInt(request.getParameter("offset"));
		}
		pageSize = 10;
		PageModel model = musicService.findLatestMusic(offset, pageSize);
		List<?> interestSinger = singerService.hotSinger();
		request.setAttribute("interestSinger", interestSinger);
		request.setAttribute("model", model);
		return "musicPage/billboard";
	}
	
	/**
	 * 我的音乐
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/myMusic")
	public String myMusic(HttpServletRequest request) {
		System.out.println("enter");
		HttpSession session = request.getSession();
		if(session.getAttribute("currentUserId") != null) {
//			Integer userId = (Integer) session.getAttribute("currentUserId");
			int offset = 0;
			int pageSize = 10;
			if(request.getParameter("offset") != null) {
				offset = Integer.parseInt(request.getParameter("offset"));
			}
			PageModel model = musicService.findMyCollectedMusic((Integer)session.getAttribute("currentUserId"), offset, pageSize);
			request.setAttribute("model", model);
		}
		return "musicPage/mymusic";
	}
	
	/**
	 * 我收藏的音乐
	 * @param request
	 * @return
	 */
	@RequestMapping("myCollectedMusic")
	public String myCollectedMusic(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("currentUserId") != null) {
//			Integer userId = (Integer) session.getAttribute("currentUserId");
			int offset = 0;
			int pageSize = 10;
			if(request.getParameter("offset") != null) {
				offset = Integer.parseInt(request.getParameter("offset"));
			}
			System.out.println(session.getAttribute("currentUserId"));
			PageModel model = musicService.findMyCollectedMusic((Integer)session.getAttribute("currentUserId"), offset, pageSize);
			request.setAttribute("model", model);
		}
		return "musicPage/mymusic";
	}
	
	
	/**
	 * 前端查找音乐
	 * @param request
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/searchMusic")
	public String searchMusic(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		
		String inputInfo = new String(request.getParameter("inputinfo").getBytes("ISO-8859-1"),"utf-8");
		//request.setCharacterEncoding("GBK");
		//response.setContentType("text/json; charset=gbk");
		//String inputInfo = request.getParameter("inputinfo");
		//String inputInfo = Escape.unescape(request.getParameter("inputinfo"));
		
		 System.out.println(inputInfo);	
		PageModel model = musicService.findMusic(offset, pageSize, inputInfo);
		if(model.getEntityList().size() > 0) {
			music = (Music)model.getEntityList().get(0);
			singer = (Singer) singerService.findObjectById(Singer.class, music.getSingerId());
			request.setAttribute("singerinfo", singer);
			request.setAttribute("model", model);
			return "/musicPage/singer_main";
		}else {
			return "/musicPage/failed";
		}
		
	}
	
	/**
	 * 播放列表
	 * @param request
	 * @return
	 */
	@RequestMapping("playlist")
	public String playList(HttpServletRequest request) {
		return "musicPage/playlist";
	}
}
