package com.mrshop.model.payment.impl;

import java.util.List;

import org.bouncycastle.jcajce.provider.digest.SHA3;
import org.bouncycastle.util.encoders.Hex;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mrshop.model.payment.PaymentService;
import com.mrshop.model.payment.PaymentVO;

@Service("paymentService")
public class PaymentServiceImpl implements PaymentService {
	@Autowired
	private PaymentDAO paymentDAO;
	
	// 신용카드 정보 암호화
	public void securityCREDIT(PaymentVO vo) {
		SHA3.DigestSHA3 digestSHA3 = new SHA3.DigestSHA3(512);
		byte[] digest = digestSHA3.digest(vo.getCredit_number().getBytes());
		String securitycredit = Hex.toHexString(digest);
		vo.setCredit_number(securitycredit);
		System.out.println("SHA3-512: " + vo.getCredit_number());
	}
	
	// 구매
	public List<PaymentVO> getPaymentProduct(PaymentVO vo) {
		return paymentDAO.getPaymentProduct(vo);
	}
	
	// 장바구니 구매
	public List<PaymentVO> cartPaymentProduct(PaymentVO vo) {
		return paymentDAO.cartPaymentProduct(vo);
	}
	
	// 결제
	public void insertPayment(PaymentVO vo) {
		paymentDAO.insertPayment(vo);
	}
	
	public void deleteCartPayment(PaymentVO vo) {
		paymentDAO.deleteCartPayment(vo);
	}
}
