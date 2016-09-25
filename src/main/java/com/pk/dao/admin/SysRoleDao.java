package com.pk.dao.admin;

import java.util.List;

import com.pk.framework.mybatis.SqlMapper;
import com.pk.framework.vo.PageSearchVO;
import com.pk.model.admin.SysRole;

public interface SysRoleDao extends SqlMapper {
	
	SysRole get(int id);
	
	int count(PageSearchVO svo);
	
	List<SysRole> list(PageSearchVO svo);

    void insert(SysRole vo);

    void update(SysRole vo);
    
    void delete(int id);
	
}
