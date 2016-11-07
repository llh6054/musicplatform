package com.design.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="administrator")
public class Administrator {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;	
	@Column(length=32, nullable=false)
	private String name;	//管理员名称
	@Column(length=32, nullable=false)
	private String password;	//密码
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
