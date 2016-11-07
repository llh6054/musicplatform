package com.design.util;

import java.util.List;
/**
 * 分页类
 * 
 * 
 */
public class PageModel {

	private int allLine;//总行数
	private int onLine;//上一行
	private int nextLine;//下一行
	
	private List<?> entityList;//列表
	
	public int getAllLine() {
		return allLine;
	}
	public void setAllLine(int allLine) {
		this.allLine = allLine;
	}
	public int getOnLine() {
		return onLine;
	}
	public void setOnLine(int onLine) {
		this.onLine = onLine;
	}
	public int getNextLine() {
		return nextLine;
	}
	public void setNextLine(int nextLine) {
		this.nextLine = nextLine;
	}
	public List<?> getEntityList() {
		return entityList;
	}
	public void setEntityList(List<?> entityList) {
		this.entityList = entityList;
	}
	
}
