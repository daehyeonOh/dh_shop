package com.devdh.shopping.product.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.devdh.shopping.commons.paging.PageMaker;
import com.devdh.shopping.commons.paging.ProductCriteria;
import com.devdh.shopping.product.persistence.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService {

	@Inject
	ProductDAO dao;

	@Transactional
	@Override
	public ModelAndView getProductList(ProductCriteria criteria) {
		
		ModelAndView mav = new ModelAndView("product/list");
		
		int countProduct = 0;
		
		String parentCateCd = "001";
		
		String cateCd = criteria.getCateCd();
		// 세자리(최상위) 카테고리로 들어올 때 예) 001
		if (cateCd.length() == 3) {
			parentCateCd = cateCd;
			
			mav.addObject("product", dao.selectParentCategoryProduct(criteria));
		} 
		// 여섯자리(하위) 카테고리로 들어올 때 예)001001
		else if (cateCd.length() == 6) {
			parentCateCd = cateCd.substring(0, 3);
			if (criteria.getKeyword() != null) countProduct = dao.countProductForSearch(criteria.getKeyword());
			else countProduct = dao.countProduct(criteria.getCateCd());
			
			mav.addObject("product", dao.selectProductList(criteria));
		} 
		// 기타
		else {
			mav.addObject("product", dao.selectProductList(criteria));
		}
		
		List<Map<String, Object>> childCategory = dao.parentCategoryCountProduct(parentCateCd);
		
		// 최상위일때만 총 갯수 0으로 초기화 후 구하기
		if (cateCd.length() == 3) {
			countProduct = 0;
			for (int i=0; i<childCategory.size(); i++) {
				countProduct += (Long) childCategory.get(i).get("count");
			}
		}
		
		mav.addObject("parentCateCd", parentCateCd);
		mav.addObject("childCategory", childCategory);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(countProduct);
		
		mav.addObject("pageMaker", pageMaker);
		mav.addObject("countProduct", countProduct);
		
		return mav;
	}

	@Override
	public int countProduct(String category) {
		return dao.countProduct(category);
	}

	@Override
	public int countProductForSearch(String keyword) {
		return dao.countProductForSearch(keyword);
	}

	
	
	
	
}
