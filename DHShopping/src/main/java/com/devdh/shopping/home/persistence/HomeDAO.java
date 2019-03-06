package com.devdh.shopping.home.persistence;

import java.util.List;

import com.devdh.shopping.home.domain.CategoryVO;
import com.devdh.shopping.product.domain.ProductVO;

public interface HomeDAO {

	public List<CategoryVO> getCategory();
	
	public List<ProductVO> selectShowMainProducts();
	
}
