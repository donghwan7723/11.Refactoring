package com.model2.mvc.service.purchase.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.purchase.PurchaseDAO;

@Repository("purchaseDaoImpl")
public class PurchaseDaoImpl implements PurchaseDAO{

	//Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//Constructor
	public PurchaseDaoImpl() {
		System.out.println(this.getClass());
	}
	
	
	public Purchase findPurchase(int tranNo) throws Exception {
		System.out.println("PurchaseDaoImpl�� findPurchase �޼��� Come in......"+tranNo);
		return sqlSession.selectOne("PurchaseMapper.getPurchase", tranNo);
	}

	
	public void insertPurchase(Purchase purchase) throws Exception {
		System.out.println("PurchaseDaoImpl�� insertPurchase �޼��� Come in..........");
		sqlSession.insert("PurchaseMapper.insertPurchase", purchase);
	}

	
	public List<Purchase> getPurchaseList(Search search, String userId) throws Exception {
	
		System.out.println("PurchaseDaoImpl�� getPurchaseList �޼��� ������ ....");
		
		Map<String, Object> map = new HashMap<String, Object>();		
		map.put("search", search);
		map.put("userId", userId);

	
		System.out.println("PurchaseDaoImpl�� getPurchaseList �޼��� �� ....");
		
		return sqlSession.selectList("PurchaseMapper.getPurchaseList",map);
	}

	
	public void updatePurchase(Purchase purchase) throws Exception {
		System.out.println("PurchaseDaoImpl�� updatePurchase �޼��� Come in.....");
		System.out.println(purchase);
		sqlSession.update("PurchaseMapper.updatePurchase",purchase);
	}

	
	public void updateTranCode(Purchase purchase) throws Exception {
		System.out.println("PurchaseDaoImpl�� updateTranCode �޼��� Come in.......");
		sqlSession.update("PurchaseMapper.updateTranCode",purchase);
	}

	
	public int getTotalCount(String userId) throws Exception {
		System.out.println("getTotalCount �޼����� ������......");
		return sqlSession.selectOne("PurchaseMapper.getTotalCount", userId);
	}
	
}