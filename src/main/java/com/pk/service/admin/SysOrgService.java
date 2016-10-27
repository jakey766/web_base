package com.pk.service.admin;

import com.pk.dao.admin.SysOrgDao;
import com.pk.dao.admin.SysUserDao;
import com.pk.framework.service.BaseService;
import com.pk.framework.vo.Result;
import com.pk.model.admin.SysOrg;
import com.pk.model.admin.SysUser;
import com.pk.vo.admin.SysOrgSearchVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


@Service()
public class SysOrgService extends BaseService {

    private static final String KEY_PID_LIST = "SysOrgPidList:%s";
    private static final String KEY_PID_LIST_UID = "SysOrgPidUidList:%s:%s";
    private static final String KEY_GET = "SysOrgGet:%s";
    private static final String KEY_GET_UID = "SysOrgUidGet:%s";

    @Autowired
    private SysOrgDao sysOrgDao;
    
    @Autowired
    private SysUserDao sysUserDao;
    
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
        removeCache(vo, false, true);
        return Result.SUCCESS(vo);
    }

    @Transactional
    public Result update(SysOrg vo){
        if(exist(vo)){
            return Result.FAILURE("已存在相同名称:" + vo.getName());
        }
        sysOrgDao.update(vo);
        removeCache(vo, true, true);
        return Result.SUCCESS(vo);
    }

    @Transactional
    public Result delete(int id){
        SysOrg vo = sysOrgDao.get(id);
        if(vo!=null){
            SysOrgSearchVO svo = new SysOrgSearchVO();
            svo.setCodePrefix(vo.getCode());
            List<SysOrg> list = sysOrgDao.list(svo);
            sysOrgDao.deleteByCode(vo.getCode());
            removeCache(vo, true, true);
            if(list!=null){
                for(SysOrg _vo:list){
                    removeCache(_vo, true, true);
                }
            }
        }
    	return Result.SUCCESS();
    }
    
    public SysOrg get(int id){
    	return sysOrgDao.get(id);
    }

    public String getOrgName(int id){
        SysOrg vo = getWithCache(id);
        if(vo!=null)
            return vo.getName();
        return null;
    }

    /**
     * 使用缓存获取,如果有缓存的话
     * @param id
     * @return
     */
    public SysOrg getWithCache(int id){
        String cacheKey = String.format(KEY_GET, id);
        SysOrg vo = getFromCache(cacheKey, SysOrg.class);
        if(vo==null){
            vo = sysOrgDao.get(id);
            putIntoCache(cacheKey, vo);
        }
        return vo;
    }

    /**
     * 通过父ID获取组织机构
     * @param pid
     * @return
     */
    public List<SysOrg> loadByPid(int pid){
        List<SysOrg> list = null;
        String cacheKey = String.format(KEY_PID_LIST, pid);
        list = getFromCache(cacheKey, List.class);
        if(list==null){
            SysOrgSearchVO svo = new SysOrgSearchVO();
            svo.setPid(pid);
            list = sysOrgDao.list(svo);
            putIntoCache(cacheKey, list);
        }
        return list;
    }
    
    /**
     * 通过父ID获取用户可见的组织机构
     * @param pid
     * @return
     */
    public List<SysOrg> loadByPidAndUserId(int pid, int userId){
        List<SysOrg> list = null;
        String cacheKey = String.format(KEY_PID_LIST_UID, pid, userId);
//        list = getFromCache(cacheKey, List.class);
        if(list==null){
            SysOrgSearchVO svo = new SysOrgSearchVO();
            svo.setPid(pid);
            svo.setCodes(getUserOrgCodes(userId));
            list = sysOrgDao.list(svo);
            putIntoCache(cacheKey, list);
        }
        return list;
    }
    
    /**
     * 获取用户可见的机构编码集合
     * @param userId
     * @return
     */
    public List<String> getUserOrgCodes(int userId){
    	List<String> list = null;
    	String cacheKey = String.format(KEY_GET_UID, userId);
//    	list = getFromCache(cacheKey, List.class);
    	if(list==null){
    		SysUser user = sysUserDao.get(userId);
    		if(user!=null){
    			String oids = user.getOrgIds();
    			if(oids!=null&&oids.length()>0){
    				SysOrg org = null;
    				String[] oidArr = StringUtils.split(oids, ",");
    				Set<String> set = new HashSet<String>();
    				for(String oid:oidArr){
    					if(oid.length()<1)
    						continue;
    					org = sysOrgDao.get(Integer.parseInt(oid));
    					if(org!=null){
    						set.add(org.getCode());
    					}
    				}
    				if(!set.isEmpty()){
    					list = new ArrayList<String>();
    					list.addAll(set);
    					putIntoCache(cacheKey, list);
    				}
    			}
    		}
    	}
    	return list;
    }

    /**
     * 删除缓存
     * @param vo
     * @param single
     * @param list
     */
    private void removeCache(SysOrg vo, boolean single, boolean list){
        if(single){
            String cacheKey = String.format(KEY_GET, vo.getId());
            removeCache(cacheKey);
        }
        if(list){
            String cacheKey = String.format(KEY_PID_LIST, vo.getPid());
            removeCache(cacheKey);
        }
    }

}
