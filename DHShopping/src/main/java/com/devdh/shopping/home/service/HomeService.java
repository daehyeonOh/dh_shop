package com.devdh.shopping.home.service;

import java.util.List;

import com.devdh.shopping.home.domain.CategoryVO;
import com.devdh.shopping.product.domain.ProductVO;

public interface HomeService {

	public List<CategoryVO> getCategory();

	public List<ProductVO> getMainProducts();
}
