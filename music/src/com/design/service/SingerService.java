package com.design.service;



import java.util.List;

import com.design.entity.Singer;
import com.design.util.PageModel;


public class SingerService extends CommonService{
	
	
	/**
	 * 添加歌手
	 * 
	 * @param singer
	 * @return boolean
	 */
	public boolean addSinger(Singer singer) {
		if(getSingletonSinger(singer.getSingerName()) != null) {
			return false;
		}
		boolean b = true;
		try {
			this.baseDAO.saveObject(singer);
			b = true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			b = false;
		}
		return b;
	}
	

	/**
	 * 获取歌手 单例
	 * @param singerName
	 * @return
	 */
	public Singer getSingletonSinger(String singerName) {
		String hql = "from Singer AS s WHERE s.singerName = ?";
		Object[] values = new Object[1];
		values[0] = singerName;
		return  (Singer) baseDAO.getSingletonResult(hql, values);
	}

	
	/**
	 * 分页查找
	 * 
	 * @param offset
	 * @param pageSize
	 * @param inputInfo
	 * @return
	 */
	public PageModel findSinger(int offset, int pageSize, String inputInfo) {
		// TODO Auto-generated method stub
		String hql;
		Object[] values;
		String allLineHQL;
		boolean vague;
		if(inputInfo == null) {
			hql = "FROM Singer WHERE isdel = ? ORDER BY hot DESC";
			allLineHQL = "SELECT COUNT(id) FROM Singer WHERE isdel = ?";
			values = new Object[1];
			values[0] = 0;
			vague = false;
		}else {
			hql = "FROM Singer WHERE isdel like ? AND singerName like ? ORDER BY hot DESC";
			allLineHQL = "SELECT COUNT(id) FROM Singer WHERE isdel like ? AND singerName like ?";
			values = new Object[2];
			values[0] = 0;
			values[1] = inputInfo;
			vague = true;
		}
		
		
		int allLine = this.getAllLine(values, allLineHQL);
		List<?> list = this.baseDAO.findObjectByPage(hql, offset, pageSize, values, vague);
		
		PageModel page = new PageModel();
		page.setAllLine(allLine);
		page.setEntityList(list);
		page.setNextLine(offset+pageSize);
		page.setOnLine(offset-pageSize);
		
		return page;
	};
	
	
	/**
	 * 最热歌手
	 */
	public List<?> hotSinger() {
		String hql = "FROM Singer WHERE isdel = ? AND img != ? ORDER BY ? DESC";
		Object[] values = new Object[3];
		values[0] = 0;
		values[1] = "";
		values[2] = "hot";
		List<?> list = baseDAO.findObjectByHql(hql, values);
		return list;
	}
	
}
