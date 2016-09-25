package com.pk.dao.admin;

import java.util.List;

import com.pk.framework.mybatis.SqlMapper;
import com.pk.model.admin.SysMenu;
import com.pk.model.admin.SysRoleMenu;
import com.pk.vo.admin.SysRoleMenuSearchVO;

public interface SysRoleMenuDao extends SqlMapper {
	
	void insertBatch(List<SysRoleMenu> list);

    void deleteByRoleId(int roleId);

    List<SysRoleMenu> search(SysRoleMenuSearchVO svo);

    List<SysMenu> loadMenus(SysRoleMenuSearchVO svo);
	
}
