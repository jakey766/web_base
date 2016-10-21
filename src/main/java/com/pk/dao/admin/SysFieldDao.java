package com.pk.dao.admin;

import java.util.List;

import com.pk.framework.mybatis.SqlMapper;
import com.pk.model.admin.SysField;

/**
 * Created by jiangkunpeng on 16/10/21.
 */
public interface SysFieldDao extends SqlMapper {

    List<SysField> loadAll();

    void update(SysField vo);
}
