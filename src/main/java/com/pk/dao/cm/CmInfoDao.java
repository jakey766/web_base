package com.pk.dao.cm;

import com.pk.framework.mybatis.SqlMapper;
import com.pk.model.cm.CmInfo;
import com.pk.vo.cm.CmInfoSearchVO;

import java.util.List;

/**
 * Created by jiangkunpeng on 16/10/11.
 */
public interface CmInfoDao extends SqlMapper {

    CmInfo get(int id);

    int count(CmInfoSearchVO svo);

    List<CmInfo> list(CmInfoSearchVO svo);

    void insert(CmInfo vo);

    void update(CmInfo vo);

    void delete(int id);
}
