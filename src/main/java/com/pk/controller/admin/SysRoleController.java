package com.pk.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pk.framework.vo.PageSearchVO;
import com.pk.framework.vo.Result;
import com.pk.model.admin.SysRole;
import com.pk.service.admin.SysRoleService;

@Controller
public class SysRoleController {
	
	@Autowired
	private SysRoleService sysRoleService;
	
	@RequestMapping(value = "/admin/role/list.jspx")
	public ModelAndView listJspx() {
		return new ModelAndView("forward:/admin/role/list.jsp");
	}

	@RequestMapping(value = "/admin/role/loadAll.do")
	@ResponseBody
	public Result loadAllRole() {
		Result result = new Result();
		try{
			result.setCode(Result.CODE_SUCCESS);
			result.setObject(sysRoleService.loadAll());
		}catch(Exception e){
			e.printStackTrace();
			result.setCode(Result.CODE_FAILURE);
			result.setMessage("后台异常:" + e.getMessage());
		}
		return result;
	}
	
	@RequestMapping(value = "/admin/role/list.do")
	@ResponseBody
	public Result list(PageSearchVO svo) {
		try{
			return sysRoleService.list(svo);
		}catch(Exception e){
			e.printStackTrace();
			return Result.FAILURE("后台异常:"+e.getMessage());
		}
	}
	
	@RequestMapping(value = "/admin/role/get.do")
	@ResponseBody
	public Result get(int id) {
		Result result = new Result();
		try{
			SysRole vo = sysRoleService.get(id);
			result.setCode(Result.CODE_SUCCESS);
			result.setObject(vo);
		}catch(Exception e){
			e.printStackTrace();
			result.setCode(Result.CODE_FAILURE);
			result.setMessage("后台异常:"+e.getMessage());
		}
		return result;
	}
	
	@RequestMapping(value = "/admin/role/getWithMenuIds.do")
    @ResponseBody
    public Result getWithMenuIds(int id) {
        Result result = new Result();
        try{
        	result.setCode(Result.CODE_SUCCESS);
            result.setObject(sysRoleService.getWithMenuIds(id));
        }catch(Exception e){
            e.printStackTrace();
            result.setCode(Result.CODE_FAILURE);
            result.setMessage("后台异常:"+e.getMessage());
        }
        return result;
    }
	
	@RequestMapping(value = "/admin/role/add.do")
	@ResponseBody
	public Result add(SysRole role, String menus) {
		try{
			return sysRoleService.add(role, menus);
		}catch(Exception e){
			e.printStackTrace();
			return Result.FAILURE("后台异常:"+e.getMessage());
		}
	}

	@RequestMapping(value = "/admin/role/update.do")
	@ResponseBody
	public Result update(SysRole role, String menus) {
		try{
			return sysRoleService.update(role, menus);
		}catch(Exception e){
			e.printStackTrace();
			return Result.FAILURE("后台异常:"+e.getMessage());
		}
	}

	@RequestMapping(value = "/admin/role/delete.do")
	@ResponseBody
	public Result delete(int id) {
		try{
			return sysRoleService.delete(id);
		}catch(Exception e){
			e.printStackTrace();
			return Result.FAILURE("后台异常:"+e.getMessage());
		}
	}
	
}