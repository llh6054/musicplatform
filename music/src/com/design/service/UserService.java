package com.design.service;

import java.util.List;

import com.design.entity.User;
import com.design.entity.UserMusic;
import com.design.util.PageModel;

public class UserService extends CommonService{
	

	
	/**
	 * 添加用户
	 * 
	 * @param user
	 * @return
	 */
	public boolean addUser(User user) {
		boolean b = true;
		if(this.findSingletonUser(user.getUserName()) != null) { //用户名已注册
			return false;
		}
		try {
			this.baseDAO.saveObject(user);
			b = true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			b = false;
		}
		return b;
	}
	
	/**
	 * 查找用户 --单例
	 * 
	 * @param userName
	 * @return
	 */
	public User findSingletonUser(String userName) {
		String hql = "FROM User WHERE userName = ?";
		Object[] values = new Object[1];
		values[0] = userName;
		User user = (User) baseDAO.getSingletonResult(hql, values);
		return user;
	}
	
	
	/**
	 * 用户登录
	 * 
	 * @param userName
	 * @param password
	 * @return
	 */
	public User userLogin(String userName, String password) {
		String hql = "From User WHERE userName = ? AND password = ? AND isDel = ?";
		Object[] values = new Object[3];
		values[0] = userName;
		values[1] = password;
		values[2] = 0;
		return ((User)baseDAO.getSingletonResult(hql, values));
	}
	
	
	/**
	 * 用户分页查找
	 * @param offset
	 * @param pageSize
	 * @param inputInfo
	 * @return
	 */
	public PageModel findUser(int offset, int pageSize, String inputInfo) {
		String hql;
		String allLineHQL;
		Object[] values;
		boolean vague;
 		if(inputInfo == null || inputInfo.equals("")) {
			hql = "from User";
			allLineHQL = "select count(id) from User";
			values = null;
			vague = false;
		}else {
			hql = "FROM User WHERE userName like ?";
			allLineHQL = "SELECT COUNT(id) FROM User WHERE userName like ?";
			values = new Object[1];
			values[0] = inputInfo;
			vague = true;
		}
		int allLine = this.getAllLine(values, allLineHQL);
		System.out.println("user "+allLine);
		List<?> user= this.baseDAO.findObjectByPage(hql, offset, pageSize, values, vague);
		
		PageModel page = new PageModel();
		page.setNextLine(offset+pageSize);
		page.setOnLine(offset-pageSize);
		page.setAllLine(allLine);
		page.setEntityList(user);
		
		return page;
	}

	/**
	 * 后台启用用户
	 * @param userId
	 */
	public void awakeUser(int userId) {
		// TODO Auto-generated method stub
		String hql = "UPDATE User SET isDel = 0 WHERE id = ?";
		Object[] values = new Object[1];
		values[0] = userId;
		try {
			baseDAO.updateObjectByHql(hql, values);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 用户收藏歌曲
	 * 
	 * @param userMusic
	 */
	public boolean saveUserMusic(UserMusic userMusic) {
		UserMusic temp_userMusic = getSingletonUserMusic(userMusic.getSongId(), userMusic.getUserid());	
		if(temp_userMusic != null && temp_userMusic.getIsDel() == 0) { //已收藏过
			return false;	
		}else if(temp_userMusic != null && temp_userMusic.getIsDel() == 1){	//重新收藏
			temp_userMusic.setIsDel(0);
			this.updateObject(temp_userMusic);
			return true;
		}
		// TODO Auto-generated method stub
		try {
			baseDAO.saveObject(userMusic);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
	}


	/**
	 * 单例查找
	 * 
	 * @param userId
	 * @param songid
	 * @return
	 */
	public UserMusic getSingletonUserMusic(int songid, int userId) {
		String hql = "From UserMusic Where userid = ? AND songId = ?";	
		Object[] values = new Object[2];
		values[0] = userId;
		values[1] = songid;
		UserMusic userMusic = (UserMusic) baseDAO.getSingletonResult(hql, values);
		return userMusic;
//		String sql = "select * from user_music where userid = "  + userId + " AND songId = " + songid + " LIMIT 0, 1";
//		List<?> list = baseDAO.findObjectBySQL(sql);
//		return (UserMusic) list.get(0);
		//java.lang.ClassCastException: [Ljava.lang.Object; cannot be cast to com.design.entity.UserMusic
	}
	
	
	
}
