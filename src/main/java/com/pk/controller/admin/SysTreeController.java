package com.pk.controller.admin;

import com.pk.framework.vo.Result;
import com.pk.model.admin.SysTree;
import com.pk.service.admin.SysTreeService;
import com.pk.vo.admin.SysTreeSearchVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SysTreeController {
	
	@Autowired
	private SysTreeService sysTreeService;
	
	@RequestMapping(value = "/admin/tree/list.jspx")
	public ModelAndView listJspx() {
		return new ModelAndView("forward:/admin/tree/list.jsp");
	}
	
	@RequestMapping(value = "/admin/tree/list.do")
	@ResponseBody
	public Result list(SysTreeSearchVO svo) {
		try{
			return sysTreeService.list(svo);
		}catch(Exception e){
			e.printStackTrace();
			return Result.FAILURE("后台异常:"+e.getMessage());
		}
	}
	
	@RequestMapping(value = "/admin/tree/get.do")
	@ResponseBody
	public Result get(int id) {
		Result result = new Result();
		try{
			SysTree vo = sysTreeService.get(id);
			result.setCode(Result.CODE_SUCCESS);
			result.setObject(vo);
		}catch(Exception e){
			e.printStackTrace();
			result.setCode(Result.CODE_FAILURE);
			result.setMessage("后台异常:"+e.getMessage());
		}
		return result;
	}
	
	@RequestMapping(value = "/admin/tree/add.do")
	@ResponseBody
	public Result add(SysTree vo) {
		try{
			return sysTreeService.add(vo);
		}catch(Exception e){
			e.printStackTrace();
			return Result.FAILURE("后台异常:"+e.getMessage());
		}
	}

	@RequestMapping(value = "/admin/tree/update.do")
	@ResponseBody
	public Result update(SysTree vo) {
		try{
			return sysTreeService.update(vo);
		}catch(Exception e){
			e.printStackTrace();
			return Result.FAILURE("后台异常:"+e.getMessage());
		}
	}

	@RequestMapping(value = "/admin/tree/delete.do")
	@ResponseBody
	public Result delete(int id) {
		try{
			return sysTreeService.delete(id);
		}catch(Exception e){
			e.printStackTrace();
			return Result.FAILURE("后台异常:"+e.getMessage());
		}
	}
	
}