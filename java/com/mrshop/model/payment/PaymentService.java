package com.mrshop.model.payment;

import java.util.List;

public interface PaymentService {
	// 구매
	List<PaymentVO> getPaymentProduct(PaymentVO vo);
	
	// 장바구니 구매
	List<PaymentVO> cartPaymentProduct(PaymentVO vo);
	
	// 결제
	void insertPayment(PaymentVO vo);
	
	// 결제 후 장바구니 비우기
	void deleteCartPayment(PaymentVO vo);
}
