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
@Table(name="MusicList_Tag_Link")
public class SingerTagLink {
	

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name="tag_id", length=11, nullable=false)
	private int tagId;
	
	@Column(name="MusicList_id", length=11, nullable=false)
	private int musiclistId;
	
	@Column(length=11, name="add_time")
	private long addTime;
	
	@Column(length=1, nullable=false,columnDefinition="INT default 1",name="is_del")
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
