package com.design.entity;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * 
 * 歌手标签表
 *
 */
@Entity
@Table(name="Singer_Tag")
public class SingerTag {
	

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(length=255, nullable=false)
	private String tagName;
	
	@Column(length=11)
	private long addTime;
	
	@Column(length=1, nullable=false,columnDefinition="INT default 1")
	private int isDel;
	
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

	public long getAddTime() {
		return addTime;
	}

	public void setAddTime(long addTime) {
		this.addTime = addTime;
	}
	
	
}
