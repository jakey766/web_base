package com.pk.vo.admin;

import java.util.List;

public class SysRoleMenuSearchVO{
	private List<Integer> roleIds;
	private int isMenu = 1;	//0:权限,1:仅菜单,-1:权限+菜单 

	public List<Integer> getRoleIds() {
		return roleIds;
	}
	public void setRoleIds(List<Integer> roleIds) {
		this.roleIds = roleIds;
	}
	public int getIsMenu() {
		return isMenu;
	}
	public void setIsMenu(int isMenu) {
		this.isMenu = isMenu;
	}
}
