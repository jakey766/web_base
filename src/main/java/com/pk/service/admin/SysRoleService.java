package com.pk.service.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pk.dao.admin.SysRoleDao;
import com.pk.dao.admin.SysRoleMenuDao;
import com.pk.framework.vo.PageResultVO;
import com.pk.framework.vo.PageSearchVO;
import com.pk.framework.vo.Result;
import com.pk.model.admin.SysRole;
import com.pk.model.admin.SysRoleMenu;
import com.pk.vo.admin.SysRoleMenuSearchVO;

@Service()
public class SysRoleService {

    @Autowired
    private SysRoleDao sysRoleDao;
    
    @Autowired
    private SysRoleMenuDao sysRoleMenuDao;

	public List<SysRole> loadAll(){
		return sysRoleDao.list(new PageSearchVO());
	}
    
    public Result list(PageSearchVO svo){
    	PageResultVO page = new PageResultVO();
    	int count = sysRoleDao.count(svo);
    	int totalPage = svo.getSize() < 1 ? 1 : (count + svo.getSize() - 1) / svo.getSize();
    	if(count > 0){
    		page.setList(sysRoleDao.list(svo));
    	}
    	page.setCount(count);
    	page.setPage(svo.getPage());
    	page.setPageCount(totalPage);
    	
    	return Result.SUCCESS(page);
    }

    @Transactional
    public Result add(SysRole role, String menus){
        sysRoleDao.insert(role);
        persistRoleMenu(role, menus);
        return Result.SUCCESS(role);
    }

    @Transactional
    public Result update(SysRole role, String menus){
        sysRoleDao.update(role);
        persistRoleMenu(role, menus);
        return Result.SUCCESS(role);
    }

    @Transactional
    public Result delete(int id){
    	sysRoleDao.delete(id);
    	return Result.SUCCESS();
    }
    
    public SysRole get(int id){
    	return sysRoleDao.get(id);
    }
    
    /**
     * 更新角色-菜单关联
     * @param role
     * @param menus
     */
    private void persistRoleMenu(SysRole role, String menus){
    	String[] ids = StringUtils.split(menus, ",");
    	List<SysRoleMenu> list = new ArrayList<SysRoleMenu>();
    	for(String id:ids){
    		if(id.length()<1)
    			continue;
    		SysRoleMenu rmenu = new SysRoleMenu();
    		rmenu.setRoleId(role.getId());
    		rmenu.setMenuId(Integer.parseInt(id));
    		list.add(rmenu);
    	}
    	sysRoleMenuDao.deleteByRoleId(role.getId());
    	sysRoleMenuDao.insertBatch(list);
    }
    
    public Map<String, Object> getWithMenuIds(int id) {
		SysRole role = sysRoleDao.get(id);
		if(role==null)
			return null;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("role", role);
		
		List<Integer> roleIds = new ArrayList<Integer>();
		roleIds.add(role.getId());
		SysRoleMenuSearchVO svo = new SysRoleMenuSearchVO();
		svo.setRoleIds(roleIds);
		
		List<SysRoleMenu> menus = sysRoleMenuDao.search(svo);
		List<Integer> menuIds = new ArrayList<Integer>();
		if(menus!=null){
			for(SysRoleMenu menu:menus){
				menuIds.add(menu.getMenuId());
			}
		}
		map.put("menuIds", menuIds);
		
		roleIds = null;
		menus = null;
		role = null;
		svo = null;
		return map;
	}

}
