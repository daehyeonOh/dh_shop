package com.devdh.shopping.home.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.devdh.shopping.home.domain.CategoryVO;
import com.devdh.shopping.product.domain.ProductVO;

@Repository
public class HomeDAOImpl implements HomeDAO {

	@Inject
	SqlSession sess;

	@Override
	public List<CategoryVO> getCategory() {
		return sess.selectList("home.getCategory");
	}

	@Override
	public List<ProductVO> selectShowMainProducts() {
		return sess.selectList("home.selectShowMainProducts");
	}

}
