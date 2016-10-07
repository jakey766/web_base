package com.pk.controller.cm;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CmController {
	
	@RequestMapping(value = "/cm/list.jspx")
	public ModelAndView listJspx() {
		return new ModelAndView("forward:/cm/list.jsp");
	}

	@RequestMapping(value = "/cm/edit.jspx")
	public ModelAndView editJspx(int id) {
		return new ModelAndView("forward:/cm/edit.jsp");
	}
	
}
