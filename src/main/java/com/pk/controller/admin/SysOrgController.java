package com.pk.controller.admin;

import com.pk.framework.vo.Result;
import com.pk.model.admin.SysOrg;
import com.pk.service.admin.SysOrgService;
import com.pk.vo.admin.SysOrgSearchVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SysOrgController {
	
	@Autowired
	private SysOrgService sysOrgService;
	
	@RequestMapping(value = "/admin/org/list.jspx")
	public ModelAndView listJspx() {
		return new ModelAndView("forward:/admin/org/list.jsp");
	}
	
	@RequestMapping(value = "/admin/org/list.do")
	@ResponseBody
	public Result list(SysOrgSearchVO svo) {
		try{
			return sysOrgService.list(svo);
		}catch(Exception e){
			e.printStackTrace();
			return Result.FAILURE("后台异常:"+e.getMessage());
		}
	}
	
	@RequestMapping(value = "/admin/org/get.do")
	@ResponseBody
	public Result get(int id) {
		Result result = new Result();
		try{
			SysOrg vo = sysOrgService.get(id);
			result.setCode(Result.CODE_SUCCESS);
			result.setObject(vo);
		}catch(Exception e){
			e.printStackTrace();
			result.setCode(Result.CODE_FAILURE);
			result.setMessage("后台异常:"+e.getMessage());
		}
		return result;
	}
	
	@RequestMapping(value = "/admin/org/add.do")
	@ResponseBody
	public Result add(SysOrg vo) {
		try{
			return sysOrgService.add(vo);
		}catch(Exception e){
			e.printStackTrace();
			return Result.FAILURE("后台异常:"+e.getMessage());
		}
	}

	@RequestMapping(value = "/admin/org/update.do")
	@ResponseBody
	public Result update(SysOrg vo) {
		try{
			return sysOrgService.update(vo);
		}catch(Exception e){
			e.printStackTrace();
			return Result.FAILURE("后台异常:"+e.getMessage());
		}
	}

	@RequestMapping(value = "/admin/org/delete.do")
	@ResponseBody
	public Result delete(int id) {
		try{
			return sysOrgService.delete(id);
		}catch(Exception e){
			e.printStackTrace();
			return Result.FAILURE("后台异常:"+e.getMessage());
		}
	}
	
}