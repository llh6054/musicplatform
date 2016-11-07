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
 * 歌手表
 *
 */
@Entity
@Table(name="Singer")
public class Singer {
	

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(length=255, nullable=false)
	private String singerName;
	
	@Basic(fetch = FetchType.LAZY)   
	@Type(type="text")  
	private String singerInfo;
	
	@Column(length=255)
	private String img;
	
	@Column(length=11)
	private long addTime;
	
	@Column(length=11, nullable=false)
	private long updateTime=0;
	
	@Column(length=1, nullable=false,columnDefinition="INT default 1")
	private int isDel;
	
	@Column(length=1)
	private int gender;
	
	@Column(length=11)
	private int hot = 0;
	
	public int getHot() {
		return hot;
	}

	public void setHot(int hot) {
		this.hot = hot;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getIsDel() {
		return isDel;
	}

	public void setIsDel(int isDel) {
		this.isDel = isDel;
	}

	public String getSingerName() {
		return singerName;
	}

	public void setSingerName(String singerName) {
		this.singerName = singerName;
	}

	public String getSingerInfo() {
		return singerInfo;
	}

	public void setSingerInfo(String singerInfo) {
		this.singerInfo = singerInfo;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public long getAddTime() {
		return addTime;
	}

	public void setAddTime(long addTime) {
		this.addTime = addTime;
	}

	public long getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(long updateTime) {
		this.updateTime = updateTime;
	}
	
	public String getDate(long time){
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return df.format(time).toString();
	}
}
