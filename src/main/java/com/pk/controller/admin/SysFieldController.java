package com.pk.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pk.framework.vo.Result;
import com.pk.service.admin.SysFieldService;

@Controller
public class SysFieldController {
	
	@Autowired
	private SysFieldService sysFieldService;
	
	@RequestMapping(value = "/admin/field/list.jspx")
	public ModelAndView listJspx() {
		return new ModelAndView("forward:/admin/field/list.jsp");
	}
	
	@RequestMapping(value = "/admin/field/loadAll.do")
	@ResponseBody
	public Result list() {
		try{
			return Result.SUCCESS(sysFieldService.loadAll());
		}catch(Exception e){
			e.printStackTrace();
			return Result.FAILURE("后台异常:"+e.getMessage());
		}
	}
	@RequestMapping(value = "/admin/field/update.do")
	@ResponseBody
	public Result update(String json) {
		try{
			return sysFieldService.update(json);
		}catch(Exception e){
			e.printStackTrace();
			return Result.FAILURE("后台异常:"+e.getMessage());
		}
	}
}