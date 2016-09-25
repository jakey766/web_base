package com.pk.service.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pk.dao.admin.SysMenuDao;
import com.pk.framework.vo.PageResultVO;
import com.pk.framework.vo.Result;
import com.pk.model.admin.SysMenu;
import com.pk.vo.admin.SysMenuSearchVO;

@Service()
public class SysMenuService {

    @Autowired
    private SysMenuDao sysMenuDao;
    
    public Result list(SysMenuSearchVO svo){
    	PageResultVO page = new PageResultVO();
    	int count = sysMenuDao.count(svo);
    	int totalPage = svo.getSize() < 1 ? 1 : (count + svo.getSize() - 1) / svo.getSize();
    	if(count > 0){
    		page.setList(sysMenuDao.list(svo));
    	}
    	page.setCount(count);
    	page.setPage(svo.getPage());
    	page.setPageCount(totalPage);
    	
    	return Result.SUCCESS(page);
    }

    @Transactional
    public Result add(SysMenu vo){
        sysMenuDao.insert(vo);
        return Result.SUCCESS(vo);
    }

    @Transactional
    public Result update(SysMenu vo){
        sysMenuDao.update(vo);
        return Result.SUCCESS(vo);
    }

    @Transactional
    public Result delete(int id){
    	sysMenuDao.delete(id);
    	return Result.SUCCESS();
    }
    
    public SysMenu get(int id){
    	return sysMenuDao.get(id);
    }

}
