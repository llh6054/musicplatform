package com.design.entity;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * 
 * 歌单标签表
 *
 */
@Entity
@Table(name="MusicList_Tag")
public class MusicListTag {
	

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(length=255, nullable=false, name="tag_name")
	private String tagName;
	
	@Column(length=11, name="add_time")
	private long addTime;
	
	@Column(length=1, nullable=false)
	private String isDel;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getIsDel() {
		return isDel;
	}

	public void setIsDel(String isDel) {
		this.isDel = isDel;
	}

	public long getAddTime() {
		return addTime;
	}

	public void setAddTime(long addTime) {
		this.addTime = addTime;
	}
	
	
}
