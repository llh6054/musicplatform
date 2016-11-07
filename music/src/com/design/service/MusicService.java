package com.design.service;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.design.entity.Music;
import com.design.entity.Singer;
import com.design.util.PageModel;



public class MusicService extends CommonService{
	
	@Resource(name="musicService")
	MusicService musicService;
	
	@Resource(name="music")
	Music music;
	
	@Resource(name="singer")
	Singer singer;
	
	@Resource(name="singerService")
	SingerService singerService;

	/**
	 * 添加歌曲信息
	 * 
	 * @param music
	 * @return
	 */	
	public boolean addMusic(Music music) {
		if(getSingletonMusic(music.getMusicName()) != null) {
			return false;
		}
		boolean b = true;
		try {
			this.baseDAO.saveObject(music);
			b = true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			b = false;
		}
		return b;
	}
	
	
	/**
	 * 上传歌曲
	 * 
	 * @param request
	 * @return
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	public boolean uploadMusic(HttpServletRequest request, Music music) throws IllegalStateException, IOException {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
		if(multipartResolver.isMultipart(request)) {
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			Iterator<String> iter = multiRequest.getFileNames();
			while(iter.hasNext()) {
				MultipartFile file = multiRequest.getFile((String)iter.next());
				if(file != null) {
					String fileOriginalName = file.getOriginalFilename();
					//后缀&文件名
					String[] splitFileName = new String[2];
					splitFileName[0] = fileOriginalName.substring(0, fileOriginalName.lastIndexOf("."));
					splitFileName[1] = fileOriginalName.substring(fileOriginalName.lastIndexOf(".")+1, fileOriginalName.length());
					//String[] splitFileName = fileOriginalName.split("\\.");
					System.out.println(splitFileName[1]);
					long now = new Date().getTime();  
					String fileName = String.valueOf(now) + "."+ splitFileName[1]; 
					//歌手&歌名
					String[] tempName = splitFileName[0].split("-");
					@SuppressWarnings("deprecation")
					String path = request.getRealPath("/") + "mp3\\" + fileName;
					
					//添加歌手信息
					singer.setSingerName(tempName[0].substring(0, tempName[0].length()-1));
					singer.setAddTime(now);
					singerService.addSinger(singer);
					
					//添加歌曲信息
					String url = "mp3/" + fileName;
					music.setAddTime(now);
					music.setMusicName(tempName[1]);
					music.setMusicOriginalName(fileOriginalName);
					music.setSinger(tempName[0]);
					music.setUrl(url);
					music.setSingerId(singerService.getSingletonSinger(tempName[0]).getId());
					music.setAblum(music.getAblum());
					music.setMusicInfo(music.getMusicInfo());
					boolean isAdd = musicService.addMusic(music);
					
					//歌曲已存在
					if(isAdd == false) {
						return false;
					}
					
					
					
					File localFile = new File(path);
					file.transferTo(localFile);
				}
			}
		}
		return true;
	}
	
	/**
	 * 获取歌曲-------单例
	 * 
	 * @param musicName
	 * @return
	 */	
	public Music getSingletonMusic(String musicName) {
		String hql = "from Music AS m WHERE m.musicName = ?";
		Object[] values = new Object[1];
		values[0] = musicName;
		return (Music)baseDAO.getSingletonResult(hql, values);
	}
	
	


	/**
	 * 歌曲列表---分页查询
	 * 
	 * @param offset
	 * 				起始位置
	 * @param pageSize
	 * 				每页个数
	 * @param inputInfo
	 * 				条件
	 * @param order
	 * 				排序
	 * @return
	 */	
	public PageModel findMusic(int offset, int pageSize, String inputInfo) {
		String hql;
		String allLineHQL;
		Object[] values;
		boolean vague;
		int allLine;
 		if(inputInfo == null || inputInfo.equals("")) {
			hql = "from Music WHERE isdel=? ORDER BY hot";
			allLineHQL = "select count(id) from Music WHERE isdel=?";
			values = new Object[1];
			values[0] = "0";
			vague = false;
			allLine = this.getAllLine(values, allLineHQL);
		}else {
			hql = "FROM Music WHERE isdel like ? AND musicOriginalName like ?";
			allLineHQL = "SELECT COUNT(id) FROM Music WHERE isdel like ? AND musicOriginalName like ?";
			values = new Object[2];
			values[0] = "0";
			values[1] = inputInfo;
			vague = true;
			allLine = Integer.parseInt(baseDAO.getSingletonResultVague(allLineHQL, values).toString()) ;
		}
		 
		System.out.println("music "+allLine);
		List<?> music= this.baseDAO.findObjectByPage(hql, offset, pageSize, values, vague);
	
		PageModel page = new PageModel();
		page.setNextLine(offset+pageSize);
		page.setOnLine(offset-pageSize);
		page.setAllLine(allLine);
		page.setEntityList(music);
		
		return page;
	}
	
	
	
	
	
