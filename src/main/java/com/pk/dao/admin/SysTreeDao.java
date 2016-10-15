package com.pk.dao.admin;

import com.pk.framework.mybatis.SqlMapper;
import com.pk.model.admin.SysTree;
import com.pk.vo.admin.SysTreeSearchVO;

import java.util.List;

/**
 * Created by jiangkunpeng on 16/10/15.
 */
public interface SysTreeDao extends SqlMapper {

    SysTree get(int id);

    List<SysTree> list(SysTreeSearchVO svo);

    void insert(SysTree vo);

    void update(SysTree vo);

    void updateCode(SysTree vo);

    void delete(int id);

    void deleteByCode(String code);

}
