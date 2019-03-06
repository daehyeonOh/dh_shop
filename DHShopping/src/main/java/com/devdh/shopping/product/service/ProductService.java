package com.devdh.shopping.product.service;

import org.springframework.web.servlet.ModelAndView;

import com.devdh.shopping.commons.paging.ProductCriteria;

public interface ProductService {

	public ModelAndView getProductList(ProductCriteria criteria);
	
	public int countProduct(String category);

	public int countProductForSearch(String keyword);
	
}
