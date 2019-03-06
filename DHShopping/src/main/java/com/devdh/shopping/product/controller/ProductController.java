package com.devdh.shopping.product.controller;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.devdh.shopping.commons.paging.ProductCriteria;
import com.devdh.shopping.product.service.ProductService;

@RestController
@RequestMapping("/product")
public class ProductController {

	@Inject
	ProductService service;
	
	@RequestMapping()
	public ModelAndView productList(ProductCriteria criteria) {
		return service.getProductList(criteria);
	}
	
	
}
