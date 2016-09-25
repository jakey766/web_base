package com.pk.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pk.framework.vo.Result;
import com.pk.model.admin.SysMenu;
import com.pk.service.admin.SysMenuService;
import com.pk.vo.admin.SysMenuSearchVO;

@Controller
public class SysMenuController {
	
	@Autowired
	private SysMenuService sysMenuService;
	
	@RequestMapping(value = "/admin/menu/list.jspx")
	public ModelAndView listJspx() {
		return new ModelAndView("forward:/admin/menu/list.jsp");
	}
	
	@RequestMapping(value = "/admin/menu/list.do")
	@ResponseBody
	public Result list(SysMenuSearchVO svo) {
		try{
			return sysMenuService.list(svo);
		}catch(Exception e){
			e.printStackTrace();
			return Result.FAILURE("后台异常:"+e.getMessage());
		}
	}
	
	@RequestMapping(value = "/admin/menu/get.do")
	@ResponseBody
	public Result get(int id) {
		Result result = new Result();
		try{
			SysMenu vo = sysMenuService.get(id);
			result.setCode(Result.CODE_SUCCESS);
			result.setObject(vo);
		}catch(Exception e){
			e.printStackTrace();
			result.setCode(Result.CODE_FAILURE);
			result.setMessage("后台异常:"+e.getMessage());
		}
		return result;
	}
	
	@RequestMapping(value = "/admin/menu/add.do")
	@ResponseBody
	public Result add(SysMenu vo) {
		try{
			return sysMenuService.add(vo);
		}catch(Exception e){
			e.printStackTrace();
			return Result.FAILURE("后台异常:"+e.getMessage());
		}
	}

	@RequestMapping(value = "/admin/menu/update.do")
	@ResponseBody
	public Result update(SysMenu vo) {
		try{
			return sysMenuService.update(vo);
		}catch(Exception e){
			e.printStackTrace();
			return Result.FAILURE("后台异常:"+e.getMessage());
		}
	}

	@RequestMapping(value = "/admin/menu/delete.do")
	@ResponseBody
	public Result delete(int id) {
		try{
			return sysMenuService.delete(id);
		}catch(Exception e){
			e.printStackTrace();
			return Result.FAILURE("后台异常:"+e.getMessage());
		}
	}
	
}