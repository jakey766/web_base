package com.pk.dao.admin;

import java.util.List;

import com.pk.framework.mybatis.SqlMapper;
import com.pk.model.admin.SysMenu;
import com.pk.vo.admin.SysMenuSearchVO;

public interface SysMenuDao extends SqlMapper {
	
	SysMenu get(int id);
	
	int count(SysMenuSearchVO svo);
	
	List<SysMenu> list(SysMenuSearchVO svo);

    void insert(SysMenu vo);

    void update(SysMenu vo);
    
    void delete(int id);
	
}
