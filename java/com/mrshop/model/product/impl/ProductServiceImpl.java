package com.mrshop.model.product.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mrshop.model.product.ProductInfoVO;
import com.mrshop.model.product.ProductService;

@Service("productService")
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductInfoDAO productInfoDAO;

	// 관리자
	public int prdCheckID(ProductInfoVO vo) {
		return productInfoDAO.prdCheckID(vo);
	}

	// 물품 검색
	public List<ProductInfoVO> listSearchPrd(String sPrd, int start, int end) {
		return productInfoDAO.listSearchPrd(sPrd, start, end);
	}

	// 물품 검색 카운트
	public int countSearchPrd(String sPrd) {
		return productInfoDAO.countSearchPrd(sPrd);
	}

	public void insertProduct(ProductInfoVO vo) {
		productInfoDAO.insertProduct(vo);
	}

	// 품목 리스트
	public List<ProductInfoVO> getProductList(int start, int end, ProductInfoVO vo) {
		return productInfoDAO.getProductList(start, end, vo);
	}

	// 관리자 품목 리스트
	public List<ProductInfoVO> getAdminProductList(int start, int end, ProductInfoVO vo) {
		return productInfoDAO.getAdminProductList(start, end, vo);
	}

	// 품목 갯수 카운트
	public int getCountProduct(ProductInfoVO vo) {
		return productInfoDAO.getCountProduct(vo);
	}

	// 관리자 품목 갯수 카운트
	public int getAdminCountProduct(ProductInfoVO vo) {
		return productInfoDAO.getAdminCountProduct(vo);
	}

	// 품목 상세보기
	public ProductInfoVO productDetail(ProductInfoVO vo) {
		return productInfoDAO.productDetail(vo);
	}
}
