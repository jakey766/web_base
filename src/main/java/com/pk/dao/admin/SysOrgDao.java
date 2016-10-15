package com.pk.dao.admin;

import com.pk.framework.mybatis.SqlMapper;
import com.pk.model.admin.SysOrg;
import com.pk.vo.admin.SysOrgSearchVO;

import java.util.List;

/**
 * Created by jiangkunpeng on 16/10/5.
 */
public interface SysOrgDao extends SqlMapper {

    SysOrg get(int id);

    List<SysOrg> list(SysOrgSearchVO svo);

    void insert(SysOrg vo);

    void update(SysOrg vo);

    void updateCode(SysOrg vo);

    void delete(int id);

    void deleteByCode(String code);

}
