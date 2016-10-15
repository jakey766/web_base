package com.pk.service.admin;

import com.pk.dao.admin.SysTreeDao;
import com.pk.framework.vo.Result;
import com.pk.model.admin.SysTree;
import com.pk.vo.admin.SysTreeSearchVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service()
public class SysTreeService {

    @Autowired
    private SysTreeDao sysTreeDao;
    
    public Result list(SysTreeSearchVO svo){
    	return Result.SUCCESS(sysTreeDao.list(svo));
    }

    private boolean exist(SysTree vo){
        SysTreeSearchVO svo = new SysTreeSearchVO();
        svo.setPid(vo.getPid());
        svo.setName(vo.getName());
        List<SysTree> list = sysTreeDao.list(svo);
        if(list!=null&&list.size()>0){
            SysTree exist = list.get(0);
            if(exist.getId()!=vo.getId())
                return true;
        }
        return false;
    }

    @Transactional
    public Result add(SysTree vo){
        if(exist(vo)){
            return Result.FAILURE("已存在相同名称:" + vo.getName());
        }
        sysTreeDao.insert(vo);
        if(vo.getPid()>0){
            SysTree tmp = sysTreeDao.get(vo.getPid());
            vo.setCode(tmp.getCode() + vo.getId() + ",");
        }else{
            vo.setCode("," + vo.getId() + ",");
        }
        sysTreeDao.updateCode(vo);
        return Result.SUCCESS(vo);
    }

    @Transactional
    public Result update(SysTree vo){
        if(exist(vo)){
            return Result.FAILURE("已存在相同名称:" + vo.getName());
        }
        sysTreeDao.update(vo);
        return Result.SUCCESS(vo);
    }

    @Transactional
    public Result delete(int id){
        SysTree vo = sysTreeDao.get(id);
        if(vo!=null){
            sysTreeDao.deleteByCode(vo.getCode());
        }
    	return Result.SUCCESS();
    }
    
    public SysTree get(int id){
    	return sysTreeDao.get(id);
    }

}
