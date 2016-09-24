package com.pk.dao.admin;

import com.pk.framework.mybatis.SqlMapper;
import com.pk.model.admin.SysUser;
import com.pk.vo.admin.SysUserSearchVO;

import java.util.List;

/**
 * Created by jiangkunpeng on 16/9/23.
 */
public interface SysUserDao extends SqlMapper{

    int count(SysUserSearchVO svo);

    List<SysUser> list(SysUserSearchVO svo);

    void insert(SysUser vo);

    void update(SysUser vo);

    void updatePassword(SysUser vo);
    
    void delete(int id);

    SysUser get(int id);

    SysUser getByUsername(String username);
}
