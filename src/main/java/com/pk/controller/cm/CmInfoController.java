package com.pk.controller.cm;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pk.framework.vo.Result;
import com.pk.service.cm.CmInfoService;
import com.pk.vo.cm.CmInfoSearchVO;

@Controller
public class CmInfoController {
	
	@Autowired
	private CmInfoService cmInfoService;
	
	@RequestMapping(value = "/cm/list.jspx")
	public ModelAndView listJspx() {
		return new ModelAndView("forward:/cm/list.jsp");
	}

	@RequestMapping(value = "/cm/edit.jspx")
	public ModelAndView editJspx(int id) {
		return new ModelAndView("forward:/cm/edit.jsp?id="+id);
	}
	
	@RequestMapping(value = "/cm/add.jspx")
	public ModelAndView addJspx() {
		return new ModelAndView("forward:/cm/add.jsp");
	}
	
	@RequestMapping(value = "/cm/detail.jspx")
	public ModelAndView detailJspx(int id) {
		return new ModelAndView("forward:/cm/detail.jsp?id="+id);
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/cm/list.do")
	@ResponseBody
	public Result list(CmInfoSearchVO svo, HttpServletRequest request) {
		try{
			svo.setMap(request.getParameterMap());
			return cmInfoService.list(svo);
		}catch(Exception e){
			e.printStackTrace();
			return Result.FAILURE("后台异常:"+e.getMessage());
		}
	}
	
}
