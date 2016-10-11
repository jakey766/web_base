package com.pk.controller.admin;

import com.pk.framework.vo.Result;
import com.pk.model.admin.SysDist;
import com.pk.service.admin.SysDistService;
import com.pk.vo.admin.SysDistSearchVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SysDistController {
	
	@Autowired
	private SysDistService sysDistService;
	
	@RequestMapping(value = "/admin/dist/list.jspx")
	public ModelAndView listJspx() {
		return new ModelAndView("forward:/admin/dist/list.jsp");
	}
	
	@RequestMapping(value = "/admin/dist/list.do")
	@ResponseBody
	public Result list(SysDistSearchVO svo) {
		try{
			return sysDistService.list(svo);
		}catch(Exception e){
			e.printStackTrace();
			return Result.FAILURE("后台异常:"+e.getMessage());
		}
	}
	
	@RequestMapping(value = "/admin/dist/get.do")
	@ResponseBody
	public Result get(int id) {
		Result result = new Result();
		try{
			SysDist vo = sysDistService.get(id);
			result.setCode(Result.CODE_SUCCESS);
			result.setObject(vo);
		}catch(Exception e){
			e.printStackTrace();
			result.setCode(Result.CODE_FAILURE);
			result.setMessage("后台异常:"+e.getMessage());
		}
		return result;
	}
	
	@RequestMapping(value = "/admin/dist/add.do")
	@ResponseBody
	public Result add(SysDist vo) {
		try{
			return sysDistService.add(vo);
		}catch(Exception e){
			e.printStackTrace();
			return Result.FAILURE("后台异常:"+e.getMessage());
		}
	}

	@RequestMapping(value = "/admin/dist/update.do")
	@ResponseBody
	public Result update(SysDist vo) {
		try{
			return sysDistService.update(vo);
		}catch(Exception e){
			e.printStackTrace();
			return Result.FAILURE("后台异常:"+e.getMessage());
		}
	}

	@RequestMapping(value = "/admin/dist/delete.do")
	@ResponseBody
	public Result delete(int id) {
		try{
			return sysDistService.delete(id);
		}catch(Exception e){
			e.printStackTrace();
			return Result.FAILURE("后台异常:"+e.getMessage());
		}
	}
	
}