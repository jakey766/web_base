package com.pk.controller.cm;

import javax.servlet.http.HttpServletRequest;

import com.pk.model.cm.CmInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pk.framework.vo.Result;
import com.pk.service.cm.CmInfoService;
import com.pk.vo.cm.CmInfoSearchVO;

import java.util.HashMap;
import java.util.Map;

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

	private Map<String, String> getParameterMap(HttpServletRequest request){
		Map<String, String[]> maps = request.getParameterMap();
		Map<String, String> map = new HashMap<String, String>();
		String[] val = null;
		for(Map.Entry<String, String[]> entry : maps.entrySet()){
			val = entry.getValue();
			if(val!=null&&val.length>0)
				map.put(entry.getKey(), val[0]);
		}
		return map;
	}
	
}
