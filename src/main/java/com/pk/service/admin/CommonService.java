package com.pk.service.admin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pk.framework.cfg.UserInfoContext;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pk.dao.admin.SysRoleMenuDao;
import com.pk.dao.admin.SysUserDao;
import com.pk.framework.cfg.Constants;
import com.pk.framework.service.BaseService;
import com.pk.framework.util.CookieUtil;
import com.pk.framework.vo.Result;
import com.pk.model.admin.SysMenu;
import com.pk.model.admin.SysUser;
import com.pk.vo.admin.SysRoleMenuSearchVO;

/**
 * Created by jiangkunpeng on 16/9/23.
 */
@Service()
public class CommonService extends BaseService{

    private static Logger logger = Logger.getLogger(CommonService.class);

    @Autowired
    private SysUserDao sysUserDao;
    @Autowired
    private SysRoleMenuDao sysRoleMenuDao;

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
            cookieUtil.setCookie(Constants.KEY_USER_NAME, user.getName() + "");
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
        cookieUtil.deleteCookie(Constants.KEY_USER_NAME);

        int userId = UserInfoContext.getId();
        String cacheKey = Constants.KEY_USER_MENU + "_" +userId;
        removeCache(cacheKey);
        return Result.SUCCESS();
    }
    
    /**
     * 获取用户菜单
     * @param userId
     * @return
     */
    @SuppressWarnings("unchecked")
	public Result loadMenus(int userId){
    	List<SysMenu> list = null;
    	
    	String cacheKey = Constants.KEY_USER_MENU + "_" +userId;
		//先从缓存拿
//		try{
//			Object obj = getFromCache(cacheKey);
//			if(obj!=null){
//				list = (List<SysMenu>)obj;
//			}
//		}catch(Exception e){
//			e.printStackTrace();
//		}
		
		list = getFromCache(cacheKey, List.class);
		
    	if(list==null){
    		SysUser user = sysUserDao.get(userId);
    		if(user!=null){
    			String roleIds = user.getRoleIds();
				if(roleIds!=null&&roleIds.length()>0){
					String[] ridStrs = StringUtils.split(roleIds, ",");
					List<Integer> rids = new ArrayList<Integer>();
					for(String rid:ridStrs){
						rids.add(Integer.parseInt(rid));
					}
					SysRoleMenuSearchVO rsvo = new SysRoleMenuSearchVO();
					rsvo.setRoleIds(rids);
					rsvo.setIsMenu(1);
					list = sysRoleMenuDao.loadMenus(rsvo);

					//存缓存.......
					putIntoCache(cacheKey, list);
				}
    		}
    	}
    	return Result.SUCCESS(list);
    }

}
