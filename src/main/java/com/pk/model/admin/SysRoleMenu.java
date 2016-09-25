package com.pk.model.admin;

import java.io.Serializable;

/**
 * 系统角色-菜单
 * @author jiangkunpeng
 *
 */
public class SysRoleMenu implements Serializable{
	private static final long serialVersionUID = 2765093762892385237L;
	
	private int id;
	private int roleId;
	private int menuId;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	public int getMenuId() {
		return menuId;
	}
	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}
}
