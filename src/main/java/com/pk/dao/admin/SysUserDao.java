package com.pk.dao.admin;

import com.pk.framework.mybatis.SqlMapper;
import com.pk.mode.admin.SysUser;
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

    SysUser get(int id);

    SysUser getByUsername(String username);
}
