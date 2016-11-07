package com.design.service;

import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.util.Iterator;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.design.dao.BaseDAO;



public class CommonService {
	@Resource(name="baseDAO")
	BaseDAO baseDAO;
	
	public void setBaseDAO(BaseDAO baseDAO) {
		this.baseDAO = baseDAO;
	}
	
	
	 /**
	    * 总行数
	    * @param values
	    * @param hql
	    * @return
	    */	
	public int getAllLine(Object[] values, String hql) {
		return Integer.parseInt(baseDAO.getSingletonResult(hql, values).toString());
	}
	
	
	/**
	 * 根据主键查询
	 * 
	 * @param entityClass
	 * @param entityId
	 * @return
	 */
	public Object findObjectById(Class<?> entityClass, Serializable entityId) {
		return baseDAO.findObjectById(entityClass, entityId);
	}
	
	
	
	/**
	 * 更新对象
	 * 
	 * @param entity
	 * @throws Exception
	 */
	public void updateObject(Object entity){
		try {
			baseDAO.updateObject(entity);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 删除 ---逻辑删除
	 * 
	 * @param Id
	 * @return
	 */
	public boolean delete(String entity, int id) {
		String hql = "UPDATE " + entity +" set isdel = 1 WHERE id=?";
		Object[] values = new Object[1];
		values[0] = id;
		boolean success = false;
		try {
			success = baseDAO.updateObjectByHql(hql, values);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return success;
	}
	
	/**
	 * 文件上传--不能有中文
	 * （暂时支持单文件）
	 * 
	 * @param path 
	 * 				路径
	 * @param request
	 * 				multipartRequest
	 * @param type  
	 * 				类型 1歌手 2歌曲 3歌单
	 * @return url
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	public String uploadFile(String path, HttpServletRequest request, int type ) throws IllegalStateException, IOException {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
		String url=null;
		if(multipartResolver.isMultipart(request)) {
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
				Iterator<String> iter = multiRequest.getFileNames();
				while(iter.hasNext()) {
					MultipartFile file = multiRequest.getFile((String)iter.next());
					if(file != null) {
						String fileOriginalName = file.getOriginalFilename();	
						if(fileOriginalName != "") {
							url = path + fileOriginalName;				
							File localFile = new File(url);
							file.transferTo(localFile);
							switch(type) {
								case 1: url = "images/singer/" + fileOriginalName; //歌手
									break;
								case 2: url = "images/music/" + fileOriginalName; //歌曲
									break;
								case 3: url = "images/list/" + fileOriginalName; //歌单
									break;
								default: 
									return "images/singer/6649846326157603.jpg"; //默认图片				
							}
						}else {
							return "images/singer/6649846326157603.jpg"; //默认图片				
						}
						
					}
				}	
			}	
		
		return url;	
	}

	
	
	
	
	
}
