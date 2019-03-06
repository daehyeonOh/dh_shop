package com.devdh.shopping.product.persistence;

import java.util.List;
import java.util.Map;

import com.devdh.shopping.commons.paging.ProductCriteria;
import com.devdh.shopping.product.domain.ProductVO;

public interface ProductDAO {

	public List<ProductVO> selectProductList(ProductCriteria criteria);
		
	public int countProduct(String category);

	public int countProductForSearch(String keyword);
	
	public List<Map<String, Object>> parentCategoryCountProduct(String parent);
	
	public List<ProductVO> selectParentCategoryProduct(ProductCriteria criteria);
	
}
