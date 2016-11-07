package com.design.service;

import java.util.List;

import javax.annotation.Resource;

import com.design.dao.BaseDAO;
import com.design.entity.MusicList;
import com.design.util.PageModel;


public class MusicListService extends CommonService{
	@Resource(name="baseDAO")
	BaseDAO baseDAO;
	
	public void setBaseDAO(BaseDAO baseDAO) {
		this.baseDAO = baseDAO;
	}
	
	
	/**
	 * 添加列表
	 * @param list
	 * @return
	 */	
	public boolean addList(MusicList list) {
		if(getSingletonMusicList(list.getListName()) != null) {
			return false;
		}
		boolean b = true;
		try {
			this.baseDAO.saveObject(list);
			b = true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			b = false;
		}
		return b;
	}
	
	
	/**
	 * 获取列表-----单例
	 * @param listName
	 * @return
	 */	
	public MusicList getSingletonMusicList(String listName) {
		String hql = "from MusicList AS ml WHERE ml.listName = ?";
		Object[] values = new Object[1];
		values[0] = listName;
		return (MusicList)baseDAO.getSingletonResult(hql, values);
	}
	

	
	
	/**
	 * 分页查询
	 * 
	 * @param offset
	 * 				起始位置
	 * @param pageSize
	 * 				每页个数
	 * @param inputInfo
	 * 				条件
	 * @return
	 */	
	public PageModel findList(int offset, int pageSize, String inputInfo) {

		String hql;
		String allLineHQL;
		Object[] values;
		boolean vague;
 		if(inputInfo == null || inputInfo.equals("")) {
			hql = "from MusicList WHERE isDel = ?";
			allLineHQL = "select count(id) from MusicList WHERE isDel = ?";
			values = new Object[1];
			values[0] = "0";
			vague = false;
		}else {
			hql ="from MusicList where (listName like ? or listType like ?) AND isDel = ?";
			allLineHQL="select count(*) from MusicList where (listName like ? or listType like ?) AND isDel like ?";
			values = new Object[3];
			values[0] = inputInfo;
			values[1] = inputInfo;
			values[2] = "0";
			vague = true;
		}
		int allLine = this.getAllLine(values, allLineHQL);
		System.out.println("list "+allLine);
		List<?> list= this.baseDAO.findObjectByPage(hql, offset, pageSize, values, vague);
		
		PageModel page = new PageModel();
		page.setNextLine(offset+pageSize);
		page.setOnLine(offset-pageSize);
		page.setAllLine(allLine);
		page.setEntityList(list);
		
		return page;
	}
	
}
