package com.pk.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pk.framework.cfg.Constants;
import com.pk.framework.util.CookieUtil;
import com.pk.framework.vo.Result;
import com.pk.service.admin.CommonService;

@Controller
public class CommonController {

	@Autowired
	private CommonService commonService;
	
	@RequestMapping(value = "/index.jspx")
	public ModelAndView indexJspx() {
		return new ModelAndView("forward:/index.jsp");
	}

	@RequestMapping(value = "/login.jspx")
	public ModelAndView loginJspx() {
		return new ModelAndView("forward:/login.jsp");
	}

	@RequestMapping(value = "/login.do")
	@ResponseBody
	public Result login(HttpServletRequest request, HttpServletResponse response, String username, String password) {
		return commonService.login(request, response, username, password);
	}

	@RequestMapping(value = "/logout.do")
	@ResponseBody
	public Result logout(HttpServletRequest request, HttpServletResponse response) {
		return commonService.logout(request, response);
	}
	
	@RequestMapping(value = "/common/menu.do")
	@ResponseBody
	public Result menu(HttpServletRequest request, HttpServletResponse response){
		try{
			int userId = 0;
			CookieUtil cookieUtil = new CookieUtil(request, response);
			cookieUtil.buildDomainByRequest();
			userId = cookieUtil.getInt(Constants.KEY_USER_ID);
			return commonService.loadMenus(userId);
		}catch(Exception e){
			e.printStackTrace();
			return Result.FAILURE("后台异常");
		}
	}
	
}