	/**
	 * 新歌榜
	 * 
	 * @param offset
	 * @param pageSize
	 * @param Order
	 * @return
	 */
	public PageModel findLatestMusic(int offset, int pageSize) {
		String hql = "from Music WHERE isdel = ? ORDER BY addTime DESC";
		String allLineHQL = "select count(id) from Music WHERE isdel = ?";
		Object[] values = new Object[1];
		values[0] = "0";
		boolean vague = false;
		int allLine = this.getAllLine(values, allLineHQL);
		List<?> music = this.baseDAO.findObjectByPage(hql, offset, pageSize, values, vague);
		
		PageModel page = new PageModel();
		page.setNextLine(offset+pageSize);
		page.setOnLine(offset-pageSize);
		page.setAllLine(allLine);
		page.setEntityList(music);
		return page;
	}
	
	
	
	/**
	 * 历史点击榜
	 * 
	 * @param offset
	 * @param pageSize
	 * @return
	 */
	public PageModel findHottestMusic(int offset, int pageSize) {
		String hql = "from Music WHERE isdel = ? ORDER BY hot DESC";
		String allLineHQL = "select count(id) from Music WHERE isdel = ?";
		Object[] values = new Object[1];
		values[0] = "0";
		boolean vague = false;
		int allLine = this.getAllLine(values, allLineHQL);
		List<?> music = this.baseDAO.findObjectByPage(hql, offset, pageSize, values, vague);
		
		PageModel page = new PageModel();
		page.setNextLine(offset+pageSize);
		page.setOnLine(offset-pageSize);
		page.setAllLine(allLine);
		page.setEntityList(music);
		return page;
	}


	/**
	 * 我收藏的音乐 --- 分页查找
	 * 
	 * @param userId
	 * @param offset
	 * @param pageSize
	 * @return
	 */
	public PageModel findMyCollectedMusic(int userId, int offset, int pageSize) {
		// TODO Auto-generated method stubt
		String hql = "SELECT new com.design.model.UserMusicModel(m.url, m.singer, m.musicName, m.id AS musicid, m.singerId) FROM Music AS m , UserMusic AS um WHERE um.userid = ? AND um.isDel = ? AND  um.songId = m.id";
		String allLineHQL = "SELECT count(*) FROM Music AS m, UserMusic AS um WHERE um.userid = ? AND um.isDel = ? AND  um.songId = m.id";
		//"select new com.test.UsersVoGoods(u.userName, u.teltphone, u.address, g.goodsName) from Users u, Goods g where u.userId=g.userId";
		Object[] values = new Object[2];
		values[0] = userId;
		values[1] = 0;
		int allLine = this.getAllLine(values, allLineHQL);
		List<?> list = this.baseDAO.findObjectByPage(hql, offset, pageSize, values, false);
//		String allLineSQL = "SELECT count(*) FROM Music AS m LEFT JOIN User_Music AS um ON um.songId = m.id WHERE um.userid = " + userId + " AND um.isDel = 0";
//		List<?> allLine = baseDAO.findObjectBySQL(allLineSQL);
		
//		String sql = "SELECT m.* FROM Music AS m LEFT JOIN User_Music AS um ON um.songId = m.id WHERE um.userid = " + userId + " AND um.isDel = 0";
//		List<?> list = baseDAO.findObjectBySQL(sql);
		PageModel model = new PageModel();
	//	System.out.println("ss:" + ((Music)list.get(0)).getSinger());
//		model.setAllLine(((BigInteger) allLine.get(0)).intValue());
		model.setAllLine((allLine));
		model.setEntityList(list);
		model.setNextLine(offset+pageSize);
		model.setOnLine(offset-pageSize);
		return model;
	}
	
	
	
}
