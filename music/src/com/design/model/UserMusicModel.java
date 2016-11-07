package com.design.model;

import java.io.Serializable;

public class UserMusicModel implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	public UserMusicModel() {	//无参构造
		super();
	}
	
	private String musicName;
	
	private String url;
	
	private String singer;
	
	private int musicid;
	
	private int singerId;
	
	public String getMusicName() {
		return musicName;
	}


	public void setMusicName(String musicName) {
		this.musicName = musicName;
	}


	public String getUrl() {
		return url;
	}


	public void setUrl(String url) {
		this.url = url;
	}


	public String getSinger() {
		return singer;
	}


	public void setSinger(String singer) {
		this.singer = singer;
	}

	

	public int getMusicid() {
		return musicid;
	}


	public void setMusicid(int musicid) {
		this.musicid = musicid;
	}

	

	public int getSingerId() {
		return singerId;
	}


	public void setSingerId(int singerId) {
		this.singerId = singerId;
	}


	//有参构造方法
	public UserMusicModel(String url, String singer, String musicName, int id, int singerId) {
		super();
		this.url = url;
		this.singer = singer;
		this.musicName = musicName;
		this.musicid = id;
		this.singerId = singerId;
	}
}
