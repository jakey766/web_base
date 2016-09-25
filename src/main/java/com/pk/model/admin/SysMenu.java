package com.pk.model.admin;

import java.io.Serializable;

/**
 * 系统菜单
 * @author jiangkunpeng
 *
 */
public class SysMenu implements Serializable{

	private static final long serialVersionUID = 7642471996972986474L;
	
	private int id;
	private int pid;
	private String name;
	private String uri;
	private int isMenu;
	private int sortIndex;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUri() {
		return uri;
	}
	public void setUri(String uri) {
		this.uri = uri;
	}
	public int getIsMenu() {
		return isMenu;
	}
	public void setIsMenu(int isMenu) {
		this.isMenu = isMenu;
	}
	public int getSortIndex() {
		return sortIndex;
	}
	public void setSortIndex(int sortIndex) {
		this.sortIndex = sortIndex;
	}
}
