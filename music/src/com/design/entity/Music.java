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
@Entity
@Table(name="Music")
public class Music {	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(length=11, nullable=false)
	private int singerId;	//歌手id

	@Column(length=255,nullable=false)
	private String musicOriginalName;	//歌曲原名称
	
	@Column(length=255,nullable=false)
	private String musicName;	//歌曲名称
	
	@Column(length=255)
	private String imgUrl;	//图片url
	
	@Column(length=255,nullable=false)	
	private String url;	//歌曲url
	
	@Column(length=11,nullable=false)
	private long addTime;	//添加时间
	
	@Column(length=255,nullable=false)
	private String singer;	//歌手
	
	@Column(length=255)
	private String lyricUrl;	//歌词url
	
	@Column(length=255)
	private String ablum;	//专辑
	
	@Basic(fetch = FetchType.LAZY)   
	@Type(type="text")  
	private String musicInfo;	//歌曲信息
	
	@Column(length=1, nullable=false)
	private String isDel = "0";	//是否删除		0 正常	1 删除
		
	@Column(length=11, nullable=false)
	private long updateTime=0;
	
	@Column(length=11)
	private int hot;
	
	public long getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(long updateTime) {
		this.updateTime = updateTime;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMusicOriginalName() {
		return musicOriginalName;
	}

	public void setMusicOriginalName(String musicOriginalName) {
		this.musicOriginalName = musicOriginalName;
	}

	public String getMusicName() {
		return musicName;
	}

	public void setMusicName(String musicName) {
		this.musicName = musicName;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public long getAddTime() {
		return addTime;
	}

	public void setAddTime(long addTime) {
		this.addTime = addTime;
	}

	public String getSinger() {
		return singer;
	}

	public void setSinger(String singer) {
		this.singer = singer;
	}

	public String getLyricUrl() {
		return lyricUrl;
	}

	public void setLyricUrl(String lyricUrl) {
		this.lyricUrl = lyricUrl;
	}

	public String getAblum() {
		return ablum;
	}

	public void setAblum(String ablum) {
		this.ablum = ablum;
	}
	
	public int getSingerId() {
		return singerId;
	}

	public void setSingerId(int singerId) {
		this.singerId = singerId;
	}

	public String getMusicInfo() {
		return musicInfo;
	}

	public void setMusicInfo(String musicInfo) {
		this.musicInfo = musicInfo;
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
