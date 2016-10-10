package com.pk.service.admin;

import com.pk.dao.admin.SysUserDao;
import com.pk.framework.vo.PageResultVO;
import com.pk.framework.vo.Result;
import com.pk.model.admin.SysUser;
import com.pk.vo.admin.SysUserSearchVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by jiangkunpeng on 16/9/23.
 */
@Service()
public class SysUserService {

    @Autowired
    private SysUserDao sysUserDao;
    
    public Result list(SysUserSearchVO svo){
    	PageResultVO page = new PageResultVO();
    	int count = sysUserDao.count(svo);
    	int totalPage = svo.getSize() < 1 ? 1 : (count + svo.getSize() - 1) / svo.getSize();
    	if(count > 0){
    		page.setList(sysUserDao.list(svo));
    	}
    	page.setCount(count);
    	page.setPage(svo.getPage());
    	page.setPageCount(totalPage);
    	
    	return Result.SUCCESS(page);
    }

    @Transactional
    public Result add(SysUser vo){
        SysUser tmp = sysUserDao.getByUsername(vo.getUsername());
        if(tmp!=null){
            return Result.FAILURE("已存在相同用户名");
        }
        sysUserDao.insert(vo);
        return Result.SUCCESS(vo);
    }

    @Transactional
    public Result update(SysUser vo){
        sysUserDao.update(vo);
        return Result.SUCCESS(vo);
    }

    @Transactional
    public Result delete(int id){
    	sysUserDao.delete(id);
    	return Result.SUCCESS();
    }
    
    public SysUser get(int id){
    	return sysUserDao.get(id);
    }

}
