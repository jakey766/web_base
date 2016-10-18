package com.pk.service.admin;

import com.pk.dao.admin.SysTreeDao;
import com.pk.framework.service.BaseService;
import com.pk.framework.vo.Result;
import com.pk.model.admin.SysTree;
import com.pk.vo.admin.SysTreeSearchVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service()
public class SysTreeService extends BaseService {

    private static final String KEY_TYPE_LIST = "SysTreeList:%s";
    private static final String KEY_TYPE_KEY_GET = "SysTreeGet:%s";

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

    /**
     * 通过类型获取树字典
     * @param type
     * @return
     */
    public List<SysTree> loadByType(String type){
        List<SysTree> list = null;
        String cacheKey = String.format(KEY_TYPE_LIST, type);
        list = getFromCache(cacheKey, List.class);
        if(list==null){
            SysTreeSearchVO svo = new SysTreeSearchVO();
            svo.setType(type);
            list = sysTreeDao.list(svo);
            putIntoCache(cacheKey, list);
        }
        return list;
    }

    /**
     * 使用缓存获取,如果有缓存的话
     * @param id
     * @return
     */
    public SysTree getWithCache(int id){
        String cacheKey = String.format(KEY_TYPE_KEY_GET, id);
        SysTree vo = getFromCache(cacheKey, SysTree.class);
        if(vo==null){
            vo = sysTreeDao.get(id);
            putIntoCache(cacheKey, vo);
        }
        return vo;
    }

    /**
     * 获取树显示名称
     * @param id
     * @return
     */
    public String getTreeName(int id){
        SysTree vo = getWithCache(id);
        if(vo!=null)
            return vo.getName();
        return null;
    }
}
