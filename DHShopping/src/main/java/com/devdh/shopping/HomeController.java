package com.devdh.shopping;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.devdh.shopping.home.domain.CategoryVO;
import com.devdh.shopping.home.service.HomeService;

/**
 * Handles requests for the application home page.
 */
@RestController
public class HomeController {

	@Inject
	HomeService service;
	
	@RequestMapping("/")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView("home");
		mav.addObject("main_products", service.getMainProducts());
		return mav;
	}
	
	@RequestMapping("/admin")
	public ModelAndView admin() {
		return new ModelAndView("admin/admin");
	}
	
	@RequestMapping("/blank")
	public ModelAndView blank() {
		return new ModelAndView("blank");
	}
	
	@RequestMapping("/popup/popup_ps")
	public ModelAndView popup() {
		return null;
	}
	
	@RequestMapping("/category")
	public List<CategoryVO> getCategory() {
		return service.getCategory();
	}
	
	
}
