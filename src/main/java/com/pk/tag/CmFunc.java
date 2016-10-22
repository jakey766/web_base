package com.pk.tag;

import com.pk.framework.spring.SpringContextUtil;
import com.pk.model.admin.SysDist;
import com.pk.model.admin.SysOrg;
import com.pk.model.admin.SysTree;
import com.pk.service.admin.SysDistService;
import com.pk.service.admin.SysOrgService;
import com.pk.service.admin.SysTreeService;

import java.util.List;

/**
 * Created by jiangkunpeng on 16/10/22.
 */
final public class CmFunc {

    /**
     * 获取字典项
     * @param type
     * @return
     */
    public static List<SysDist> loadDist(String type){
        List<SysDist> list = null;
        SysDistService sysDistService = SpringContextUtil.getBean(SysDistService.class);
        if(sysDistService!=null)
            list = sysDistService.loadByType(type);
        return list;
    }

    /**
     * 获取组织机构
     * @param pid
     * @return
     */
    public static List<SysOrg> loadOrg(String pid){
        List<SysOrg> list = null;
        int _pid = Integer.parseInt(pid);
        if(_pid==-1)
            return null;
        SysOrgService sysOrgService = SpringContextUtil.getBean(SysOrgService.class);
        if(sysOrgService!=null)
            list = sysOrgService.loadByPid(_pid);
        return list;
    }

    /**
     * 获取树字典
     * @param type
     * @param pid
     * @return
     */
    public static List<SysTree> loadTree(String type, String pid){
        List<SysTree> list = null;
        int _pid = Integer.parseInt(pid);
        if(_pid==-1)
            return null;
        SysTreeService sysTreeService = SpringContextUtil.getBean(SysTreeService.class);
        if(sysTreeService!=null)
            list = sysTreeService.loadByTypeAndPid(type, _pid);
        return list;
    }

}
