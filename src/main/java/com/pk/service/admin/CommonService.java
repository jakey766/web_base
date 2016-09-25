package com.pk.service.admin;

import com.pk.dao.admin.SysUserDao;
import com.pk.framework.cfg.Constants;
import com.pk.framework.util.CookieUtil;
import com.pk.framework.vo.Result;
import com.pk.model.admin.SysUser;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by jiangkunpeng on 16/9/23.
 */
@Service()
public class CommonService {

    private static Logger logger = Logger.getLogger(CommonService.class);

    @Autowired
    private SysUserDao sysUserDao;

    /**
     * 登录
     * @param request
     * @param response
     * @param username
     * @param password
     * @return
     */
    public Result login(HttpServletRequest request, HttpServletResponse response, String username, String password){
        try{
            SysUser user = sysUserDao.getByUsername(username);
            if(user == null){
                return Result.FAILURE("用户名或密码错误");
            }
            if(!user.getPassword().equals(password)){
                return Result.FAILURE("用户名或密码错误");
            }
            CookieUtil cookieUtil = new CookieUtil(request, response);
            cookieUtil.buildDomainByRequest();
            cookieUtil.setCookie(Constants.KEY_USER_ID, user.getId() + "");
            return Result.SUCCESS();
        }catch(Exception e){
            e.printStackTrace();
            logger.error("登录异常", e);
            return Result.FAILURE("后台异常");
        }
    }

    /**
     * 退出登录
     * @param request
     * @param response
     * @return
     */
    public Result logout(HttpServletRequest request, HttpServletResponse response){
        CookieUtil cookieUtil = new CookieUtil(request, response);
        cookieUtil.buildDomainByRequest();
        cookieUtil.deleteCookie(Constants.KEY_USER_ID);
        return Result.SUCCESS();
    }

}
