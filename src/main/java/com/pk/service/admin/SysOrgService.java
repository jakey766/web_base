package com.pk.service.admin;

import com.pk.dao.admin.SysOrgDao;
import com.pk.framework.vo.Result;
import com.pk.model.admin.SysOrg;
import com.pk.vo.admin.SysOrgSearchVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service()
public class SysOrgService {

    @Autowired
    private SysOrgDao sysOrgDao;
    
    public Result list(SysOrgSearchVO svo){
    	return Result.SUCCESS(sysOrgDao.list(svo));
    }

    @Transactional
    public Result add(SysOrg vo){
        sysOrgDao.insert(vo);
        if(vo.getPid()>0){
            SysOrg tmp = sysOrgDao.get(vo.getPid());
            vo.setCode(tmp.getCode() + vo.getId() + ",");
        }else{
            vo.setCode("," + vo.getId() + ",");
        }
        sysOrgDao.updateCode(vo);
        return Result.SUCCESS(vo);
    }

    @Transactional
    public Result update(SysOrg vo){
        sysOrgDao.update(vo);
        return Result.SUCCESS(vo);
    }

    @Transactional
    public Result delete(int id){
        SysOrg vo = sysOrgDao.get(id);
        if(vo!=null){
            sysOrgDao.deleteByCode(vo.getCode());
        }
    	return Result.SUCCESS();
    }
    
    public SysOrg get(int id){
    	return sysOrgDao.get(id);
    }

}
