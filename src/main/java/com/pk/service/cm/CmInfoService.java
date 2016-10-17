package com.pk.service.cm;

import com.pk.dao.cm.CmInfoDao;
import com.pk.framework.service.BaseService;
import com.pk.framework.vo.Result;
import com.pk.model.cm.CmInfo;
import com.pk.vo.cm.CmInfoSearchVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service()
public class CmInfoService extends BaseService {

    @Autowired
    private CmInfoDao cmInfoDao;
    
    public Result list(CmInfoSearchVO svo){
        return Result.SUCCESS(cmInfoDao.list(svo));
    }

    @Transactional
    public Result add(CmInfo vo){
        cmInfoDao.insert(vo);
        return Result.SUCCESS(vo);
    }

    @Transactional
    public Result update(CmInfo vo){
        cmInfoDao.update(vo);
        return Result.SUCCESS(vo);
    }

    @Transactional
    public Result delete(int id){
        CmInfo vo = cmInfoDao.get(id);
        if(vo!=null){
            cmInfoDao.delete(id);
        }
    	return Result.SUCCESS();
    }
    
    public CmInfo get(int id){
    	return cmInfoDao.get(id);
    }

}
