package com.pk.service.admin;

import com.pk.dao.admin.SysUserDao;
import com.pk.framework.vo.Result;
import com.pk.mode.admin.SysUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by jiangkunpeng on 16/9/23.
 */
@Service
public class SysUserService {

    @Autowired
    private SysUserDao sysUserDao;

    private Result add(SysUser vo){
        SysUser tmp = sysUserDao.getByUsername(vo.getUsername());
        if(tmp!=null){
            return Result.FAILURE("已存在相同用户名");
        }
        sysUserDao.insert(vo);
        return Result.SUCCESS(vo);
    }

}
