package com.pk.vo.admin;

import com.pk.framework.vo.PageSearchVO;

public class SysMenuSearchVO extends PageSearchVO{
    private int isMenu = -1;    //-1:所有,0:URI权限,1:菜单

    public SysMenuSearchVO() {
	}
    
	public SysMenuSearchVO(int isMenu) {
		this.isMenu = isMenu;
	}
	
	public int getIsMenu() {
		return isMenu;
	}
	public void setIsMenu(int isMenu) {
		this.isMenu = isMenu;
	}
}
