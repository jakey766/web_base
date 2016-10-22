package com.pk.service.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.google.gson.reflect.TypeToken;

import com.pk.dao.admin.SysFieldDao;
import com.pk.framework.service.BaseService;
import com.pk.framework.util.JSONUtil;
import com.pk.framework.vo.Result;
import com.pk.model.admin.SysField;


@Service()
public class SysFieldService extends BaseService {

    private static final String KEY_LOAD_ALL = "SysFieldLoadAll";
    private static final String KEY_LOAD_MAP = "SysFieldLoadMAP";

    @Autowired
    private SysFieldDao sysFieldDao;
    
    public List<SysField> loadAll(){
        return sysFieldDao.loadAll();
    }

    public List<SysField> loadAllWithCache(){
        List<SysField> list = getFromCache(KEY_LOAD_ALL, List.class);
        if(list==null){
            list = sysFieldDao.loadAll();
            putIntoCache(KEY_LOAD_ALL, list);
        }
        return list;
    }

    public Map<String, SysField> getFieldMap(){
        Map<String, SysField> map = getFromCache(KEY_LOAD_MAP, Map.class);
        if(map==null){
            List<SysField> list = loadAllWithCache();
            map = new HashMap<String, SysField>();
            if(list!=null){
                for(SysField vo:list){
                    map.put(vo.getFname(), vo);
                }
            }
            putIntoCache(KEY_LOAD_MAP, map);
        }
        return map;
    }

    public SysField getByFname(String fname){
        return getFieldMap().get(fname);
    }

    @Transactional
    public Result update(String json){
    	List<SysField> list = JSONUtil.fromJson(json, new TypeToken<List<SysField>>() {});
    	for(SysField vo:list){
    		sysFieldDao.update(vo);
    	}
        removeCache();
        return Result.SUCCESS();
    }

    private void removeCache(){
        removeCache(KEY_LOAD_ALL);
        removeCache(KEY_LOAD_MAP);
    }
}
