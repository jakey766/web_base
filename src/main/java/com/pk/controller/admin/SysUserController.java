package com.pk.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pk.framework.vo.Result;
import com.pk.model.admin.SysUser;
import com.pk.service.admin.SysUserService;
import com.pk.vo.admin.SysUserSearchVO;

@Controller
public class SysUserController {
	
	@Autowired
	private SysUserService sysUserService;
	
	@RequestMapping(value = "/admin/user/list.jspx")
	public ModelAndView listJspx() {
		return new ModelAndView("forward:/admin/user/list.jsp");
	}
	
	@RequestMapping(value = "/admin/user/list.do")
	@ResponseBody
	public Result list(SysUserSearchVO svo) {
		try{
			return sysUserService.list(svo);
		}catch(Exception e){
			e.printStackTrace();
			return Result.FAILURE("后台异常:"+e.getMessage());
		}
	}
	
	@RequestMapping(value = "/admin/user/get.do")
	@ResponseBody
	public Result get(int id) {
		Result result = new Result();
		try{
			SysUser vo = sysUserService.get(id);
			result.setCode(Result.CODE_SUCCESS);
			result.setObject(vo);
		}catch(Exception e){
			e.printStackTrace();
			result.setCode(Result.CODE_FAILURE);
			result.setMessage("后台异常:"+e.getMessage());
		}
		return result;
	}
	
	@RequestMapping(value = "/admin/user/add.do")
	@ResponseBody
	public Result add(SysUser vo) {
		try{
			return sysUserService.add(vo);
		}catch(Exception e){
			e.printStackTrace();
			return Result.FAILURE("后台异常:"+e.getMessage());
		}
	}

	@RequestMapping(value = "/admin/user/update.do")
	@ResponseBody
	public Result update(SysUser vo) {
		try{
			return sysUserService.update(vo);
		}catch(Exception e){
			e.printStackTrace();
			return Result.FAILURE("后台异常:"+e.getMessage());
		}
	}

	@RequestMapping(value = "/admin/user/delete.do")
	@ResponseBody
	public Result delete(int id) {
		try{
			return sysUserService.delete(id);
		}catch(Exception e){
			e.printStackTrace();
			return Result.FAILURE("后台异常:"+e.getMessage());
		}
	}
	
}