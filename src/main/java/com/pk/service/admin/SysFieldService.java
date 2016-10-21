package com.pk.service.admin;

import java.util.List;

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

    @Autowired
    private SysFieldDao sysFieldDao;
    
    public List<SysField> loadAll(){
        return sysFieldDao.loadAll();
    }

    @Transactional
    public Result update(String json){
    	List<SysField> list = JSONUtil.fromJson(json, new TypeToken<List<SysField>>() {});
    	for(SysField vo:list){
    		sysFieldDao.update(vo);
    	}
        return Result.SUCCESS();
    }
}
