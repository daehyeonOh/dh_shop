package com.devdh.shopping.home.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.devdh.shopping.home.domain.CategoryVO;
import com.devdh.shopping.home.persistence.HomeDAO;
import com.devdh.shopping.product.domain.ProductVO;

@Service
public class HomeServiceImpl implements HomeService {

	@Inject
	HomeDAO dao;

	@Override
	@Cacheable(value="menuCache")
	public List<CategoryVO> getCategory() {
		List<CategoryVO> dbCategory = dao.getCategory();
		
		ArrayList<CategoryVO> parentCategory = new ArrayList<>();
		ArrayList<CategoryVO> childCategory = new ArrayList<>();
		// 부모 칼럼 자식 칼럼 분리
		for (int i=0; i<dbCategory.size(); i++) {
			if (dbCategory.get(i).getParent() == null) {
				parentCategory.add(dbCategory.get(i));
			} else {
				childCategory.add(dbCategory.get(i));
			}
		}
		
		for (int i=0; i<parentCategory.size(); i++) {
			ArrayList<CategoryVO> list = new ArrayList<>();
			for (int j=0; j<childCategory.size(); j++) {
				if (childCategory.get(j).getParent().equals(parentCategory.get(i).getCode())) {
					list.add(childCategory.get(j));
				}
			}
			parentCategory.get(i).setChild(list);
		}
		
		return parentCategory;
	}

	@Override
	public List<ProductVO> getMainProducts() {
		return dao.selectShowMainProducts();
	}

}
