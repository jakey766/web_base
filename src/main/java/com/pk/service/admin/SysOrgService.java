package com.pk.service.admin;

import com.pk.dao.admin.SysOrgDao;
import com.pk.framework.vo.Result;
import com.pk.model.admin.SysOrg;
import com.pk.vo.admin.SysOrgSearchVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service()
public class SysOrgService {

    @Autowired
    private SysOrgDao sysOrgDao;
    
    public Result list(SysOrgSearchVO svo){
    	return Result.SUCCESS(sysOrgDao.list(svo));
    }

    private boolean exist(SysOrg vo){
        SysOrgSearchVO svo = new SysOrgSearchVO();
        svo.setPid(vo.getPid());
        svo.setName(vo.getName());
        List<SysOrg> list = sysOrgDao.list(svo);
        if(list!=null&&list.size()>0){
            SysOrg exist = list.get(0);
            if(exist.getId()!=vo.getId())
                return true;
        }
        return false;
    }

    @Transactional
    public Result add(SysOrg vo){
        if(exist(vo)){
            return Result.FAILURE("已存在相同名称:" + vo.getName());
        }
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
        if(exist(vo)){
            return Result.FAILURE("已存在相同名称:" + vo.getName());
        }
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
