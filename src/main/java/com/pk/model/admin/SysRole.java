package com.pk.model.admin;

import java.io.Serializable;

/**
 * 系统角色
 * @author jiangkunpeng
 *
 */
public class SysRole implements Serializable{
	
	private static final long serialVersionUID = -643922417127446893L;
	
	private int id;
	private String name;
	private String desc;
	
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
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
}
