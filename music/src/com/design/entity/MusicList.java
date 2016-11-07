package com.design.entity;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Type;

/**
 * 
 * 歌单表
 *
 */
@Entity
@Table(name="MusicList")
public class MusicList {
	

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;	
	
	@Column(length=255, nullable=false)
	private String listName;	//歌单名称
	
	@Basic(fetch = FetchType.LAZY)   
	@Type(type="text")  
	private String listDesc;	//歌单描述
	
	@Column(length=255)
	private String image;	//歌单图片
	
	@Column(length=255, nullable=false)
	private String listType;	//歌单类型
	
	@Column(length=11)
	private int hot;	//热度
	
	@Column(length=1, nullable=false)
	private String isDel = "0";	//是否删除 0 整除 1删除
	
	@Column(length=11,nullable=false)
	private long addTime;	//添加时间
	
	@Column(length=11)
	private long updateTime = 0;	//修改时间

	public long getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(long updateTime) {
		this.updateTime = updateTime;
	}

	public long getAddTime() {
		return addTime;
	}

	public void setAddTime(long addTime) {
		this.addTime = addTime;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getListName() {
		return listName;
	}

	public void setListName(String listName) {
		this.listName = listName;
	}

	public String getListDesc() {
		return listDesc;
	}

	public void setListDesc(String listDesc) {
		this.listDesc = listDesc;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getListType() {
		return listType;
	}

	public void setListType(String listType) {
		this.listType = listType;
	}

	public int getHot() {
		return hot;
	}

	public void setHot(int hot) {
		this.hot = hot;
	}

	public String getIsDel() {
		return isDel;
	}

	public void setIsDel(String isDel) {
		this.isDel = isDel;
	}
	
	public String getDate(long time){
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return df.format(time).toString();
	}
}
