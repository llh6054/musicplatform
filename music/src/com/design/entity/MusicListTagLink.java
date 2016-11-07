package com.design.entity;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * 
 * 歌手标签关联表
 *
 */
@Entity
@Table(name="Singer_Tag_Link")
public class MusicListTagLink {
	

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name="tag_id", length=11, nullable=false)
	private int tagId;
	
	@Column(name="singer_id", length=11, nullable=false)
	private int singerId;
	
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
