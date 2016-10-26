package com.pk.controller.cm;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pk.model.admin.SysField;
import com.pk.model.cm.CmInfo;
import com.pk.service.admin.SysOrgService;
import com.pk.service.admin.SysTreeService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pk.framework.vo.Result;
import com.pk.service.cm.CmInfoService;
import com.pk.vo.cm.CmInfoSearchVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CmInfoController {
	
	@Autowired
	private CmInfoService cmInfoService;
	@Autowired
	private SysOrgService sysOrgService;
	@Autowired
	private SysTreeService sysTreeService;
	
	@RequestMapping(value = "/cm/list.jspx")
	public ModelAndView listJspx() {
		ModelAndView model = new ModelAndView("forward:/cm/list.jsp");
		model.addObject("fields", getMyFields());
		return model;
	}

	@RequestMapping(value = "/cm/edit.jspx")
	public ModelAndView editJspx(int id) {
		ModelAndView model = new ModelAndView("forward:/cm/edit.jsp?id="+id);
		model.addObject("fields", getMyFields());
		return model;
	}
	
	@RequestMapping(value = "/cm/add.jspx")
	public ModelAndView addJspx() {
		ModelAndView model = new ModelAndView("forward:/cm/add.jsp");
		model.addObject("fields", getMyFields());
		return model;
	}

	@RequestMapping(value = "/cm/imp.jspx")
	public ModelAndView impJspx() {
		return new ModelAndView("forward:/cm/imp.jsp");
	}
	
	@RequestMapping(value = "/cm/detail.jspx")
	public ModelAndView detailJspx(int id) {
		ModelAndView model = new ModelAndView("forward:/cm/detail.jsp?id="+id);
		model.addObject("fields", getMyFields());
		return model;
	}
	
	@RequestMapping(value = "/cm/list.do")
	@ResponseBody
	public Result list(CmInfoSearchVO svo, HttpServletRequest request) {
		try{
			svo.setMap(getParameterMap(request));
			return cmInfoService.list(svo);
		}catch(Exception e){
			e.printStackTrace();
			return Result.FAILURE("后台异常:"+e.getMessage());
		}
	}

	@RequestMapping(value = "/cm/get.do")
	@ResponseBody
	public Result get(int id) {
		try{
			return Result.SUCCESS(cmInfoService.get(id));
		}catch(Exception e){
			e.printStackTrace();
			return Result.FAILURE("后台异常:"+e.getMessage());
		}
	}

	@RequestMapping(value = "/cm/add.do")
	@ResponseBody
	public Result add(CmInfo vo) {
		try{
			return cmInfoService.add(vo);
		}catch(Exception e){
			e.printStackTrace();
			return Result.FAILURE("后台异常:"+e.getMessage());
		}
	}

	@RequestMapping(value = "/cm/update.do")
	@ResponseBody
	public Result update(CmInfo vo) {
		try{
			return cmInfoService.update(vo);
		}catch(Exception e){
			e.printStackTrace();
			return Result.FAILURE("后台异常:"+e.getMessage());
		}
	}

	@RequestMapping(value = "/cm/delete.do")
	@ResponseBody
	public Result delete(int id) {
		try{
			return cmInfoService.delete(id);
		}catch(Exception e){
			e.printStackTrace();
			return Result.FAILURE("后台异常:"+e.getMessage());
		}
	}

	@RequestMapping(value = "/cm/imp.do")
	@ResponseBody
	public ModelAndView imp(@RequestParam("file") MultipartFile multipartFile, int type) {
		Result result = null;
		try{
			result = cmInfoService.imp(multipartFile, type);
		}catch(Exception e){
			e.printStackTrace();
			result = Result.FAILURE("后台异常");
		}
		ModelAndView model = new ModelAndView("forward:/cm/impResult.jsp");
		model.addObject("result", result);
		return model;
	}
	
	@RequestMapping(value = "/cm/exp.do")
	@ResponseBody
	public Result exp(CmInfoSearchVO svo, HttpServletRequest request,HttpServletResponse response) {
		Result result = null;
		try{
			svo.setMap(getParameterMap(request));
			result = cmInfoService.exp(svo, request, response);
		}catch(Exception e){
			e.printStackTrace();
			result = Result.FAILURE("后台异常");
		}
		return result;
	}

	@RequestMapping(value = "/cm/loadOrgs.do")
	@ResponseBody
	public Result loadOrgs(int pid) {
		try{
			return Result.SUCCESS(sysOrgService.loadByPid(pid));
		}catch(Exception e){
			e.printStackTrace();
			return Result.FAILURE("后台异常:"+e.getMessage());
		}
	}

	@RequestMapping(value = "/cm/loadTrees.do")
	@ResponseBody
	public Result loadTrees(int pid) {
		try{
			return Result.SUCCESS(sysTreeService.loadByPid(pid));
		}catch(Exception e){
			e.printStackTrace();
			return Result.FAILURE("后台异常:"+e.getMessage());
		}
	}

	/**
	 * 获取我可见的字段
	 * @return
	 */
	private List<SysField> getMyFields(){
		return cmInfoService.getMyFields();
	}

	private Map<String, String> getParameterMap(HttpServletRequest request){
		Map<String, String[]> maps = request.getParameterMap();
		Map<String, String> map = new HashMap<String, String>();
		String[] val = null;
		if(maps!=null){
			for(Map.Entry<String, String[]> entry : maps.entrySet()){
				val = entry.getValue();
				if(val!=null&&val.length>0)
					map.put(entry.getKey(), val[0]);
			}
		}
		return map;
	}
	
}
