package com.pk.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {
	
	@RequestMapping(value = "/admin/user/list.jspx")
	public ModelAndView index() {
		return new ModelAndView("forward:/admin/user/list.jsp");
	}
	
}