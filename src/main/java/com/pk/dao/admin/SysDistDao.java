package com.pk.dao.admin;

import com.pk.framework.mybatis.SqlMapper;
import com.pk.model.admin.SysDist;
import com.pk.vo.admin.SysDistSearchVO;

import java.util.List;

/**
 * Created by jiangkunpeng on 16/10/11.
 */
public interface SysDistDao extends SqlMapper {

    SysDist get(int id);

    int count(SysDistSearchVO svo);

    List<SysDist> list(SysDistSearchVO svo);

    void insert(SysDist vo);

    void update(SysDist vo);

    void delete(int id);
}
