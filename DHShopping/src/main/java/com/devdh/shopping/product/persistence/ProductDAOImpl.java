package com.devdh.shopping.product.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.devdh.shopping.commons.paging.ProductCriteria;
import com.devdh.shopping.product.domain.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Inject
	SqlSession sess;

	@Override
	public List<ProductVO> selectProductList(ProductCriteria criteria) {
		return sess.selectList("product.selectProductList", criteria);
	}

	@Override
	public int countProduct(String category) {
		return sess.selectOne("product.countProduct", category);
	}

	@Override
	public int countProductForSearch(String keyword) {
		return sess.selectOne("product.countProductForSearch", keyword);
	}

	@Override
	public List<Map<String, Object>> parentCategoryCountProduct(String parent) {
		return sess.selectList("product.parentCategoryCountProduct", parent);
	}

	@Override
	public List<ProductVO> selectParentCategoryProduct(ProductCriteria criteria) {
		return sess.selectList("product.selectParentCategoryProduct", criteria);
	}
	
}
